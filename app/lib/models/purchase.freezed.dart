// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  bool get isConsumable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({String id, bool isConsumable});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isConsumable = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isConsumable: null == isConsumable
          ? _value.isConsumable
          : isConsumable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool isConsumable});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isConsumable = null,
  }) {
    return _then(_$_Product(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isConsumable: null == isConsumable
          ? _value.isConsumable
          : isConsumable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Product implements _Product {
  const _$_Product(this.id, {required this.isConsumable});

  @override
  final String id;
  @override
  final bool isConsumable;

  @override
  String toString() {
    return 'Product(id: $id, isConsumable: $isConsumable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isConsumable, isConsumable) ||
                other.isConsumable == isConsumable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isConsumable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(final String id, {required final bool isConsumable}) =
      _$_Product;

  @override
  String get id;
  @override
  bool get isConsumable;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchasedProduct {
  String get productId => throw _privateConstructorUsedError;
  PurchaseDetails get purchaseDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasedProductCopyWith<PurchasedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedProductCopyWith<$Res> {
  factory $PurchasedProductCopyWith(
          PurchasedProduct value, $Res Function(PurchasedProduct) then) =
      _$PurchasedProductCopyWithImpl<$Res, PurchasedProduct>;
  @useResult
  $Res call({String productId, PurchaseDetails purchaseDetails});
}

/// @nodoc
class _$PurchasedProductCopyWithImpl<$Res, $Val extends PurchasedProduct>
    implements $PurchasedProductCopyWith<$Res> {
  _$PurchasedProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? purchaseDetails = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDetails: null == purchaseDetails
          ? _value.purchaseDetails
          : purchaseDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasedProductCopyWith<$Res>
    implements $PurchasedProductCopyWith<$Res> {
  factory _$$_PurchasedProductCopyWith(
          _$_PurchasedProduct value, $Res Function(_$_PurchasedProduct) then) =
      __$$_PurchasedProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, PurchaseDetails purchaseDetails});
}

/// @nodoc
class __$$_PurchasedProductCopyWithImpl<$Res>
    extends _$PurchasedProductCopyWithImpl<$Res, _$_PurchasedProduct>
    implements _$$_PurchasedProductCopyWith<$Res> {
  __$$_PurchasedProductCopyWithImpl(
      _$_PurchasedProduct _value, $Res Function(_$_PurchasedProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? purchaseDetails = null,
  }) {
    return _then(_$_PurchasedProduct(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      null == purchaseDetails
          ? _value.purchaseDetails
          : purchaseDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$_PurchasedProduct implements _PurchasedProduct {
  const _$_PurchasedProduct(this.productId, this.purchaseDetails);

  @override
  final String productId;
  @override
  final PurchaseDetails purchaseDetails;

  @override
  String toString() {
    return 'PurchasedProduct(productId: $productId, purchaseDetails: $purchaseDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasedProduct &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.purchaseDetails, purchaseDetails) ||
                other.purchaseDetails == purchaseDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, purchaseDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasedProductCopyWith<_$_PurchasedProduct> get copyWith =>
      __$$_PurchasedProductCopyWithImpl<_$_PurchasedProduct>(this, _$identity);
}

abstract class _PurchasedProduct implements PurchasedProduct {
  const factory _PurchasedProduct(
          final String productId, final PurchaseDetails purchaseDetails) =
      _$_PurchasedProduct;

  @override
  String get productId;
  @override
  PurchaseDetails get purchaseDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasedProductCopyWith<_$_PurchasedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() unavailable,
    required TResult Function(IAPError error) iapError,
    required TResult Function(List<ProductDetails> products) products,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? unavailable,
    TResult? Function(IAPError error)? iapError,
    TResult? Function(List<ProductDetails> products)? products,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? unavailable,
    TResult Function(IAPError error)? iapError,
    TResult Function(List<ProductDetails> products)? products,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductDetailsStateLoading value) loading,
    required TResult Function(_ProductDetailsStateUnavailable value)
        unavailable,
    required TResult Function(_IapError value) iapError,
    required TResult Function(_Products value) products,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductDetailsStateLoading value)? loading,
    TResult? Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult? Function(_IapError value)? iapError,
    TResult? Function(_Products value)? products,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductDetailsStateLoading value)? loading,
    TResult Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult Function(_IapError value)? iapError,
    TResult Function(_Products value)? products,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProductDetailsStateLoadingCopyWith<$Res> {
  factory _$$_ProductDetailsStateLoadingCopyWith(
          _$_ProductDetailsStateLoading value,
          $Res Function(_$_ProductDetailsStateLoading) then) =
      __$$_ProductDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductDetailsStateLoadingCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res,
        _$_ProductDetailsStateLoading>
    implements _$$_ProductDetailsStateLoadingCopyWith<$Res> {
  __$$_ProductDetailsStateLoadingCopyWithImpl(
      _$_ProductDetailsStateLoading _value,
      $Res Function(_$_ProductDetailsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProductDetailsStateLoading implements _ProductDetailsStateLoading {
  const _$_ProductDetailsStateLoading();

  @override
  String toString() {
    return 'ProductDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() unavailable,
    required TResult Function(IAPError error) iapError,
    required TResult Function(List<ProductDetails> products) products,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? unavailable,
    TResult? Function(IAPError error)? iapError,
    TResult? Function(List<ProductDetails> products)? products,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? unavailable,
    TResult Function(IAPError error)? iapError,
    TResult Function(List<ProductDetails> products)? products,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductDetailsStateLoading value) loading,
    required TResult Function(_ProductDetailsStateUnavailable value)
        unavailable,
    required TResult Function(_IapError value) iapError,
    required TResult Function(_Products value) products,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductDetailsStateLoading value)? loading,
    TResult? Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult? Function(_IapError value)? iapError,
    TResult? Function(_Products value)? products,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductDetailsStateLoading value)? loading,
    TResult Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult Function(_IapError value)? iapError,
    TResult Function(_Products value)? products,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ProductDetailsStateLoading implements ProductDetailsState {
  const factory _ProductDetailsStateLoading() = _$_ProductDetailsStateLoading;
}

/// @nodoc
abstract class _$$_ProductDetailsStateUnavailableCopyWith<$Res> {
  factory _$$_ProductDetailsStateUnavailableCopyWith(
          _$_ProductDetailsStateUnavailable value,
          $Res Function(_$_ProductDetailsStateUnavailable) then) =
      __$$_ProductDetailsStateUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductDetailsStateUnavailableCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res,
        _$_ProductDetailsStateUnavailable>
    implements _$$_ProductDetailsStateUnavailableCopyWith<$Res> {
  __$$_ProductDetailsStateUnavailableCopyWithImpl(
      _$_ProductDetailsStateUnavailable _value,
      $Res Function(_$_ProductDetailsStateUnavailable) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProductDetailsStateUnavailable
    implements _ProductDetailsStateUnavailable {
  const _$_ProductDetailsStateUnavailable();

  @override
  String toString() {
    return 'ProductDetailsState.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailsStateUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() unavailable,
    required TResult Function(IAPError error) iapError,
    required TResult Function(List<ProductDetails> products) products,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? unavailable,
    TResult? Function(IAPError error)? iapError,
    TResult? Function(List<ProductDetails> products)? products,
  }) {
    return unavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? unavailable,
    TResult Function(IAPError error)? iapError,
    TResult Function(List<ProductDetails> products)? products,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductDetailsStateLoading value) loading,
    required TResult Function(_ProductDetailsStateUnavailable value)
        unavailable,
    required TResult Function(_IapError value) iapError,
    required TResult Function(_Products value) products,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductDetailsStateLoading value)? loading,
    TResult? Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult? Function(_IapError value)? iapError,
    TResult? Function(_Products value)? products,
  }) {
    return unavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductDetailsStateLoading value)? loading,
    TResult Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult Function(_IapError value)? iapError,
    TResult Function(_Products value)? products,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class _ProductDetailsStateUnavailable implements ProductDetailsState {
  const factory _ProductDetailsStateUnavailable() =
      _$_ProductDetailsStateUnavailable;
}

/// @nodoc
abstract class _$$_IapErrorCopyWith<$Res> {
  factory _$$_IapErrorCopyWith(
          _$_IapError value, $Res Function(_$_IapError) then) =
      __$$_IapErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({IAPError error});
}

/// @nodoc
class __$$_IapErrorCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$_IapError>
    implements _$$_IapErrorCopyWith<$Res> {
  __$$_IapErrorCopyWithImpl(
      _$_IapError _value, $Res Function(_$_IapError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_IapError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError,
    ));
  }
}

/// @nodoc

class _$_IapError implements _IapError {
  const _$_IapError(this.error);

  @override
  final IAPError error;

  @override
  String toString() {
    return 'ProductDetailsState.iapError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IapError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IapErrorCopyWith<_$_IapError> get copyWith =>
      __$$_IapErrorCopyWithImpl<_$_IapError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() unavailable,
    required TResult Function(IAPError error) iapError,
    required TResult Function(List<ProductDetails> products) products,
  }) {
    return iapError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? unavailable,
    TResult? Function(IAPError error)? iapError,
    TResult? Function(List<ProductDetails> products)? products,
  }) {
    return iapError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? unavailable,
    TResult Function(IAPError error)? iapError,
    TResult Function(List<ProductDetails> products)? products,
    required TResult orElse(),
  }) {
    if (iapError != null) {
      return iapError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductDetailsStateLoading value) loading,
    required TResult Function(_ProductDetailsStateUnavailable value)
        unavailable,
    required TResult Function(_IapError value) iapError,
    required TResult Function(_Products value) products,
  }) {
    return iapError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductDetailsStateLoading value)? loading,
    TResult? Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult? Function(_IapError value)? iapError,
    TResult? Function(_Products value)? products,
  }) {
    return iapError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductDetailsStateLoading value)? loading,
    TResult Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult Function(_IapError value)? iapError,
    TResult Function(_Products value)? products,
    required TResult orElse(),
  }) {
    if (iapError != null) {
      return iapError(this);
    }
    return orElse();
  }
}

abstract class _IapError implements ProductDetailsState {
  const factory _IapError(final IAPError error) = _$_IapError;

  IAPError get error;
  @JsonKey(ignore: true)
  _$$_IapErrorCopyWith<_$_IapError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProductsCopyWith<$Res> {
  factory _$$_ProductsCopyWith(
          _$_Products value, $Res Function(_$_Products) then) =
      __$$_ProductsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductDetails> products});
}

/// @nodoc
class __$$_ProductsCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$_Products>
    implements _$$_ProductsCopyWith<$Res> {
  __$$_ProductsCopyWithImpl(
      _$_Products _value, $Res Function(_$_Products) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$_Products(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
    ));
  }
}

