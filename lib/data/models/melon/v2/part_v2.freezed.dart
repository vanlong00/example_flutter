// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartV2 {

 String get mainTexture; double get pixelsPerUnit; int get mainTextureWidth; int get mainTextureHeight;@JsonKey(name: 'collidersJson') List<String> get collidersJson; List<Object> get glowMap; MelonVector3 get grabPosition; bool get canBeTaken; bool get canGlow; bool get canBurn; bool get canFloat;
/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartV2CopyWith<PartV2> get copyWith => _$PartV2CopyWithImpl<PartV2>(this as PartV2, _$identity);

  /// Serializes this PartV2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartV2&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&(identical(other.mainTextureWidth, mainTextureWidth) || other.mainTextureWidth == mainTextureWidth)&&(identical(other.mainTextureHeight, mainTextureHeight) || other.mainTextureHeight == mainTextureHeight)&&const DeepCollectionEquality().equals(other.collidersJson, collidersJson)&&const DeepCollectionEquality().equals(other.glowMap, glowMap)&&(identical(other.grabPosition, grabPosition) || other.grabPosition == grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,mainTextureWidth,mainTextureHeight,const DeepCollectionEquality().hash(collidersJson),const DeepCollectionEquality().hash(glowMap),grabPosition,canBeTaken,canGlow,canBurn,canFloat);

@override
String toString() {
  return 'PartV2(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, mainTextureWidth: $mainTextureWidth, mainTextureHeight: $mainTextureHeight, collidersJson: $collidersJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat)';
}


}

