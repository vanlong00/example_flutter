// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_v4.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartV4 {

 AssetReference? get mainTexture; bool? get pixelsPerUnit; List<String>? get colliderJson; Object? get glowMap; MelonVector3? get grabPosition; bool? get canBeTaken; bool? get canGlow; bool? get canBurn; bool? get canFloat;@JsonKey(name: 'RotateViaPointer') bool? get rotateViaPointer;
/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartV4CopyWith<PartV4> get copyWith => _$PartV4CopyWithImpl<PartV4>(this as PartV4, _$identity);

  /// Serializes this PartV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartV4&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&const DeepCollectionEquality().equals(other.colliderJson, colliderJson)&&const DeepCollectionEquality().equals(other.glowMap, glowMap)&&(identical(other.grabPosition, grabPosition) || other.grabPosition == grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat)&&(identical(other.rotateViaPointer, rotateViaPointer) || other.rotateViaPointer == rotateViaPointer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,const DeepCollectionEquality().hash(colliderJson),const DeepCollectionEquality().hash(glowMap),grabPosition,canBeTaken,canGlow,canBurn,canFloat,rotateViaPointer);

@override
String toString() {
  return 'PartV4(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, colliderJson: $colliderJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat, rotateViaPointer: $rotateViaPointer)';
}


}

