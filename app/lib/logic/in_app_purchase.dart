import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/models/purchase.dart';

final inAppPurchaseManagerProvider = ChangeNotifierProvider(
  (ref) => InAppPurchaseManager()..init(),
);

class InAppPurchaseManager extends ChangeNotifier {
  static const donation1 = Product('donation_1', isConsumable: false);
  static const donation2 = Product('donation_2', isConsumable: false);
  static const donation5 = Product('donation_5', isConsumable: false);

  static const donationsIds = [donation1, donation2, donation5];
  static const productIds = [...donationsIds];

  final log = Logger('InAppPurchaseManager');

  StreamSubscription<List<PurchaseDetails>>? _subscription;

  final _purchaseStatuses = <String, List<PurchaseDetails>>{};
  ProductDetailsState _products = const ProductDetailsState.loading();
  List<String> _purchasedIds = [];

  ProductDetailsState get products => _products;

  bool hasProductBeenPurchased(String productId) {
    final purchases = _purchaseStatuses[productId];
    return purchases?.any((e) => e.status == PurchaseStatus.purchased) ?? false;
  }

  PurchaseStatus? getPurchaseStatus(String productId) {
    final purchases = _purchaseStatuses[productId];
    return purchases?.lastOrNull?.status;
  }

  void _addPurchase(PurchaseDetails purchaseDetails) {
    _purchaseStatuses.update(
      purchaseDetails.productID,
      (value) => [...value, purchaseDetails],
      ifAbsent: () => [purchaseDetails],
    );
    notifyListeners();
  }

  Future<void> init() async {
    _subscription = InAppPurchase.instance.purchaseStream.listen((purchases) {
      log.i('Purchases: $purchases');
      purchases.forEach(_addPurchase);
    });
    await getProducts();
    await getPurchasedIds();
  }

  Stream<List<PurchaseDetails>> purchaseStreamOfProduct(String productId) =>
      InAppPurchase.instance.purchaseStream.map(
        (p) => p.where((e) => e.productID == productId).toList(),
      );

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  void setProducts(ProductDetailsState products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      // The store cannot be reached or accessed. Update the UI accordingly.
      setProducts(const ProductDetailsState.unavailable());
      return;
    }
    final products = await InAppPurchase.instance.queryProductDetails(
      InAppPurchaseManager.productIds.map((e) => e.id).toSet(),
    );
    if (products.notFoundIDs.isNotEmpty) {
      log.w('Products not found: ${products.notFoundIDs}');
    }
    if (products.error != null) {
      log.e('Error: ${products.error}');
      setProducts(ProductDetailsState.iapError(products.error!));
      return;
    }
    final details = products.productDetails;
    log.i('Donation products: $details');
    setProducts(ProductDetailsState.products(details));
  }

  bool _isConsumable(ProductDetails product) {
    return productIds
        .firstWhere((element) => element.id == product.id)
        .isConsumable;
  }

  Future<void> purchaseProduct(ProductDetails product) async {
    final purchaseParam = PurchaseParam(productDetails: product);
    final available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      // The store cannot be reached or accessed. Update the UI accordingly.
      log.w('The store cannot be reached or accessed.');
      throw Exception('The store cannot be reached or accessed.');
    }
    if (_isConsumable(product)) {
      unawaited(
        InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam),
      );
    } else {
      unawaited(InAppPurchase.instance
          .buyNonConsumable(purchaseParam: purchaseParam));
    }
  }

  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  static const _purchasedKey = 'InAppPurchaseManager_purchased';

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (!kDebugMode) {
      return false;
    }
    return true;
  }

  Future<void> deliverProduct(PurchaseDetails purchase) async {
    final prefs = await SharedPreferences.getInstance();
    final purchased = prefs.getStringList(_purchasedKey) ?? [];
    if (purchased.contains(purchase.productID)) {
      return;
    }
    final newPurchased = [...purchased, purchase.productID];
    _purchasedIds = newPurchased;
    notifyListeners();
    await prefs.setStringList(_purchasedKey, newPurchased);
  }

  Future<List<String>> getPurchasedIds() async {
    final prefs = await SharedPreferences.getInstance();
    final p = prefs.getStringList(_purchasedKey) ?? [];
    _purchasedIds = p;
    notifyListeners();
    return p;
  }

  bool isPurchased(String id) => _purchasedIds.contains(id);
}