/// @nodoc

class _$_Products implements _Products {
  const _$_Products(final List<ProductDetails> products) : _products = products;

  final List<ProductDetails> _products;
  @override
  List<ProductDetails> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductDetailsState.products(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Products &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsCopyWith<_$_Products> get copyWith =>
      __$$_ProductsCopyWithImpl<_$_Products>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() unavailable,
    required TResult Function(IAPError error) iapError,
    required TResult Function(List<ProductDetails> products) products,
  }) {
    return products(this.products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? unavailable,
    TResult? Function(IAPError error)? iapError,
    TResult? Function(List<ProductDetails> products)? products,
  }) {
    return products?.call(this.products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? unavailable,
    TResult Function(IAPError error)? iapError,
    TResult Function(List<ProductDetails> products)? products,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this.products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductDetailsStateLoading value) loading,
    required TResult Function(_ProductDetailsStateUnavailable value)
        unavailable,
    required TResult Function(_IapError value) iapError,
    required TResult Function(_Products value) products,
  }) {
    return products(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductDetailsStateLoading value)? loading,
    TResult? Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult? Function(_IapError value)? iapError,
    TResult? Function(_Products value)? products,
  }) {
    return products?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductDetailsStateLoading value)? loading,
    TResult Function(_ProductDetailsStateUnavailable value)? unavailable,
    TResult Function(_IapError value)? iapError,
    TResult Function(_Products value)? products,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this);
    }
    return orElse();
  }
}

