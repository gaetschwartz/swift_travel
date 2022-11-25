import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/in_app_purchase.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/platform_button.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/responsive.dart';

class InAppPurchasesPage extends ConsumerStatefulWidget {
  const InAppPurchasesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InAppPurchasesPageState();
}

class _InAppPurchasesPageState extends ConsumerState<InAppPurchasesPage> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  final log = Logger('InAppPurchasePage');

  @override
  void initState() {
    super.initState();
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _listenToPurchaseUpdated,
    );
  }

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }

  Future<void> purchaseProduct(ProductDetails productDetails) async {
    try {
      await ref
          .read(inAppPurchaseManagerProvider.notifier)
          .purchaseProduct(productDetails);
    } on Exception catch (e, s) {
      reportDartError(e, s);
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
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  purchaseDetails.error!.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
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
          navigationBar: const SwiftCupertinoBar(),
          child: child!,
        ),
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).support_me),
        ),
        body: child,
      ),
      builder: (context, design) => _Main(onPurchase: purchaseProduct),
    );
  }
}

class _Main extends ConsumerStatefulWidget {
  const _Main({required this.onPurchase});

  final Future<void> Function(ProductDetails details) onPurchase;

  @override
  ConsumerState<_Main> createState() => _MainState();
}

class _MainState extends ConsumerState<_Main> {
  @override
  void initState() {
    super.initState();
    unawaited(
        ref.read(inAppPurchaseManagerProvider.notifier).fetchProductDetails());
  }

  @override
  Widget build(BuildContext context) {
    final inApp = ref.watch(inAppPurchaseManagerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(inAppPurchaseManagerProvider.notifier)
              .fetchProductDetails();
        },
        child: CustomScrollView(
          slivers: [
            SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppLocalizations.of(context).in_app_purchases_desc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Divider()),
            inApp.products.when(
              products: (data) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return _ProductTile(
                        product: data[i],
                        onPurchase: widget.onPurchase,
                      );
                    },
                    childCount: data.length,
                  ),
                );
              },
              iapError: (e) => SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    e.toString(),
                  ),
                ),
              ),
              unavailable: () => const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'The store is unavailable, please try again later',
                  ),
                ),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            // restore purchases
            const SliverGap(16),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: PlatformButton(
                      child: Text(AppLocalizations.of(context)
                          .in_app_purchases_restore),
                      onPressed: () async {
                        await ref
                            .read(inAppPurchaseManagerProvider.notifier)
                            .restorePurchases();
                      },
                    ),
                  ),
                  Expanded(
                    child: PlatformButton(
                      onPressed: () async {
                        await ref
                            .read(inAppPurchaseManagerProvider.notifier)
                            .showRedeemACodeSheet();
                      },
                      child: Text(
                        AppLocalizations.of(context).redeem_code,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (Env.isDebugMode)
              SliverToBoxAdapter(
                child: PlatformButton(
                  onPressed: () async {
                    await ref
                        .read(inAppPurchaseManagerProvider.notifier)
                        .clearPurchases();
                  },
                  child: const Text('(DEBUG) Clear purchases'),
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
      contentPadding: const EdgeInsets.only(right: 16),
      title: Text(InAppPurchaseManager.productName(
        AppLocalizations.of(context),
        product,
      )),
      subtitle: InAppPurchaseManager.isProductADonation(product)
          ? null
          : Text(product.description),
      dense: true,
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
      onLongPress: kDebugMode
          ? () async {
              await ref
                  .read(inAppPurchaseManagerProvider.notifier)
                  .purchaseProductDebug(product);
            }
          : null,
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(16),
            Text(
              AppLocalizations.of(context).thank_you_for_purchase,
              style: Theme.of(context).textTheme.bodyLarge,
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

Future<void> showProDialog(BuildContext context) async {
  if (!isThemeDarwin(context)) {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            AppLocalizations.of(context).that_is_required('Swift Travel Pro')),
        content: Text(AppLocalizations.of(context).in_app_purchases_desc),
        actions: [
          TextButton(
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(AppLocalizations.of(context).open),
            onPressed: () async {
              Navigator.of(context).pop();
              await Navigator.of(context).push(PlatformPageRoute(
                builder: (_) => const InAppPurchasesPage(),
                title: AppLocalizations.of(context).in_app_purchases,
              ));
            },
          ),
        ],
      ),
    );
  } else {
    await showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
            AppLocalizations.of(context).that_is_required('Swift Travel Pro')),
        content: Text(AppLocalizations.of(context).in_app_purchases_desc),
        actions: [
          TextButton(
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(AppLocalizations.of(context).open),
            onPressed: () async {
              Navigator.of(context).pop();
              await Navigator.of(context).push(PlatformPageRoute(
                builder: (_) => const InAppPurchasesPage(),
                title: AppLocalizations.of(context).in_app_purchases,
              ));
            },
          ),
        ],
      ),
    );
  }
}
