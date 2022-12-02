import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/models/purchase.dart';

final inAppPurchaseManagerProvider = ChangeNotifierProvider(
  (ref) => InAppPurchaseManager(),
);

class InAppPurchaseManager extends ChangeNotifier {
  static const donation1 = Product('donation_1', isConsumable: false);
  static const donation2 = Product('donation_2', isConsumable: false);
  static const donation5 = Product('donation_5', isConsumable: false);

  static const donationsIds = [donation1, donation2, donation5];
  static const productIds = [...donationsIds];

  final log = Logger('InAppPurchaseManager');
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

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

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    _purchaseStatuses.update(
      purchaseDetails.productID,
      (value) => [...value, purchaseDetails],
      ifAbsent: () => [purchaseDetails],
    );
    // if purchase is restored, we should update the UI
    if (purchaseDetails.status == PurchaseStatus.restored) {
      await deliverProduct(purchaseDetails);
    }
    notifyListeners();
  }

  bool get isSupported =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  Future<void> init() async {
    if (!isSupported) {
      log.w('Platform not supported: $defaultTargetPlatform');
      return;
    }
    final available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      log.w('InAppPurchase is not available');
      return;
    }
    _subscription = InAppPurchase.instance.purchaseStream.listen((purchases) {
      log.i('Purchases: ${purchases.map((e) => e.toDebugString()).toList()}');
      purchases.forEach(_handlePurchase);
    });

    await getPurchasedIds();
    unawaited(fetchProductDetails().timeout(const Duration(seconds: 5),
        onTimeout: () {
      log.w('Timeout while fetching products');
      return null;
    }));
    _isInitialized = true;
    notifyListeners();
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

  Future<void> fetchProductDetails() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      // The store cannot be reached or accessed. Update the UI accordingly.
      setProducts(const ProductDetailsState.unavailable());
      log.w('Store is unavailable');
      return;
    }
    final products = await InAppPurchase.instance.queryProductDetails(
      productIds.map((e) => e.id).toSet(),
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
    log.i('All products: ${details.map((e) => e.toDebugString()).toList()}');
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
      throw const StoreUnavailableException();
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
    if (kDebugMode) {
      log.i('Verifying purchase: ${purchaseDetails.toDebugString()}');
    }
    if (!kDebugMode) {
      return false;
    }
    return true;
  }

  Future<void> deliverProduct(PurchaseDetails purchase) async {
    if (!(purchase.status == PurchaseStatus.purchased ||
        purchase.status == PurchaseStatus.restored)) {
      throw PurchaseingError(purchase, 'Purchase not completed');
    }
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

  List<ProductDetails> getPurchasedProducts() {
    final ids = _purchasedIds;
    final products = _products.maybeWhen(
      products: (p) => p,
      orElse: () => <ProductDetails>[],
    );
    return products.where((e) => ids.contains(e.id)).toList();
  }

  bool isPurchased(String id) => _purchasedIds.contains(id);

  ProductDetails? productDetails(String productID) {
    return _products.whenOrNull(
      products: (products) => products.firstWhereOrNull(
        (element) => element.id == productID,
      ),
    );
  }

  int? _donationAmountOfProduct(ProductDetails productDetails) {
    final regex = RegExp(r'donation_(\d+)');
    final match = regex.firstMatch(productDetails.id);
    if (match == null) {
      return null;
    }
    return int.tryParse(match.group(1)!);
  }

  int amountDonated() {
    final purchased = getPurchasedProducts();
    final amount = purchased.fold<int>(
      0,
      (previousValue, e) => previousValue + (_donationAmountOfProduct(e) ?? 0),
    );
    return amount;
  }

  bool hasUnlockedFeature(InAppPaidFeature feature) {
    final donated = amountDonated();
    return donated >= feature.requiredAmount;
  }

  Future<void> clearPurchases() async {
    if (!kDebugMode) {
      throw Exception('Not in debug mode');
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_purchasedKey);
    _purchasedIds = [];
    notifyListeners();
  }

  Future<void> purchaseProductDebug(ProductDetails product) async {
    if (!kDebugMode) {
      throw Exception('Not in debug mode');
    }
    _purchasedIds = [..._purchasedIds, product.id];
    notifyListeners();
  }

  Future<void> showRedeemACodeSheet() async {
    if (Platform.isIOS) {
      final iosPlatformAddition = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.presentCodeRedemptionSheet();
    } else if (Platform.isAndroid) {
      throw Exception('Android not supported yet');
    } else {
      throw Exception('Unsupported platform');
    }
  }

  // transform "product name (Appp Name)" to "product name"
  static String productName(AppLocalizations localizations, ProductDetails p) {
    if (isProductADonation(p)) {
      return localizations.donation_of(p.price);
    }
    return p.title;
  }

  static bool isProductADonation(ProductDetails p) =>
      p.id.startsWith('donation_');
}

class InAppPurchaseException implements Exception {
  final String message;

  InAppPurchaseException(this.message);

  @override
  String toString() => 'InAppPurchaseException: $message';
}

class StoreUnavailableException implements InAppPurchaseException {
  const StoreUnavailableException();

  @override
  String get message => 'Store unavailable';
}

@immutable
class InAppPaidFeature {
  const InAppPaidFeature({
    required this.id,
    required this.title,
    required this.requiredAmount,
    this.description,
    this.icon,
  });

  final String id;
  final String title;
  final Widget? description;
  final Widget? icon;
  final int requiredAmount;

  static const customFonts = InAppPaidFeature(
    id: 'fonts',
    title: 'Fonts',
    requiredAmount: 1,
    description: Text('Use custom fonts in your notes'),
  );
}

extension PurchaseDetailsX on PurchaseDetails {
  String toDebugString() {
    return '''
    PurchaseDetails(
      status: $status,
      productID: $productID,
      verificationData: ${verificationData.toDebugString()},
      transactionDate: $transactionDate,
      pendingCompletePurchase: $pendingCompletePurchase,
      error: $error,
    )
    ''';
  }
}

class PurchaseingError extends Error {
  final PurchaseDetails purchaseDetails;
  final String? message;

  PurchaseingError(this.purchaseDetails, [this.message]);

  @override
  String toString() {
    return 'PurchaseingError{purchaseDetails: $purchaseDetails, message: $message}';
  }
}

extension PurchaseVerificationDataX on PurchaseVerificationData {
  String toDebugString() {
    return 'PurchaseVerificationData(source: $source, localVerificationData: $localVerificationData, serverVerificationData: $serverVerificationData)';
  }
}

/*   /// The identifier of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String id;

  /// The title of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String title;

  /// The description of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String description;

  /// The price of the product, formatted with currency symbol ("$0.99").
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String price;

  /// The unformatted price of the product, specified in the App Store Connect or Sku in Google Play console based on the platform.
  /// The currency unit for this value can be found in the [currencyCode] property.
  /// The value always describes full units of the currency. (e.g. 2.45 in the case of $2.45)
  final double rawPrice;

  /// The currency code for the price of the product.
  /// Based on the price specified in the App Store Connect or Sku in Google Play console based on the platform.
  final String currencyCode;

  /// The currency symbol for the locale, e.g. $ for US locale.
  ///
  /// When the currency symbol cannot be determined, the ISO 4217 currency code is returned.
  final String currencySymbol; */

extension ProductDetailsX on ProductDetails {
  String toDebugString() {
    return '''
    ProductDetails(
      id: $id,
      title: $title,
      description: $description,
      price: $price,
      rawPrice: $rawPrice,
      currencyCode: $currencyCode,
      currencySymbol: $currencySymbol,
    )
    ''';
  }
}