abstract class _Products implements ProductDetailsState {
  const factory _Products(final List<ProductDetails> products) = _$_Products;

  List<ProductDetails> get products;
  @JsonKey(ignore: true)
  _$$_ProductsCopyWith<_$_Products> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PurchaseStateIapErrorCopyWith<$Res> {
  factory _$$_PurchaseStateIapErrorCopyWith(_$_PurchaseStateIapError value,
          $Res Function(_$_PurchaseStateIapError) then) =
      __$$_PurchaseStateIapErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({IAPError error});
}

/// @nodoc
class __$$_PurchaseStateIapErrorCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStateIapError>
    implements _$$_PurchaseStateIapErrorCopyWith<$Res> {
  __$$_PurchaseStateIapErrorCopyWithImpl(_$_PurchaseStateIapError _value,
      $Res Function(_$_PurchaseStateIapError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_PurchaseStateIapError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError,
    ));
  }
}

/// @nodoc

class _$_PurchaseStateIapError implements _PurchaseStateIapError {
  const _$_PurchaseStateIapError(this.error);

  @override
  final IAPError error;

  @override
  String toString() {
    return 'PurchaseState.iapError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseStateIapError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseStateIapErrorCopyWith<_$_PurchaseStateIapError> get copyWith =>
      __$$_PurchaseStateIapErrorCopyWithImpl<_$_PurchaseStateIapError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return iapError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return iapError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (iapError != null) {
      return iapError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return iapError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return iapError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (iapError != null) {
      return iapError(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateIapError implements PurchaseState {
  const factory _PurchaseStateIapError(final IAPError error) =
      _$_PurchaseStateIapError;

  IAPError get error;
  @JsonKey(ignore: true)
  _$$_PurchaseStateIapErrorCopyWith<_$_PurchaseStateIapError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PurchaseStateErrorCopyWith<$Res> {
  factory _$$_PurchaseStateErrorCopyWith(_$_PurchaseStateError value,
          $Res Function(_$_PurchaseStateError) then) =
      __$$_PurchaseStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$_PurchaseStateErrorCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStateError>
    implements _$$_PurchaseStateErrorCopyWith<$Res> {
  __$$_PurchaseStateErrorCopyWithImpl(
      _$_PurchaseStateError _value, $Res Function(_$_PurchaseStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$_PurchaseStateError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$_PurchaseStateError implements _PurchaseStateError {
  const _$_PurchaseStateError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PurchaseState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseStateErrorCopyWith<_$_PurchaseStateError> get copyWith =>
      __$$_PurchaseStateErrorCopyWithImpl<_$_PurchaseStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateError implements PurchaseState {
  const factory _PurchaseStateError(
      final Object error, final StackTrace stackTrace) = _$_PurchaseStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$_PurchaseStateErrorCopyWith<_$_PurchaseStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PurchaseStateSuccessCopyWith<$Res> {
  factory _$$_PurchaseStateSuccessCopyWith(_$_PurchaseStateSuccess value,
          $Res Function(_$_PurchaseStateSuccess) then) =
      __$$_PurchaseStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PurchaseStateSuccessCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStateSuccess>
    implements _$$_PurchaseStateSuccessCopyWith<$Res> {
  __$$_PurchaseStateSuccessCopyWithImpl(_$_PurchaseStateSuccess _value,
      $Res Function(_$_PurchaseStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PurchaseStateSuccess implements _PurchaseStateSuccess {
  const _$_PurchaseStateSuccess();

  @override
  String toString() {
    return 'PurchaseState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PurchaseStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateSuccess implements PurchaseState {
  const factory _PurchaseStateSuccess() = _$_PurchaseStateSuccess;
}

/// @nodoc
abstract class _$$_PurchaseStateLoadingCopyWith<$Res> {
  factory _$$_PurchaseStateLoadingCopyWith(_$_PurchaseStateLoading value,
          $Res Function(_$_PurchaseStateLoading) then) =
      __$$_PurchaseStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PurchaseStateLoadingCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStateLoading>
    implements _$$_PurchaseStateLoadingCopyWith<$Res> {
  __$$_PurchaseStateLoadingCopyWithImpl(_$_PurchaseStateLoading _value,
      $Res Function(_$_PurchaseStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PurchaseStateLoading implements _PurchaseStateLoading {
  const _$_PurchaseStateLoading();

  @override
  String toString() {
    return 'PurchaseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PurchaseStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateLoading implements PurchaseState {
  const factory _PurchaseStateLoading() = _$_PurchaseStateLoading;
}

/// @nodoc
abstract class _$$_PurchaseStatePendingCopyWith<$Res> {
  factory _$$_PurchaseStatePendingCopyWith(_$_PurchaseStatePending value,
          $Res Function(_$_PurchaseStatePending) then) =
      __$$_PurchaseStatePendingCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseDetails purchase});
}

/// @nodoc
class __$$_PurchaseStatePendingCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStatePending>
    implements _$$_PurchaseStatePendingCopyWith<$Res> {
  __$$_PurchaseStatePendingCopyWithImpl(_$_PurchaseStatePending _value,
      $Res Function(_$_PurchaseStatePending) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
  }) {
    return _then(_$_PurchaseStatePending(
      null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$_PurchaseStatePending implements _PurchaseStatePending {
  const _$_PurchaseStatePending(this.purchase);

  @override
  final PurchaseDetails purchase;

  @override
  String toString() {
    return 'PurchaseState.pending(purchase: $purchase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseStatePending &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseStatePendingCopyWith<_$_PurchaseStatePending> get copyWith =>
      __$$_PurchaseStatePendingCopyWithImpl<_$_PurchaseStatePending>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return pending(purchase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return pending?.call(purchase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(purchase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStatePending implements PurchaseState {
  const factory _PurchaseStatePending(final PurchaseDetails purchase) =
      _$_PurchaseStatePending;

  PurchaseDetails get purchase;
  @JsonKey(ignore: true)
  _$$_PurchaseStatePendingCopyWith<_$_PurchaseStatePending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PurchaseStateInvalidCopyWith<$Res> {
  factory _$$_PurchaseStateInvalidCopyWith(_$_PurchaseStateInvalid value,
          $Res Function(_$_PurchaseStateInvalid) then) =
      __$$_PurchaseStateInvalidCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseDetails purchase});
}

/// @nodoc
class __$$_PurchaseStateInvalidCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$_PurchaseStateInvalid>
    implements _$$_PurchaseStateInvalidCopyWith<$Res> {
  __$$_PurchaseStateInvalidCopyWithImpl(_$_PurchaseStateInvalid _value,
      $Res Function(_$_PurchaseStateInvalid) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
  }) {
    return _then(_$_PurchaseStateInvalid(
      null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$_PurchaseStateInvalid implements _PurchaseStateInvalid {
  const _$_PurchaseStateInvalid(this.purchase);

  @override
  final PurchaseDetails purchase;

  @override
  String toString() {
    return 'PurchaseState.invalid(purchase: $purchase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseStateInvalid &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseStateInvalidCopyWith<_$_PurchaseStateInvalid> get copyWith =>
      __$$_PurchaseStateInvalidCopyWithImpl<_$_PurchaseStateInvalid>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return invalid(purchase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return invalid?.call(purchase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(purchase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateIapError value) iapError,
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateIapError value)? iapError,
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateIapError value)? iapError,
    TResult Function(_PurchaseStateError value)? error,
    TResult Function(_PurchaseStateSuccess value)? success,
    TResult Function(_PurchaseStateLoading value)? loading,
    TResult Function(_PurchaseStatePending value)? pending,
    TResult Function(_PurchaseStateInvalid value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateInvalid implements PurchaseState {
  const factory _PurchaseStateInvalid(final PurchaseDetails purchase) =
      _$_PurchaseStateInvalid;

  PurchaseDetails get purchase;
  @JsonKey(ignore: true)
  _$$_PurchaseStateInvalidCopyWith<_$_PurchaseStateInvalid> get copyWith =>
      throw _privateConstructorUsedError;
}
