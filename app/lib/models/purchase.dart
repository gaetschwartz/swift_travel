import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'purchase.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product(
    String id, {
    required bool isConsumable,
  }) = _Product;
}

@freezed
class PurchasedProduct with _$PurchasedProduct {
  const factory PurchasedProduct(
    String productId,
    PurchaseDetails purchaseDetails,
  ) = _PurchasedProduct;
}

@freezed
class ProductDetailsState with _$ProductDetailsState {
  // loading
  const factory ProductDetailsState.loading() = _ProductDetailsStateLoading;
  const factory ProductDetailsState.unavailable() =
      _ProductDetailsStateUnavailable;
  // inapp error
  const factory ProductDetailsState.iapError(IAPError error) = _IapError;
  // products
  const factory ProductDetailsState.products(List<ProductDetails> products) =
      _Products;
}

@freezed
class PurchaseState with _$PurchaseState {
  // general error
  const factory PurchaseState.error(PurchaseStateError error) =
      _PurchaseStateError;
  // products
  const factory PurchaseState.success() = _PurchaseStateSuccess;
  // loading
  const factory PurchaseState.loading() = _PurchaseStateLoading;
  // pending
  const factory PurchaseState.pending(PurchaseDetails purchase) =
      _PurchaseStatePending;
  // invalid
  const factory PurchaseState.invalid(PurchaseDetails purchase) =
      _PurchaseStateInvalid;

  const PurchaseState._();
}

@freezed
class PurchaseStateError with _$PurchaseStateError {
  const factory PurchaseStateError.iapError(IAPError error) =
      _PurchaseStateErrorIapError;
  const factory PurchaseStateError.generalError(
      Object error, StackTrace stackTrace) = _PurchaseStateErrorGeneralError;
}
