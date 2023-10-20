// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool isConsumable});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isConsumable = null,
  }) {
    return _then(_$ProductImpl(
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

class _$ProductImpl implements _Product {
  const _$ProductImpl(this.id, {required this.isConsumable});

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
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isConsumable, isConsumable) ||
                other.isConsumable == isConsumable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isConsumable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(final String id, {required final bool isConsumable}) =
      _$ProductImpl;

  @override
  String get id;
  @override
  bool get isConsumable;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
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
abstract class _$$PurchasedProductImplCopyWith<$Res>
    implements $PurchasedProductCopyWith<$Res> {
  factory _$$PurchasedProductImplCopyWith(_$PurchasedProductImpl value,
          $Res Function(_$PurchasedProductImpl) then) =
      __$$PurchasedProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, PurchaseDetails purchaseDetails});
}

/// @nodoc
class __$$PurchasedProductImplCopyWithImpl<$Res>
    extends _$PurchasedProductCopyWithImpl<$Res, _$PurchasedProductImpl>
    implements _$$PurchasedProductImplCopyWith<$Res> {
  __$$PurchasedProductImplCopyWithImpl(_$PurchasedProductImpl _value,
      $Res Function(_$PurchasedProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? purchaseDetails = null,
  }) {
    return _then(_$PurchasedProductImpl(
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

class _$PurchasedProductImpl implements _PurchasedProduct {
  const _$PurchasedProductImpl(this.productId, this.purchaseDetails);

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
            other is _$PurchasedProductImpl &&
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
  _$$PurchasedProductImplCopyWith<_$PurchasedProductImpl> get copyWith =>
      __$$PurchasedProductImplCopyWithImpl<_$PurchasedProductImpl>(
          this, _$identity);
}

abstract class _PurchasedProduct implements PurchasedProduct {
  const factory _PurchasedProduct(
          final String productId, final PurchaseDetails purchaseDetails) =
      _$PurchasedProductImpl;

  @override
  String get productId;
  @override
  PurchaseDetails get purchaseDetails;
  @override
  @JsonKey(ignore: true)
  _$$PurchasedProductImplCopyWith<_$PurchasedProductImpl> get copyWith =>
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
abstract class _$$ProductDetailsStateLoadingImplCopyWith<$Res> {
  factory _$$ProductDetailsStateLoadingImplCopyWith(
          _$ProductDetailsStateLoadingImpl value,
          $Res Function(_$ProductDetailsStateLoadingImpl) then) =
      __$$ProductDetailsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailsStateLoadingImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res,
        _$ProductDetailsStateLoadingImpl>
    implements _$$ProductDetailsStateLoadingImplCopyWith<$Res> {
  __$$ProductDetailsStateLoadingImplCopyWithImpl(
      _$ProductDetailsStateLoadingImpl _value,
      $Res Function(_$ProductDetailsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailsStateLoadingImpl implements _ProductDetailsStateLoading {
  const _$ProductDetailsStateLoadingImpl();

  @override
  String toString() {
    return 'ProductDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsStateLoadingImpl);
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
  const factory _ProductDetailsStateLoading() =
      _$ProductDetailsStateLoadingImpl;
}

/// @nodoc
abstract class _$$ProductDetailsStateUnavailableImplCopyWith<$Res> {
  factory _$$ProductDetailsStateUnavailableImplCopyWith(
          _$ProductDetailsStateUnavailableImpl value,
          $Res Function(_$ProductDetailsStateUnavailableImpl) then) =
      __$$ProductDetailsStateUnavailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailsStateUnavailableImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res,
        _$ProductDetailsStateUnavailableImpl>
    implements _$$ProductDetailsStateUnavailableImplCopyWith<$Res> {
  __$$ProductDetailsStateUnavailableImplCopyWithImpl(
      _$ProductDetailsStateUnavailableImpl _value,
      $Res Function(_$ProductDetailsStateUnavailableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailsStateUnavailableImpl
    implements _ProductDetailsStateUnavailable {
  const _$ProductDetailsStateUnavailableImpl();

  @override
  String toString() {
    return 'ProductDetailsState.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsStateUnavailableImpl);
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
      _$ProductDetailsStateUnavailableImpl;
}

/// @nodoc
abstract class _$$IapErrorImplCopyWith<$Res> {
  factory _$$IapErrorImplCopyWith(
          _$IapErrorImpl value, $Res Function(_$IapErrorImpl) then) =
      __$$IapErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IAPError error});
}

/// @nodoc
class __$$IapErrorImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$IapErrorImpl>
    implements _$$IapErrorImplCopyWith<$Res> {
  __$$IapErrorImplCopyWithImpl(
      _$IapErrorImpl _value, $Res Function(_$IapErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$IapErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError,
    ));
  }
}

/// @nodoc

class _$IapErrorImpl implements _IapError {
  const _$IapErrorImpl(this.error);

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
            other is _$IapErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IapErrorImplCopyWith<_$IapErrorImpl> get copyWith =>
      __$$IapErrorImplCopyWithImpl<_$IapErrorImpl>(this, _$identity);

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
  const factory _IapError(final IAPError error) = _$IapErrorImpl;

  IAPError get error;
  @JsonKey(ignore: true)
  _$$IapErrorImplCopyWith<_$IapErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsImplCopyWith<$Res> {
  factory _$$ProductsImplCopyWith(
          _$ProductsImpl value, $Res Function(_$ProductsImpl) then) =
      __$$ProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductDetails> products});
}

/// @nodoc
class __$$ProductsImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductsImpl>
    implements _$$ProductsImplCopyWith<$Res> {
  __$$ProductsImplCopyWithImpl(
      _$ProductsImpl _value, $Res Function(_$ProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductsImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
    ));
  }
}

/// @nodoc

class _$ProductsImpl implements _Products {
  const _$ProductsImpl(final List<ProductDetails> products)
      : _products = products;

  final List<ProductDetails> _products;
  @override
  List<ProductDetails> get products {
    if (_products is EqualUnmodifiableListView) return _products;
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
            other is _$ProductsImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      __$$ProductsImplCopyWithImpl<_$ProductsImpl>(this, _$identity);

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
  const factory _Products(final List<ProductDetails> products) = _$ProductsImpl;

  List<ProductDetails> get products;
  @JsonKey(ignore: true)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseStateError error)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseStateError error)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateError value) error,
    required TResult Function(_PurchaseStateSuccess value) success,
    required TResult Function(_PurchaseStateLoading value) loading,
    required TResult Function(_PurchaseStatePending value) pending,
    required TResult Function(_PurchaseStateInvalid value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateError value)? error,
    TResult? Function(_PurchaseStateSuccess value)? success,
    TResult? Function(_PurchaseStateLoading value)? loading,
    TResult? Function(_PurchaseStatePending value)? pending,
    TResult? Function(_PurchaseStateInvalid value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
abstract class _$$PurchaseStateErrorImplCopyWith<$Res> {
  factory _$$PurchaseStateErrorImplCopyWith(_$PurchaseStateErrorImpl value,
          $Res Function(_$PurchaseStateErrorImpl) then) =
      __$$PurchaseStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseStateError error});

  $PurchaseStateErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$PurchaseStateErrorImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateErrorImpl>
    implements _$$PurchaseStateErrorImplCopyWith<$Res> {
  __$$PurchaseStateErrorImplCopyWithImpl(_$PurchaseStateErrorImpl _value,
      $Res Function(_$PurchaseStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PurchaseStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PurchaseStateError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseStateErrorCopyWith<$Res> get error {
    return $PurchaseStateErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$PurchaseStateErrorImpl extends _PurchaseStateError {
  const _$PurchaseStateErrorImpl(this.error) : super._();

  @override
  final PurchaseStateError error;

  @override
  String toString() {
    return 'PurchaseState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateErrorImplCopyWith<_$PurchaseStateErrorImpl> get copyWith =>
      __$$PurchaseStateErrorImplCopyWithImpl<_$PurchaseStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(PurchaseDetails purchase) pending,
    required TResult Function(PurchaseDetails purchase) invalid,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseStateError error)? error,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(PurchaseDetails purchase)? pending,
    TResult? Function(PurchaseDetails purchase)? invalid,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseStateError error)? error,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(PurchaseDetails purchase)? pending,
    TResult Function(PurchaseDetails purchase)? invalid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
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

abstract class _PurchaseStateError extends PurchaseState {
  const factory _PurchaseStateError(final PurchaseStateError error) =
      _$PurchaseStateErrorImpl;
  const _PurchaseStateError._() : super._();

  PurchaseStateError get error;
  @JsonKey(ignore: true)
  _$$PurchaseStateErrorImplCopyWith<_$PurchaseStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseStateSuccessImplCopyWith<$Res> {
  factory _$$PurchaseStateSuccessImplCopyWith(_$PurchaseStateSuccessImpl value,
          $Res Function(_$PurchaseStateSuccessImpl) then) =
      __$$PurchaseStateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PurchaseStateSuccessImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateSuccessImpl>
    implements _$$PurchaseStateSuccessImplCopyWith<$Res> {
  __$$PurchaseStateSuccessImplCopyWithImpl(_$PurchaseStateSuccessImpl _value,
      $Res Function(_$PurchaseStateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PurchaseStateSuccessImpl extends _PurchaseStateSuccess {
  const _$PurchaseStateSuccessImpl() : super._();

  @override
  String toString() {
    return 'PurchaseState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
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
    TResult? Function(PurchaseStateError error)? error,
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
    TResult Function(PurchaseStateError error)? error,
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

abstract class _PurchaseStateSuccess extends PurchaseState {
  const factory _PurchaseStateSuccess() = _$PurchaseStateSuccessImpl;
  const _PurchaseStateSuccess._() : super._();
}

/// @nodoc
abstract class _$$PurchaseStateLoadingImplCopyWith<$Res> {
  factory _$$PurchaseStateLoadingImplCopyWith(_$PurchaseStateLoadingImpl value,
          $Res Function(_$PurchaseStateLoadingImpl) then) =
      __$$PurchaseStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PurchaseStateLoadingImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateLoadingImpl>
    implements _$$PurchaseStateLoadingImplCopyWith<$Res> {
  __$$PurchaseStateLoadingImplCopyWithImpl(_$PurchaseStateLoadingImpl _value,
      $Res Function(_$PurchaseStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PurchaseStateLoadingImpl extends _PurchaseStateLoading {
  const _$PurchaseStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'PurchaseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
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
    TResult? Function(PurchaseStateError error)? error,
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
    TResult Function(PurchaseStateError error)? error,
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

abstract class _PurchaseStateLoading extends PurchaseState {
  const factory _PurchaseStateLoading() = _$PurchaseStateLoadingImpl;
  const _PurchaseStateLoading._() : super._();
}

/// @nodoc
abstract class _$$PurchaseStatePendingImplCopyWith<$Res> {
  factory _$$PurchaseStatePendingImplCopyWith(_$PurchaseStatePendingImpl value,
          $Res Function(_$PurchaseStatePendingImpl) then) =
      __$$PurchaseStatePendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseDetails purchase});
}

/// @nodoc
class __$$PurchaseStatePendingImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStatePendingImpl>
    implements _$$PurchaseStatePendingImplCopyWith<$Res> {
  __$$PurchaseStatePendingImplCopyWithImpl(_$PurchaseStatePendingImpl _value,
      $Res Function(_$PurchaseStatePendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
  }) {
    return _then(_$PurchaseStatePendingImpl(
      null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$PurchaseStatePendingImpl extends _PurchaseStatePending {
  const _$PurchaseStatePendingImpl(this.purchase) : super._();

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
            other is _$PurchaseStatePendingImpl &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStatePendingImplCopyWith<_$PurchaseStatePendingImpl>
      get copyWith =>
          __$$PurchaseStatePendingImplCopyWithImpl<_$PurchaseStatePendingImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
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
    TResult? Function(PurchaseStateError error)? error,
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
    TResult Function(PurchaseStateError error)? error,
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

abstract class _PurchaseStatePending extends PurchaseState {
  const factory _PurchaseStatePending(final PurchaseDetails purchase) =
      _$PurchaseStatePendingImpl;
  const _PurchaseStatePending._() : super._();

  PurchaseDetails get purchase;
  @JsonKey(ignore: true)
  _$$PurchaseStatePendingImplCopyWith<_$PurchaseStatePendingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseStateInvalidImplCopyWith<$Res> {
  factory _$$PurchaseStateInvalidImplCopyWith(_$PurchaseStateInvalidImpl value,
          $Res Function(_$PurchaseStateInvalidImpl) then) =
      __$$PurchaseStateInvalidImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseDetails purchase});
}

/// @nodoc
class __$$PurchaseStateInvalidImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStateInvalidImpl>
    implements _$$PurchaseStateInvalidImplCopyWith<$Res> {
  __$$PurchaseStateInvalidImplCopyWithImpl(_$PurchaseStateInvalidImpl _value,
      $Res Function(_$PurchaseStateInvalidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
  }) {
    return _then(_$PurchaseStateInvalidImpl(
      null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$PurchaseStateInvalidImpl extends _PurchaseStateInvalid {
  const _$PurchaseStateInvalidImpl(this.purchase) : super._();

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
            other is _$PurchaseStateInvalidImpl &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateInvalidImplCopyWith<_$PurchaseStateInvalidImpl>
      get copyWith =>
          __$$PurchaseStateInvalidImplCopyWithImpl<_$PurchaseStateInvalidImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseStateError error) error,
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
    TResult? Function(PurchaseStateError error)? error,
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
    TResult Function(PurchaseStateError error)? error,
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

abstract class _PurchaseStateInvalid extends PurchaseState {
  const factory _PurchaseStateInvalid(final PurchaseDetails purchase) =
      _$PurchaseStateInvalidImpl;
  const _PurchaseStateInvalid._() : super._();

  PurchaseDetails get purchase;
  @JsonKey(ignore: true)
  _$$PurchaseStateInvalidImplCopyWith<_$PurchaseStateInvalidImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseStateError {
  Object get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateErrorIapError value) iapError,
    required TResult Function(_PurchaseStateErrorGeneralError value)
        generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateErrorIapError value)? iapError,
    TResult? Function(_PurchaseStateErrorGeneralError value)? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateErrorIapError value)? iapError,
    TResult Function(_PurchaseStateErrorGeneralError value)? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateErrorCopyWith<$Res> {
  factory $PurchaseStateErrorCopyWith(
          PurchaseStateError value, $Res Function(PurchaseStateError) then) =
      _$PurchaseStateErrorCopyWithImpl<$Res, PurchaseStateError>;
}

/// @nodoc
class _$PurchaseStateErrorCopyWithImpl<$Res, $Val extends PurchaseStateError>
    implements $PurchaseStateErrorCopyWith<$Res> {
  _$PurchaseStateErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PurchaseStateErrorIapErrorImplCopyWith<$Res> {
  factory _$$PurchaseStateErrorIapErrorImplCopyWith(
          _$PurchaseStateErrorIapErrorImpl value,
          $Res Function(_$PurchaseStateErrorIapErrorImpl) then) =
      __$$PurchaseStateErrorIapErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IAPError error});
}

/// @nodoc
class __$$PurchaseStateErrorIapErrorImplCopyWithImpl<$Res>
    extends _$PurchaseStateErrorCopyWithImpl<$Res,
        _$PurchaseStateErrorIapErrorImpl>
    implements _$$PurchaseStateErrorIapErrorImplCopyWith<$Res> {
  __$$PurchaseStateErrorIapErrorImplCopyWithImpl(
      _$PurchaseStateErrorIapErrorImpl _value,
      $Res Function(_$PurchaseStateErrorIapErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PurchaseStateErrorIapErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as IAPError,
    ));
  }
}

/// @nodoc

class _$PurchaseStateErrorIapErrorImpl implements _PurchaseStateErrorIapError {
  const _$PurchaseStateErrorIapErrorImpl(this.error);

  @override
  final IAPError error;

  @override
  String toString() {
    return 'PurchaseStateError.iapError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateErrorIapErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStateErrorIapErrorImplCopyWith<_$PurchaseStateErrorIapErrorImpl>
      get copyWith => __$$PurchaseStateErrorIapErrorImplCopyWithImpl<
          _$PurchaseStateErrorIapErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) generalError,
  }) {
    return iapError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? generalError,
  }) {
    return iapError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? generalError,
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
    required TResult Function(_PurchaseStateErrorIapError value) iapError,
    required TResult Function(_PurchaseStateErrorGeneralError value)
        generalError,
  }) {
    return iapError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateErrorIapError value)? iapError,
    TResult? Function(_PurchaseStateErrorGeneralError value)? generalError,
  }) {
    return iapError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateErrorIapError value)? iapError,
    TResult Function(_PurchaseStateErrorGeneralError value)? generalError,
    required TResult orElse(),
  }) {
    if (iapError != null) {
      return iapError(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateErrorIapError implements PurchaseStateError {
  const factory _PurchaseStateErrorIapError(final IAPError error) =
      _$PurchaseStateErrorIapErrorImpl;

  @override
  IAPError get error;
  @JsonKey(ignore: true)
  _$$PurchaseStateErrorIapErrorImplCopyWith<_$PurchaseStateErrorIapErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseStateErrorGeneralErrorImplCopyWith<$Res> {
  factory _$$PurchaseStateErrorGeneralErrorImplCopyWith(
          _$PurchaseStateErrorGeneralErrorImpl value,
          $Res Function(_$PurchaseStateErrorGeneralErrorImpl) then) =
      __$$PurchaseStateErrorGeneralErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$PurchaseStateErrorGeneralErrorImplCopyWithImpl<$Res>
    extends _$PurchaseStateErrorCopyWithImpl<$Res,
        _$PurchaseStateErrorGeneralErrorImpl>
    implements _$$PurchaseStateErrorGeneralErrorImplCopyWith<$Res> {
  __$$PurchaseStateErrorGeneralErrorImplCopyWithImpl(
      _$PurchaseStateErrorGeneralErrorImpl _value,
      $Res Function(_$PurchaseStateErrorGeneralErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$PurchaseStateErrorGeneralErrorImpl(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$PurchaseStateErrorGeneralErrorImpl
    implements _PurchaseStateErrorGeneralError {
  const _$PurchaseStateErrorGeneralErrorImpl(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PurchaseStateError.generalError(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStateErrorGeneralErrorImpl &&
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
  _$$PurchaseStateErrorGeneralErrorImplCopyWith<
          _$PurchaseStateErrorGeneralErrorImpl>
      get copyWith => __$$PurchaseStateErrorGeneralErrorImplCopyWithImpl<
          _$PurchaseStateErrorGeneralErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IAPError error) iapError,
    required TResult Function(Object error, StackTrace stackTrace) generalError,
  }) {
    return generalError(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IAPError error)? iapError,
    TResult? Function(Object error, StackTrace stackTrace)? generalError,
  }) {
    return generalError?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IAPError error)? iapError,
    TResult Function(Object error, StackTrace stackTrace)? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseStateErrorIapError value) iapError,
    required TResult Function(_PurchaseStateErrorGeneralError value)
        generalError,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseStateErrorIapError value)? iapError,
    TResult? Function(_PurchaseStateErrorGeneralError value)? generalError,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseStateErrorIapError value)? iapError,
    TResult Function(_PurchaseStateErrorGeneralError value)? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class _PurchaseStateErrorGeneralError implements PurchaseStateError {
  const factory _PurchaseStateErrorGeneralError(
          final Object error, final StackTrace stackTrace) =
      _$PurchaseStateErrorGeneralErrorImpl;

  @override
  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$PurchaseStateErrorGeneralErrorImplCopyWith<
          _$PurchaseStateErrorGeneralErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
