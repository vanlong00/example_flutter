// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_data_v3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonDataV3 {

 List<PartV3>? get parts; List<ModHumanV3>? get modHuman; List<dynamic>? get modFirearms; List<dynamic>? get colorData;@JsonKey(name: 'ScriptsData') List<dynamic>? get scriptsData;
/// Create a copy of MelonDataV3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonDataV3CopyWith<MelonDataV3> get copyWith => _$MelonDataV3CopyWithImpl<MelonDataV3>(this as MelonDataV3, _$identity);

  /// Serializes this MelonDataV3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonDataV3&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.modHuman, modHuman)&&const DeepCollectionEquality().equals(other.modFirearms, modFirearms)&&const DeepCollectionEquality().equals(other.colorData, colorData)&&const DeepCollectionEquality().equals(other.scriptsData, scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(modHuman),const DeepCollectionEquality().hash(modFirearms),const DeepCollectionEquality().hash(colorData),const DeepCollectionEquality().hash(scriptsData));

@override
String toString() {
  return 'MelonDataV3(parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class $MelonDataV3CopyWith<$Res>  {
  factory $MelonDataV3CopyWith(MelonDataV3 value, $Res Function(MelonDataV3) _then) = _$MelonDataV3CopyWithImpl;
@useResult
$Res call({
 List<PartV3>? parts, List<ModHumanV3>? modHuman, List<dynamic>? modFirearms, List<dynamic>? colorData,@JsonKey(name: 'ScriptsData') List<dynamic>? scriptsData
});




}
/// @nodoc
class _$MelonDataV3CopyWithImpl<$Res>
    implements $MelonDataV3CopyWith<$Res> {
  _$MelonDataV3CopyWithImpl(this._self, this._then);

  final MelonDataV3 _self;
  final $Res Function(MelonDataV3) _then;

/// Create a copy of MelonDataV3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parts = freezed,Object? modHuman = freezed,Object? modFirearms = freezed,Object? colorData = freezed,Object? scriptsData = freezed,}) {
  return _then(_self.copyWith(
parts: freezed == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV3>?,modHuman: freezed == modHuman ? _self.modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV3>?,modFirearms: freezed == modFirearms ? _self.modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,colorData: freezed == colorData ? _self.colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,scriptsData: freezed == scriptsData ? _self.scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonDataV3].
extension MelonDataV3Patterns on MelonDataV3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonDataV3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonDataV3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonDataV3 value)  $default,){
final _that = this;
switch (_that) {
case _MelonDataV3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonDataV3 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonDataV3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PartV3>? parts,  List<ModHumanV3>? modHuman,  List<dynamic>? modFirearms,  List<dynamic>? colorData, @JsonKey(name: 'ScriptsData')  List<dynamic>? scriptsData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonDataV3() when $default != null:
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PartV3>? parts,  List<ModHumanV3>? modHuman,  List<dynamic>? modFirearms,  List<dynamic>? colorData, @JsonKey(name: 'ScriptsData')  List<dynamic>? scriptsData)  $default,) {final _that = this;
switch (_that) {
case _MelonDataV3():
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PartV3>? parts,  List<ModHumanV3>? modHuman,  List<dynamic>? modFirearms,  List<dynamic>? colorData, @JsonKey(name: 'ScriptsData')  List<dynamic>? scriptsData)?  $default,) {final _that = this;
switch (_that) {
case _MelonDataV3() when $default != null:
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.colorData,_that.scriptsData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonDataV3 implements MelonDataV3 {
  const _MelonDataV3({final  List<PartV3>? parts, final  List<ModHumanV3>? modHuman, final  List<dynamic>? modFirearms, final  List<dynamic>? colorData, @JsonKey(name: 'ScriptsData') final  List<dynamic>? scriptsData}): _parts = parts,_modHuman = modHuman,_modFirearms = modFirearms,_colorData = colorData,_scriptsData = scriptsData;
  factory _MelonDataV3.fromJson(Map<String, dynamic> json) => _$MelonDataV3FromJson(json);

 final  List<PartV3>? _parts;
@override List<PartV3>? get parts {
  final value = _parts;
  if (value == null) return null;
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ModHumanV3>? _modHuman;
@override List<ModHumanV3>? get modHuman {
  final value = _modHuman;
  if (value == null) return null;
  if (_modHuman is EqualUnmodifiableListView) return _modHuman;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _modFirearms;
@override List<dynamic>? get modFirearms {
  final value = _modFirearms;
  if (value == null) return null;
  if (_modFirearms is EqualUnmodifiableListView) return _modFirearms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _colorData;
@override List<dynamic>? get colorData {
  final value = _colorData;
  if (value == null) return null;
  if (_colorData is EqualUnmodifiableListView) return _colorData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _scriptsData;
@override@JsonKey(name: 'ScriptsData') List<dynamic>? get scriptsData {
  final value = _scriptsData;
  if (value == null) return null;
  if (_scriptsData is EqualUnmodifiableListView) return _scriptsData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MelonDataV3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonDataV3CopyWith<_MelonDataV3> get copyWith => __$MelonDataV3CopyWithImpl<_MelonDataV3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonDataV3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonDataV3&&const DeepCollectionEquality().equals(other._parts, _parts)&&const DeepCollectionEquality().equals(other._modHuman, _modHuman)&&const DeepCollectionEquality().equals(other._modFirearms, _modFirearms)&&const DeepCollectionEquality().equals(other._colorData, _colorData)&&const DeepCollectionEquality().equals(other._scriptsData, _scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_modHuman),const DeepCollectionEquality().hash(_modFirearms),const DeepCollectionEquality().hash(_colorData),const DeepCollectionEquality().hash(_scriptsData));

@override
String toString() {
  return 'MelonDataV3(parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class _$MelonDataV3CopyWith<$Res> implements $MelonDataV3CopyWith<$Res> {
  factory _$MelonDataV3CopyWith(_MelonDataV3 value, $Res Function(_MelonDataV3) _then) = __$MelonDataV3CopyWithImpl;
@override @useResult
$Res call({
 List<PartV3>? parts, List<ModHumanV3>? modHuman, List<dynamic>? modFirearms, List<dynamic>? colorData,@JsonKey(name: 'ScriptsData') List<dynamic>? scriptsData
});




}
/// @nodoc
class __$MelonDataV3CopyWithImpl<$Res>
    implements _$MelonDataV3CopyWith<$Res> {
  __$MelonDataV3CopyWithImpl(this._self, this._then);

  final _MelonDataV3 _self;
  final $Res Function(_MelonDataV3) _then;

/// Create a copy of MelonDataV3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parts = freezed,Object? modHuman = freezed,Object? modFirearms = freezed,Object? colorData = freezed,Object? scriptsData = freezed,}) {
  return _then(_MelonDataV3(
parts: freezed == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV3>?,modHuman: freezed == modHuman ? _self._modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV3>?,modFirearms: freezed == modFirearms ? _self._modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,colorData: freezed == colorData ? _self._colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,scriptsData: freezed == scriptsData ? _self._scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}


/// @nodoc
mixin _$PartV3 {

 AssetReferenceV3? get mainTexture; double? get pixelsPerUnit; List<String>? get collidersJson; dynamic get glowMap; Map<String, dynamic>? get grabPosition; bool? get canBeTaken; bool? get canGlow; bool? get canBurn; bool? get canFloat;@JsonKey(name: 'RotateViaPointer') bool? get rotateViaPointer;
/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartV3CopyWith<PartV3> get copyWith => _$PartV3CopyWithImpl<PartV3>(this as PartV3, _$identity);

  /// Serializes this PartV3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartV3&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&const DeepCollectionEquality().equals(other.collidersJson, collidersJson)&&const DeepCollectionEquality().equals(other.glowMap, glowMap)&&const DeepCollectionEquality().equals(other.grabPosition, grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat)&&(identical(other.rotateViaPointer, rotateViaPointer) || other.rotateViaPointer == rotateViaPointer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,const DeepCollectionEquality().hash(collidersJson),const DeepCollectionEquality().hash(glowMap),const DeepCollectionEquality().hash(grabPosition),canBeTaken,canGlow,canBurn,canFloat,rotateViaPointer);

@override
String toString() {
  return 'PartV3(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, collidersJson: $collidersJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat, rotateViaPointer: $rotateViaPointer)';
}


}

/// @nodoc
abstract mixin class $PartV3CopyWith<$Res>  {
  factory $PartV3CopyWith(PartV3 value, $Res Function(PartV3) _then) = _$PartV3CopyWithImpl;
@useResult
$Res call({
 AssetReferenceV3? mainTexture, double? pixelsPerUnit, List<String>? collidersJson, dynamic glowMap, Map<String, dynamic>? grabPosition, bool? canBeTaken, bool? canGlow, bool? canBurn, bool? canFloat,@JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer
});


$AssetReferenceV3CopyWith<$Res>? get mainTexture;

}
/// @nodoc
class _$PartV3CopyWithImpl<$Res>
    implements $PartV3CopyWith<$Res> {
  _$PartV3CopyWithImpl(this._self, this._then);

  final PartV3 _self;
  final $Res Function(PartV3) _then;

/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainTexture = freezed,Object? pixelsPerUnit = freezed,Object? collidersJson = freezed,Object? glowMap = freezed,Object? grabPosition = freezed,Object? canBeTaken = freezed,Object? canGlow = freezed,Object? canBurn = freezed,Object? canFloat = freezed,Object? rotateViaPointer = freezed,}) {
  return _then(_self.copyWith(
mainTexture: freezed == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as AssetReferenceV3?,pixelsPerUnit: freezed == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as double?,collidersJson: freezed == collidersJson ? _self.collidersJson : collidersJson // ignore: cast_nullable_to_non_nullable
as List<String>?,glowMap: freezed == glowMap ? _self.glowMap : glowMap // ignore: cast_nullable_to_non_nullable
as dynamic,grabPosition: freezed == grabPosition ? _self.grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,canBeTaken: freezed == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool?,canGlow: freezed == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool?,canBurn: freezed == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool?,canFloat: freezed == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool?,rotateViaPointer: freezed == rotateViaPointer ? _self.rotateViaPointer : rotateViaPointer // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceV3CopyWith<$Res>? get mainTexture {
    if (_self.mainTexture == null) {
    return null;
  }

  return $AssetReferenceV3CopyWith<$Res>(_self.mainTexture!, (value) {
    return _then(_self.copyWith(mainTexture: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartV3].
extension PartV3Patterns on PartV3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartV3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartV3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartV3 value)  $default,){
final _that = this;
switch (_that) {
case _PartV3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartV3 value)?  $default,){
final _that = this;
switch (_that) {
case _PartV3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssetReferenceV3? mainTexture,  double? pixelsPerUnit,  List<String>? collidersJson,  dynamic glowMap,  Map<String, dynamic>? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartV3() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssetReferenceV3? mainTexture,  double? pixelsPerUnit,  List<String>? collidersJson,  dynamic glowMap,  Map<String, dynamic>? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)  $default,) {final _that = this;
switch (_that) {
case _PartV3():
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssetReferenceV3? mainTexture,  double? pixelsPerUnit,  List<String>? collidersJson,  dynamic glowMap,  Map<String, dynamic>? grabPosition,  bool? canBeTaken,  bool? canGlow,  bool? canBurn,  bool? canFloat, @JsonKey(name: 'RotateViaPointer')  bool? rotateViaPointer)?  $default,) {final _that = this;
switch (_that) {
case _PartV3() when $default != null:
return $default(_that.mainTexture,_that.pixelsPerUnit,_that.collidersJson,_that.glowMap,_that.grabPosition,_that.canBeTaken,_that.canGlow,_that.canBurn,_that.canFloat,_that.rotateViaPointer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartV3 implements PartV3 {
  const _PartV3({this.mainTexture, this.pixelsPerUnit, final  List<String>? collidersJson, this.glowMap, final  Map<String, dynamic>? grabPosition, this.canBeTaken, this.canGlow, this.canBurn, this.canFloat, @JsonKey(name: 'RotateViaPointer') this.rotateViaPointer}): _collidersJson = collidersJson,_grabPosition = grabPosition;
  factory _PartV3.fromJson(Map<String, dynamic> json) => _$PartV3FromJson(json);

@override final  AssetReferenceV3? mainTexture;
@override final  double? pixelsPerUnit;
 final  List<String>? _collidersJson;
@override List<String>? get collidersJson {
  final value = _collidersJson;
  if (value == null) return null;
  if (_collidersJson is EqualUnmodifiableListView) return _collidersJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  dynamic glowMap;
 final  Map<String, dynamic>? _grabPosition;
@override Map<String, dynamic>? get grabPosition {
  final value = _grabPosition;
  if (value == null) return null;
  if (_grabPosition is EqualUnmodifiableMapView) return _grabPosition;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool? canBeTaken;
@override final  bool? canGlow;
@override final  bool? canBurn;
@override final  bool? canFloat;
@override@JsonKey(name: 'RotateViaPointer') final  bool? rotateViaPointer;

/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartV3CopyWith<_PartV3> get copyWith => __$PartV3CopyWithImpl<_PartV3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartV3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartV3&&(identical(other.mainTexture, mainTexture) || other.mainTexture == mainTexture)&&(identical(other.pixelsPerUnit, pixelsPerUnit) || other.pixelsPerUnit == pixelsPerUnit)&&const DeepCollectionEquality().equals(other._collidersJson, _collidersJson)&&const DeepCollectionEquality().equals(other.glowMap, glowMap)&&const DeepCollectionEquality().equals(other._grabPosition, _grabPosition)&&(identical(other.canBeTaken, canBeTaken) || other.canBeTaken == canBeTaken)&&(identical(other.canGlow, canGlow) || other.canGlow == canGlow)&&(identical(other.canBurn, canBurn) || other.canBurn == canBurn)&&(identical(other.canFloat, canFloat) || other.canFloat == canFloat)&&(identical(other.rotateViaPointer, rotateViaPointer) || other.rotateViaPointer == rotateViaPointer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainTexture,pixelsPerUnit,const DeepCollectionEquality().hash(_collidersJson),const DeepCollectionEquality().hash(glowMap),const DeepCollectionEquality().hash(_grabPosition),canBeTaken,canGlow,canBurn,canFloat,rotateViaPointer);

@override
String toString() {
  return 'PartV3(mainTexture: $mainTexture, pixelsPerUnit: $pixelsPerUnit, collidersJson: $collidersJson, glowMap: $glowMap, grabPosition: $grabPosition, canBeTaken: $canBeTaken, canGlow: $canGlow, canBurn: $canBurn, canFloat: $canFloat, rotateViaPointer: $rotateViaPointer)';
}


}

/// @nodoc
abstract mixin class _$PartV3CopyWith<$Res> implements $PartV3CopyWith<$Res> {
  factory _$PartV3CopyWith(_PartV3 value, $Res Function(_PartV3) _then) = __$PartV3CopyWithImpl;
@override @useResult
$Res call({
 AssetReferenceV3? mainTexture, double? pixelsPerUnit, List<String>? collidersJson, dynamic glowMap, Map<String, dynamic>? grabPosition, bool? canBeTaken, bool? canGlow, bool? canBurn, bool? canFloat,@JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer
});


@override $AssetReferenceV3CopyWith<$Res>? get mainTexture;

}
/// @nodoc
class __$PartV3CopyWithImpl<$Res>
    implements _$PartV3CopyWith<$Res> {
  __$PartV3CopyWithImpl(this._self, this._then);

  final _PartV3 _self;
  final $Res Function(_PartV3) _then;

/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainTexture = freezed,Object? pixelsPerUnit = freezed,Object? collidersJson = freezed,Object? glowMap = freezed,Object? grabPosition = freezed,Object? canBeTaken = freezed,Object? canGlow = freezed,Object? canBurn = freezed,Object? canFloat = freezed,Object? rotateViaPointer = freezed,}) {
  return _then(_PartV3(
mainTexture: freezed == mainTexture ? _self.mainTexture : mainTexture // ignore: cast_nullable_to_non_nullable
as AssetReferenceV3?,pixelsPerUnit: freezed == pixelsPerUnit ? _self.pixelsPerUnit : pixelsPerUnit // ignore: cast_nullable_to_non_nullable
as double?,collidersJson: freezed == collidersJson ? _self._collidersJson : collidersJson // ignore: cast_nullable_to_non_nullable
as List<String>?,glowMap: freezed == glowMap ? _self.glowMap : glowMap // ignore: cast_nullable_to_non_nullable
as dynamic,grabPosition: freezed == grabPosition ? _self._grabPosition : grabPosition // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,canBeTaken: freezed == canBeTaken ? _self.canBeTaken : canBeTaken // ignore: cast_nullable_to_non_nullable
as bool?,canGlow: freezed == canGlow ? _self.canGlow : canGlow // ignore: cast_nullable_to_non_nullable
as bool?,canBurn: freezed == canBurn ? _self.canBurn : canBurn // ignore: cast_nullable_to_non_nullable
as bool?,canFloat: freezed == canFloat ? _self.canFloat : canFloat // ignore: cast_nullable_to_non_nullable
as bool?,rotateViaPointer: freezed == rotateViaPointer ? _self.rotateViaPointer : rotateViaPointer // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of PartV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceV3CopyWith<$Res>? get mainTexture {
    if (_self.mainTexture == null) {
    return null;
  }

  return $AssetReferenceV3CopyWith<$Res>(_self.mainTexture!, (value) {
    return _then(_self.copyWith(mainTexture: value));
  });
}
}

// dart format on
