import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/in_app_purchase.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';

class InAppPurchasesPage extends ConsumerStatefulWidget {
  const InAppPurchasesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InAppPurchasesPageState();
}

class _InAppPurchasesPageState extends ConsumerState<InAppPurchasesPage> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  final log = Logger('InAppPurchaseDialog');

  @override
  void initState() {
    super.initState();
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _listenToPurchaseUpdated,
      onDone: () {
        unawaited(_subscription.cancel());
      },
      onError: (error) {
        // handle error here.
      },
    );
  }

  Future<void> purchaseProduct(ProductDetails productDetails) async {
    try {
      await ref
          .read(inAppPurchaseManagerProvider.notifier)
          .purchaseProduct(productDetails);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error while purchasing: $e');
      }
      // TODO: Show error
    }
  }

  Future<void> _listenToPurchaseUpdated(List<PurchaseDetails> details) async {
    if (details.length > 1) {
      log.w('More than one purchase at a time');
    }
    for (final purchaseDetails in details) {
      log.i('Purchase updated: ${purchaseDetails.toDebugString()}');
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // TODO: Show loading
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // TODO: Show better error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                purchaseDetails.error!.message,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final manager = ref.read(inAppPurchaseManagerProvider.notifier);
          final valid = await manager.verifyPurchase(purchaseDetails);
          if (valid) {
            await manager.deliverProduct(purchaseDetails);
            // show a thank you page
            if (mounted) {
              // thank you dialog
              await showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) {
                    return _SuccessfulPurchaseWidget(
                      purchaseDetails: purchaseDetails,
                      productDetails: ref
                          .read(inAppPurchaseManagerProvider)
                          .productDetails(purchaseDetails.productID)!,
                    );
                  });
            }
          } else {
            // TODO: Show better invalid purchase message
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Invalid purchase',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: SwiftCupertinoBar(
            middle: Text(AppLocalizations.of(context).settings),
          ),
          child: child!,
        ),
      ),
      materialBuilder: (context, child) => Scaffold(body: child),
      builder: (context, design) => _Main(onPurchase: purchaseProduct),
    );
  }
}

class _SuccessfulPurchaseWidget extends StatelessWidget {
  final PurchaseDetails purchaseDetails;
  final ProductDetails productDetails;

  const _SuccessfulPurchaseWidget({
    required this.purchaseDetails,
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(16),
            Text(
              '${AppLocalizations.of(context).purchase_success} ☺️',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Gap(16),
            Text(
              AppLocalizations.of(context).thank_you_for_purchase,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Gap(16),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context).close),
            ),
          ],
        ),
      ),
    );
  }
}

class _Main extends ConsumerWidget {
  const _Main({required this.onPurchase});

  final Future<void> Function(ProductDetails details) onPurchase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inApp = ref.watch(inAppPurchaseManagerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await ref.read(inAppPurchaseManagerProvider.notifier).getProducts();
        },
        child: CustomScrollView(
          slivers: [
            SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(
                child: Text(
                  'In-App Purchases',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SliverGap(16),
            SliverToBoxAdapter(
              child: Text(
                'You can support the development of this app by purchasing one of the following products. ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            inApp.products.when(
              products: (data) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return _ProductTile(
                        product: data[i],
                        onPurchase: onPurchase,
                      );
                    },
                    childCount: data.length,
                  ),
                );
              },
              iapError: (e) => SliverToBoxAdapter(
                child: Text(
                  e.toString(),
                ),
              ),
              unavailable: () => const SliverToBoxAdapter(
                child: Text(
                  'The store is unavailable, please try again later',
                ),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            // restore purchases
            const SliverGap(16),
            SliverToBoxAdapter(
              child: Text(
                'Restore purchases',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            SliverToBoxAdapter(
              child: Text(
                'If you have already purchased one of the above products, you can restore it here. ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SliverGap(8),
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(inAppPurchaseManagerProvider.notifier)
                      .restorePurchases();
                },
                child: const Text('Restore purchases'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductTile extends ConsumerWidget {
  const _ProductTile({
    required this.product,
    required this.onPurchase,
  });

  final ProductDetails product;
  final Future<void> Function(ProductDetails details) onPurchase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(inAppPurchaseManagerProvider.notifier);
    final purchased = manager.isPurchased(product.id);
    return ListTile(
      title: Text(product.title),
      subtitle: Text(product.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(product.price),
          if (purchased) ...[
            const Gap(8),
            const Icon(Icons.check_circle, color: Colors.green),
          ]
        ],
      ),
      onTap: () async {
        await onPurchase(product);
      },
    );
  }
}
