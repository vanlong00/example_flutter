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
mixin _$AssetReferenceV4 {

@JsonKey(name: 'AssetId') String? get assetId;@JsonKey(name: 'CanBeNull') bool? get canBeNull;
/// Create a copy of AssetReferenceV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetReferenceV4CopyWith<AssetReferenceV4> get copyWith => _$AssetReferenceV4CopyWithImpl<AssetReferenceV4>(this as AssetReferenceV4, _$identity);

  /// Serializes this AssetReferenceV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetReferenceV4&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.canBeNull, canBeNull) || other.canBeNull == canBeNull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,canBeNull);

@override
String toString() {
  return 'AssetReferenceV4(assetId: $assetId, canBeNull: $canBeNull)';
}


}

/// @nodoc
abstract mixin class $AssetReferenceV4CopyWith<$Res>  {
  factory $AssetReferenceV4CopyWith(AssetReferenceV4 value, $Res Function(AssetReferenceV4) _then) = _$AssetReferenceV4CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId,@JsonKey(name: 'CanBeNull') bool? canBeNull
});




}
/// @nodoc
class _$AssetReferenceV4CopyWithImpl<$Res>
    implements $AssetReferenceV4CopyWith<$Res> {
  _$AssetReferenceV4CopyWithImpl(this._self, this._then);

  final AssetReferenceV4 _self;
  final $Res Function(AssetReferenceV4) _then;

/// Create a copy of AssetReferenceV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assetId = freezed,Object? canBeNull = freezed,}) {
  return _then(_self.copyWith(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,canBeNull: freezed == canBeNull ? _self.canBeNull : canBeNull // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetReferenceV4].
extension AssetReferenceV4Patterns on AssetReferenceV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetReferenceV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetReferenceV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetReferenceV4 value)  $default,){
final _that = this;
switch (_that) {
case _AssetReferenceV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetReferenceV4 value)?  $default,){
final _that = this;
switch (_that) {
case _AssetReferenceV4() when $default != null:
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
case _AssetReferenceV4() when $default != null:
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
case _AssetReferenceV4():
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
case _AssetReferenceV4() when $default != null:
return $default(_that.assetId,_that.canBeNull);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetReferenceV4 implements AssetReferenceV4 {
  const _AssetReferenceV4({@JsonKey(name: 'AssetId') this.assetId, @JsonKey(name: 'CanBeNull') this.canBeNull});
  factory _AssetReferenceV4.fromJson(Map<String, dynamic> json) => _$AssetReferenceV4FromJson(json);

@override@JsonKey(name: 'AssetId') final  String? assetId;
@override@JsonKey(name: 'CanBeNull') final  bool? canBeNull;

/// Create a copy of AssetReferenceV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetReferenceV4CopyWith<_AssetReferenceV4> get copyWith => __$AssetReferenceV4CopyWithImpl<_AssetReferenceV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetReferenceV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetReferenceV4&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.canBeNull, canBeNull) || other.canBeNull == canBeNull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,canBeNull);

@override
String toString() {
  return 'AssetReferenceV4(assetId: $assetId, canBeNull: $canBeNull)';
}


}

/// @nodoc
abstract mixin class _$AssetReferenceV4CopyWith<$Res> implements $AssetReferenceV4CopyWith<$Res> {
  factory _$AssetReferenceV4CopyWith(_AssetReferenceV4 value, $Res Function(_AssetReferenceV4) _then) = __$AssetReferenceV4CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId,@JsonKey(name: 'CanBeNull') bool? canBeNull
});




}
/// @nodoc
class __$AssetReferenceV4CopyWithImpl<$Res>
    implements _$AssetReferenceV4CopyWith<$Res> {
  __$AssetReferenceV4CopyWithImpl(this._self, this._then);

  final _AssetReferenceV4 _self;
  final $Res Function(_AssetReferenceV4) _then;

/// Create a copy of AssetReferenceV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assetId = freezed,Object? canBeNull = freezed,}) {
  return _then(_AssetReferenceV4(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,canBeNull: freezed == canBeNull ? _self.canBeNull : canBeNull // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$AssetReferenceV3 {

@JsonKey(name: 'AssetId') String? get assetId;
/// Create a copy of AssetReferenceV3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetReferenceV3CopyWith<AssetReferenceV3> get copyWith => _$AssetReferenceV3CopyWithImpl<AssetReferenceV3>(this as AssetReferenceV3, _$identity);

  /// Serializes this AssetReferenceV3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetReferenceV3&&(identical(other.assetId, assetId) || other.assetId == assetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId);

@override
String toString() {
  return 'AssetReferenceV3(assetId: $assetId)';
}


}

/// @nodoc
abstract mixin class $AssetReferenceV3CopyWith<$Res>  {
  factory $AssetReferenceV3CopyWith(AssetReferenceV3 value, $Res Function(AssetReferenceV3) _then) = _$AssetReferenceV3CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId
});




}
/// @nodoc
class _$AssetReferenceV3CopyWithImpl<$Res>
    implements $AssetReferenceV3CopyWith<$Res> {
  _$AssetReferenceV3CopyWithImpl(this._self, this._then);

  final AssetReferenceV3 _self;
  final $Res Function(AssetReferenceV3) _then;

/// Create a copy of AssetReferenceV3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assetId = freezed,}) {
  return _then(_self.copyWith(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetReferenceV3].
extension AssetReferenceV3Patterns on AssetReferenceV3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetReferenceV3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetReferenceV3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetReferenceV3 value)  $default,){
final _that = this;
switch (_that) {
case _AssetReferenceV3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetReferenceV3 value)?  $default,){
final _that = this;
switch (_that) {
case _AssetReferenceV3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AssetId')  String? assetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetReferenceV3() when $default != null:
return $default(_that.assetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AssetId')  String? assetId)  $default,) {final _that = this;
switch (_that) {
case _AssetReferenceV3():
return $default(_that.assetId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AssetId')  String? assetId)?  $default,) {final _that = this;
switch (_that) {
case _AssetReferenceV3() when $default != null:
return $default(_that.assetId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetReferenceV3 implements AssetReferenceV3 {
  const _AssetReferenceV3({@JsonKey(name: 'AssetId') this.assetId});
  factory _AssetReferenceV3.fromJson(Map<String, dynamic> json) => _$AssetReferenceV3FromJson(json);

@override@JsonKey(name: 'AssetId') final  String? assetId;

/// Create a copy of AssetReferenceV3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetReferenceV3CopyWith<_AssetReferenceV3> get copyWith => __$AssetReferenceV3CopyWithImpl<_AssetReferenceV3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetReferenceV3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetReferenceV3&&(identical(other.assetId, assetId) || other.assetId == assetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId);

@override
String toString() {
  return 'AssetReferenceV3(assetId: $assetId)';
}


}

/// @nodoc
abstract mixin class _$AssetReferenceV3CopyWith<$Res> implements $AssetReferenceV3CopyWith<$Res> {
  factory _$AssetReferenceV3CopyWith(_AssetReferenceV3 value, $Res Function(_AssetReferenceV3) _then) = __$AssetReferenceV3CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AssetId') String? assetId
});




}
/// @nodoc
class __$AssetReferenceV3CopyWithImpl<$Res>
    implements _$AssetReferenceV3CopyWith<$Res> {
  __$AssetReferenceV3CopyWithImpl(this._self, this._then);

  final _AssetReferenceV3 _self;
  final $Res Function(_AssetReferenceV3) _then;

/// Create a copy of AssetReferenceV3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assetId = freezed,}) {
  return _then(_AssetReferenceV3(
assetId: freezed == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