/// @nodoc
abstract mixin class $PartV4CopyWith<$Res>  {
  factory $PartV4CopyWith(PartV4 value, $Res Function(PartV4) _then) = _$PartV4CopyWithImpl;
@useResult
$Res call({
 AssetReference? mainTexture, bool? pixelsPerUnit, List<String>? colliderJson, Object? glowMap, MelonVector3? grabPosition, bool? canBeTaken, bool? canGlow, bool? canBurn, bool? canFloat,@JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer
});


$AssetReferenceCopyWith<$Res>? get mainTexture;$MelonVector3CopyWith<$Res>? get grabPosition;

}
/// @nodoc
class _$PartV4CopyWithImpl<$Res>
    implements $PartV4CopyWith<$Res> {
  _$PartV4CopyWithImpl(this._self, this._then);

  final PartV4 _self;
  final $Res Function(PartV4) _then;

/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainTexture = freezed,Object? pixelsPerUnit = freezed,Object? colliderJson = freezed,Object? glowMap = freezed,Object? grabPosition = freezed,Object? canBeTaken = freezed,Object? canGlow = freezed,Object? canBurn = freezed,Object? canFloat = freezed,Object? rotateViaPointer = freezed,}) {
  return _then(_self.copyWith(
mainTexture: freezed == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as AssetReference?,pixelsPerUnit: freezed == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as bool?,colliderJson: freezed == colliderJson ? _self.colliderJson : colliderJson // ignore: cast_nullable_to_non_nullable
as List<String>?,glowMap: freezed == glowMap ? _self.glowMap : glowMap ,grabPosition: freezed == grabPosition ? _self.grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as MelonVector3?,canBeTaken: freezed == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool?,canGlow: freezed == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool?,canBurn: freezed == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool?,canFloat: freezed == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool?,rotateViaPointer: freezed == rotateViaPointer ? _self.rotateViaPointer : rotateViaPointer // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceCopyWith<$Res>? get mainTexture {
    if (_self.mainTexture == null) {
    return null;
  }

  return $AssetReferenceCopyWith<$Res>(_self.mainTexture!, (value) {
    return _then(_self.copyWith(mainTexture: value));
  });
}/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector3CopyWith<$Res>? get grabPosition {
    if (_self.grabPosition == null) {
    return null;
  }

  return $MelonVector3CopyWith<$Res>(_self.grabPosition!, (value) {
    return _then(_self.copyWith(grabPosition: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartV4].
extension PartV4Patterns on PartV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartV4 value)  $default,){
final _that = this;
switch (_that) {
case _PartV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartV4 value)?  $default,){
final _that = this;
switch (_that) {
case _PartV4() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssetReference? mainTexture,  bool? pixelsPerUnit,  List<String>? colliderJson,  Object? glowMap,  MelonVector3? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartV4() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.colliderJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssetReference? mainTexture,  bool? pixelsPerUnit,  List<String>? colliderJson,  Object? glowMap,  MelonVector3? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)  $default,) {final _that = this;
switch (_that) {
case _PartV4():
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.colliderJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssetReference? mainTexture,  bool? pixelsPerUnit,  List<String>? colliderJson,  Object? glowMap,  MelonVector3? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)?  $default,) {final _that = this;
switch (_that) {
case _PartV4() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.colliderJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartV4 implements PartV4 {
  const _PartV4({this.mainTexture, this.pixelsPerUnit, final  List<String>? colliderJson, this.glowMap, this.grabPosition, this.canBeTaken, this.canGlow, this.canBurn, this.canFloat, @JsonKey(name: 'RotateViaPointer') this.rotateViaPointer}): _colliderJson = colliderJson;
  factory _PartV4.fromJson(Map<String, dynamic> json) => _$PartV4FromJson(json);

@override final  AssetReference? mainTexture;
@override final  bool? pixelsPerUnit;
 final  List<String>? _colliderJson;
@override List<String>? get colliderJson {
  final value = _colliderJson;
  if (value == null) return null;
  if (_colliderJson is EqualUnmodifiableListView) return _colliderJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Object? glowMap;
@override final  MelonVector3? grabPosition;
@override final  bool? canBeTaken;
@override final  bool? canGlow;
@override final  bool? canBurn;
@override final  bool? canFloat;
@override@JsonKey(name: 'RotateViaPointer') final  bool? rotateViaPointer;

/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartV4CopyWith<_PartV4> get copyWith => __$PartV4CopyWithImpl<_PartV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartV4&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&const DeepCollectionEquality().equals(other._colliderJson, _colliderJson)&&const DeepCollectionEquality().equals(other.glowMap, glowMap)&&(identical(other.grabPosition, grabPosition) || other.grabPosition == grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat)&&(identical(other.rotateViaPointer, rotateViaPointer) || other.rotateViaPointer == rotateViaPointer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,const DeepCollectionEquality().hash(_colliderJson),const DeepCollectionEquality().hash(glowMap),grabPosition,canBeTaken,canGlow,canBurn,canFloat,rotateViaPointer);

@override
String toString() {
  return 'PartV4(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, colliderJson: $colliderJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat, rotateViaPointer: $rotateViaPointer)';
}


}

/// @nodoc
abstract mixin class _$PartV4CopyWith<$Res> implements $PartV4CopyWith<$Res> {
  factory _$PartV4CopyWith(_PartV4 value, $Res Function(_PartV4) _then) = __$PartV4CopyWithImpl;
@override @useResult
$Res call({
 AssetReference? mainTexture, bool? pixelsPerUnit, List<String>? colliderJson, Object? glowMap, MelonVector3? grabPosition, bool? canBeTaken, bool? canGlow, bool? canBurn, bool? canFloat,@JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer
});


@override $AssetReferenceCopyWith<$Res>? get mainTexture;@override $MelonVector3CopyWith<$Res>? get grabPosition;

}
/// @nodoc
class __$PartV4CopyWithImpl<$Res>
    implements _$PartV4CopyWith<$Res> {
  __$PartV4CopyWithImpl(this._self, this._then);

  final _PartV4 _self;
  final $Res Function(_PartV4) _then;

/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainTexture = freezed,Object? pixelsPerUnit = freezed,Object? colliderJson = freezed,Object? glowMap = freezed,Object? grabPosition = freezed,Object? canBeTaken = freezed,Object? canGlow = freezed,Object? canBurn = freezed,Object? canFloat = freezed,Object? rotateViaPointer = freezed,}) {
  return _then(_PartV4(
mainTexture: freezed == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as AssetReference?,pixelsPerUnit: freezed == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as bool?,colliderJson: freezed == colliderJson ? _self._colliderJson : colliderJson // ignore: cast_nullable_to_non_nullable
as List<String>?,glowMap: freezed == glowMap ? _self.glowMap : glowMap ,grabPosition: freezed == grabPosition ? _self.grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as MelonVector3?,canBeTaken: freezed == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool?,canGlow: freezed == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool?,canBurn: freezed == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool?,canFloat: freezed == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool?,rotateViaPointer: freezed == rotateViaPointer ? _self.rotateViaPointer : rotateViaPointer // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceCopyWith<$Res>? get mainTexture {
    if (_self.mainTexture == null) {
    return null;
  }

  return $AssetReferenceCopyWith<$Res>(_self.mainTexture!, (value) {
    return _then(_self.copyWith(mainTexture: value));
  });
}/// Create a copy of PartV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector3CopyWith<$Res>? get grabPosition {
    if (_self.grabPosition == null) {
    return null;
  }

  return $MelonVector3CopyWith<$Res>(_self.grabPosition!, (value) {
    return _then(_self.copyWith(grabPosition: value));
  });
}
}

// dart format on