/// @nodoc
abstract mixin class $PartV2CopyWith<$Res>  {
  factory $PartV2CopyWith(PartV2 value, $Res Function(PartV2) _then) = _$PartV2CopyWithImpl;
@useResult
$Res call({
 String mainTexture, double pixelsPerUnit, int mainTextureWidth, int mainTextureHeight,@JsonKey(name: 'collidersJson') List<String> collidersJson, List<Object> glowMap, MelonVector3 grabPosition, bool canBeTaken, bool canGlow, bool canBurn, bool canFloat
});


$MelonVector3CopyWith<$Res> get grabPosition;

}
/// @nodoc
class _$PartV2CopyWithImpl<$Res>
    implements $PartV2CopyWith<$Res> {
  _$PartV2CopyWithImpl(this._self, this._then);

  final PartV2 _self;
  final $Res Function(PartV2) _then;

/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainTexture = null,Object? pixelsPerUnit = null,Object? mainTextureWidth = null,Object? mainTextureHeight = null,Object? collidersJson = null,Object? glowMap = null,Object? grabPosition = null,Object? canBeTaken = null,Object? canGlow = null,Object? canBurn = null,Object? canFloat = null,}) {
  return _then(_self.copyWith(
mainTexture: null == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as String,pixelsPerUnit: null == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as double,mainTextureWidth: null == mainTextureWidth ? _self.mainTextureWidth : mainTextureWidth // ignore: cast_nullable_to_non_nullable
as int,mainTextureHeight: null == mainTextureHeight ? _self.mainTextureHeight : mainTextureHeight // ignore: cast_nullable_to_non_nullable
as int,collidersJson: null == collidersJson ? _self.collidersJson : collidersJson // ignore: cast_nullable_to_non_nullable
as List<String>,glowMap: null == glowMap ? _self.glowMap : glowMap // ignore: cast_nullable_to_non_nullable
as List<Object>,grabPosition: null == grabPosition ? _self.grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as MelonVector3,canBeTaken: null == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool,canGlow: null == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool,canBurn: null == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool,canFloat: null == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector3CopyWith<$Res> get grabPosition {
  
  return $MelonVector3CopyWith<$Res>(_self.grabPosition, (value) {
    return _then(_self.copyWith(grabPosition: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartV2].
extension PartV2Patterns on PartV2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartV2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartV2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartV2 value)  $default,){
final _that = this;
switch (_that) {
case _PartV2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartV2 value)?  $default,){
final _that = this;
switch (_that) {
case _PartV2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mainTexture,  double pixelsPerUnit,  int mainTextureWidth,  int mainTextureHeight, @JsonKey(name: 'collidersJson')  List<String> collidersJson,  List<Object> glowMap,  MelonVector3 grabPosition,  bool canBeTaken,  bool canGlow,  bool canBurn,  bool canFloat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartV2() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.mainTextureWidth,_that.mainTextureHeight,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mainTexture,  double pixelsPerUnit,  int mainTextureWidth,  int mainTextureHeight, @JsonKey(name: 'collidersJson')  List<String> collidersJson,  List<Object> glowMap,  MelonVector3 grabPosition,  bool canBeTaken,  bool canGlow,  bool canBurn,  bool canFloat)  $default,) {final _that = this;
switch (_that) {
case _PartV2():
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.mainTextureWidth,_that.mainTextureHeight,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mainTexture,  double pixelsPerUnit,  int mainTextureWidth,  int mainTextureHeight, @JsonKey(name: 'collidersJson')  List<String> collidersJson,  List<Object> glowMap,  MelonVector3 grabPosition,  bool canBeTaken,  bool canGlow,  bool canBurn,  bool canFloat)?  $default,) {final _that = this;
switch (_that) {
case _PartV2() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.mainTextureWidth,_that.mainTextureHeight,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartV2 implements PartV2 {
  const _PartV2({required this.mainTexture, required this.pixelsPerUnit, required this.mainTextureWidth, required this.mainTextureHeight, @JsonKey(name: 'collidersJson') required final  List<String> collidersJson, required final  List<Object> glowMap, required this.grabPosition, required this.canBeTaken, required this.canGlow, required this.canBurn, required this.canFloat}): _collidersJson = collidersJson,_glowMap = glowMap;
  factory _PartV2.fromJson(Map<String, dynamic> json) => _$PartV2FromJson(json);

@override final  String mainTexture;
@override final  double pixelsPerUnit;
@override final  int mainTextureWidth;
@override final  int mainTextureHeight;
 final  List<String> _collidersJson;
@override@JsonKey(name: 'collidersJson') List<String> get collidersJson {
  if (_collidersJson is EqualUnmodifiableListView) return _collidersJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collidersJson);
}

 final  List<Object> _glowMap;
@override List<Object> get glowMap {
  if (_glowMap is EqualUnmodifiableListView) return _glowMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_glowMap);
}

@override final  MelonVector3 grabPosition;
@override final  bool canBeTaken;
@override final  bool canGlow;
@override final  bool canBurn;
@override final  bool canFloat;

/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartV2CopyWith<_PartV2> get copyWith => __$PartV2CopyWithImpl<_PartV2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartV2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartV2&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&(identical(other.mainTextureWidth, mainTextureWidth) || other.mainTextureWidth == mainTextureWidth)&&(identical(other.mainTextureHeight, mainTextureHeight) || other.mainTextureHeight == mainTextureHeight)&&const DeepCollectionEquality().equals(other._collidersJson, _collidersJson)&&const DeepCollectionEquality().equals(other._glowMap, _glowMap)&&(identical(other.grabPosition, grabPosition) || other.grabPosition == grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,mainTextureWidth,mainTextureHeight,const DeepCollectionEquality().hash(_collidersJson),const DeepCollectionEquality().hash(_glowMap),grabPosition,canBeTaken,canGlow,canBurn,canFloat);

@override
String toString() {
  return 'PartV2(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, mainTextureWidth: $mainTextureWidth, mainTextureHeight: $mainTextureHeight, collidersJson: $collidersJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat)';
}


}

/// @nodoc
abstract mixin class _$PartV2CopyWith<$Res> implements $PartV2CopyWith<$Res> {
  factory _$PartV2CopyWith(_PartV2 value, $Res Function(_PartV2) _then) = __$PartV2CopyWithImpl;
@override @useResult
$Res call({
 String mainTexture, double pixelsPerUnit, int mainTextureWidth, int mainTextureHeight,@JsonKey(name: 'collidersJson') List<String> collidersJson, List<Object> glowMap, MelonVector3 grabPosition, bool canBeTaken, bool canGlow, bool canBurn, bool canFloat
});


@override $MelonVector3CopyWith<$Res> get grabPosition;

}
/// @nodoc
class __$PartV2CopyWithImpl<$Res>
    implements _$PartV2CopyWith<$Res> {
  __$PartV2CopyWithImpl(this._self, this._then);

  final _PartV2 _self;
  final $Res Function(_PartV2) _then;

/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainTexture = null,Object? pixelsPerUnit = null,Object? mainTextureWidth = null,Object? mainTextureHeight = null,Object? collidersJson = null,Object? glowMap = null,Object? grabPosition = null,Object? canBeTaken = null,Object? canGlow = null,Object? canBurn = null,Object? canFloat = null,}) {
  return _then(_PartV2(
mainTexture: null == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as String,pixelsPerUnit: null == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as double,mainTextureWidth: null == mainTextureWidth ? _self.mainTextureWidth : mainTextureWidth // ignore: cast_nullable_to_non_nullable
as int,mainTextureHeight: null == mainTextureHeight ? _self.mainTextureHeight : mainTextureHeight // ignore: cast_nullable_to_non_nullable
as int,collidersJson: null == collidersJson ? _self._collidersJson : collidersJson // ignore: cast_nullable_to_non_nullable
as List<String>,glowMap: null == glowMap ? _self._glowMap : glowMap // ignore: cast_nullable_to_non_nullable
as List<Object>,grabPosition: null == grabPosition ? _self.grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as MelonVector3,canBeTaken: null == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool,canGlow: null == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool,canBurn: null == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool,canFloat: null == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PartV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector3CopyWith<$Res> get grabPosition {
  
  return $MelonVector3CopyWith<$Res>(_self.grabPosition, (value) {
    return _then(_self.copyWith(grabPosition: value));
  });
}
}

// dart format on
