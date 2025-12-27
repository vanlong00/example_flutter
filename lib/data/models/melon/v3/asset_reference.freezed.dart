// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetReference {

@JsonKey(name: 'AssetId') String? get assetId;@JsonKey(name: 'CanBeNull') bool? get canBeNull;
/// Create a copy of AssetReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetReferenceCopyWith<AssetReference> get copyWith => _$AssetReferenceCopyWithImpl<AssetReference>(this as AssetReference, _$identity);

  /// Serializes this AssetReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetReference&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.canBeNull, canBeNull) || other.canBeNull == canBeNull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,canBeNull);

@override
String toString() {
  return 'AssetReference(assetId: $assetId, canBeNull: $canBeNull)';
}


}

/// @nodoc
abstract mixin class $AssetReferenceCopyWith<$Res>  {
  factory $AssetReferenceCopyWith(AssetReference value, $Res Function(AssetReference) _then) = _$AssetReferenceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId,@JsonKey(name: 'CanBeNull') bool? canBeNull
});




}
/// @nodoc
class _$AssetReferenceCopyWithImpl<$Res>
    implements $AssetReferenceCopyWith<$Res> {
  _$AssetReferenceCopyWithImpl(this._self, this._then);

  final AssetReference _self;
  final $Res Function(AssetReference) _then;

/// Create a copy of AssetReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assetId = freezed,Object? canBeNull = freezed,}) {
  return _then(_self.copyWith(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,canBeNull: freezed == canBeNull ? _self.canBeNull : canBeNull // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetReference].
extension AssetReferencePatterns on AssetReference {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetReference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetReference() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetReference value)  $default,){
final _that = this;
switch (_that) {
case _AssetReference():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetReference value)?  $default,){
final _that = this;
switch (_that) {
case _AssetReference() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AssetId')  String? assetId, @JsonKey(name: 'CanBeNull')  bool? canBeNull)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetReference() when $default != null:
return $default(_that.assetId,_that.canBeNull);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AssetId')  String? assetId, @JsonKey(name: 'CanBeNull')  bool? canBeNull)  $default,) {final _that = this;
switch (_that) {
case _AssetReference():
return $default(_that.assetId,_that.canBeNull);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AssetId')  String? assetId, @JsonKey(name: 'CanBeNull')  bool? canBeNull)?  $default,) {final _that = this;
switch (_that) {
case _AssetReference() when $default != null:
return $default(_that.assetId,_that.canBeNull);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetReference implements AssetReference {
  const _AssetReference({@JsonKey(name: 'AssetId') this.assetId, @JsonKey(name: 'CanBeNull') this.canBeNull});
  factory _AssetReference.fromJson(Map<String, dynamic> json) => _$AssetReferenceFromJson(json);

@override@JsonKey(name: 'AssetId') final  String? assetId;
@override@JsonKey(name: 'CanBeNull') final  bool? canBeNull;

/// Create a copy of AssetReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetReferenceCopyWith<_AssetReference> get copyWith => __$AssetReferenceCopyWithImpl<_AssetReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetReference&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.canBeNull, canBeNull) || other.canBeNull == canBeNull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,canBeNull);

@override
String toString() {
  return 'AssetReference(assetId: $assetId, canBeNull: $canBeNull)';
}


}

/// @nodoc
abstract mixin class _$AssetReferenceCopyWith<$Res> implements $AssetReferenceCopyWith<$Res> {
  factory _$AssetReferenceCopyWith(_AssetReference value, $Res Function(_AssetReference) _then) = __$AssetReferenceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId,@JsonKey(name: 'CanBeNull') bool? canBeNull
});




}
/// @nodoc
class __$AssetReferenceCopyWithImpl<$Res>
    implements _$AssetReferenceCopyWith<$Res> {
  __$AssetReferenceCopyWithImpl(this._self, this._then);

  final _AssetReference _self;
  final $Res Function(_AssetReference) _then;

/// Create a copy of AssetReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assetId = freezed,Object? canBeNull = freezed,}) {
  return _then(_AssetReference(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,canBeNull: freezed == canBeNull ? _self.canBeNull : canBeNull // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
