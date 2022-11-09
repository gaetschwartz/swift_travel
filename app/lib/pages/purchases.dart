import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/in_app_purchase.dart';
import 'package:swift_travel/models/purchase.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

class InAppPurchasesPage extends StatefulWidget {
  const InAppPurchasesPage({super.key});

  @override
  State<StatefulWidget> createState() => _InAppPurchasesPageState();
}

class _InAppPurchasesPageState extends State<InAppPurchasesPage> {
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
      builder: (context, design) => const _Main(),
    );
  }
}

class _Main extends ConsumerWidget {
  const _Main();

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
                      return _ProductTile(product: data[i]);
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
  });

  final ProductDetails product;

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
        if (isThemeDarwin(context)) {
          await showCupertinoModalBottomSheet<void>(
            context: context,
            builder: (_) => _InAppPurchaseDialog(product),
            isDismissible: false,
            backgroundColor: Colors.transparent,
            expand: false,
          );
        } else {
          await showMaterialModalBottomSheet<void>(
            context: context,
            builder: (_) => _InAppPurchaseDialog(product),
            isDismissible: false,
            backgroundColor: Colors.transparent,
            expand: false,
          );
        }
      },
    );
  }
}

class _InAppPurchaseDialog extends ConsumerStatefulWidget {
  const _InAppPurchaseDialog(this.product);

  final ProductDetails product;

  @override
  ConsumerState<_InAppPurchaseDialog> createState() =>
      _InAppPurchaseDialogState();
}

class _InAppPurchaseDialogState extends ConsumerState<_InAppPurchaseDialog> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  final log = Logger('InAppPurchaseDialog');

  PurchaseState _state = const PurchaseState.loading();

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
    unawaited(
      ref
          .read(inAppPurchaseManagerProvider.notifier)
          .purchaseProduct(widget.product)
          .catchError((Object e, StackTrace s) {
        log.e('Error while purchasing', stackTrace: s);
        setState(() {
          _state = PurchaseState.error(PurchaseStateError.generalError(e, s));
        });
      }),
    );
  }

  Future<void> _listenToPurchaseUpdated(List<PurchaseDetails> details) async {
    if (details.length > 1) {
      log.w('More than one purchase at a time');
    }
    for (final purchaseDetails in details) {
      log.i('Purchase updated: ${purchaseDetails.toDebugString()}');
      if (purchaseDetails.status == PurchaseStatus.pending) {
        setState(() => _state = PurchaseState.pending(purchaseDetails));
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          setState(() => _state = PurchaseState.error(
              PurchaseStateError.iapError(purchaseDetails.error!)));
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final manager = ref.read(inAppPurchaseManagerProvider.notifier);
          final valid = await manager.verifyPurchase(purchaseDetails);
          if (valid) {
            await manager.deliverProduct(purchaseDetails);
            // show a thank you page
            setState(() => _state = const PurchaseState.success());
          } else {
            setState(() => _state = PurchaseState.invalid(purchaseDetails));
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // display a bottom sheet
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      height: MediaQuery.of(context).size.height * 0.375,
      child: _state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        pending: (details) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Purchase pending...',
                  style: Theme.of(context).textTheme.titleLarge),
              const Gap(8),
              const CircularProgressIndicator(),
            ],
          );
        },
        success: () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Purchase successful!',
                  style: Theme.of(context).textTheme.titleLarge),
              const Gap(8),
              Text('Thank you so much for supporting the app!',
                  style: Theme.of(context).textTheme.titleSmall),
              const Gap(8),
              CupertinoButton(
                child: Text(AppLocalizations.of(context).close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
        error: (error) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Purchase failed',
                  style: Theme.of(context).textTheme.titleLarge),
              const Gap(8),
              Text(error.toString(),
                  style: Theme.of(context).textTheme.titleSmall),
              const Gap(8),
              CupertinoButton(
                child: Text(AppLocalizations.of(context).close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
        invalid: (details) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Purchase failed',
                  style: Theme.of(context).textTheme.titleLarge),
              const Gap(8),
              Text('The purchase is invalid',
                  style: Theme.of(context).textTheme.titleSmall),
              const Gap(8),
              CupertinoButton(
                child: Text(AppLocalizations.of(context).close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
