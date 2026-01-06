// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_data_v4.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonDataV4 {

 List<PartV4> get parts; List<ModHumanV4> get modHuman; List<Object> get modFirearms; List<Object> get modClothes; List<Object> get colorData;@JsonKey(name: 'ScriptsData') List<Object> get scriptsData;
/// Create a copy of MelonDataV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonDataV4CopyWith<MelonDataV4> get copyWith => _$MelonDataV4CopyWithImpl<MelonDataV4>(this as MelonDataV4, _$identity);

  /// Serializes this MelonDataV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonDataV4&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.modHuman, modHuman)&&const DeepCollectionEquality().equals(other.modFirearms, modFirearms)&&const DeepCollectionEquality().equals(other.modClothes, modClothes)&&const DeepCollectionEquality().equals(other.colorData, colorData)&&const DeepCollectionEquality().equals(other.scriptsData, scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(modHuman),const DeepCollectionEquality().hash(modFirearms),const DeepCollectionEquality().hash(modClothes),const DeepCollectionEquality().hash(colorData),const DeepCollectionEquality().hash(scriptsData));

@override
String toString() {
  return 'MelonDataV4(parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, modClothes: $modClothes, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class $MelonDataV4CopyWith<$Res>  {
  factory $MelonDataV4CopyWith(MelonDataV4 value, $Res Function(MelonDataV4) _then) = _$MelonDataV4CopyWithImpl;
@useResult
$Res call({
 List<PartV4> parts, List<ModHumanV4> modHuman, List<Object> modFirearms, List<Object> modClothes, List<Object> colorData,@JsonKey(name: 'ScriptsData') List<Object> scriptsData
});




}
/// @nodoc
class _$MelonDataV4CopyWithImpl<$Res>
    implements $MelonDataV4CopyWith<$Res> {
  _$MelonDataV4CopyWithImpl(this._self, this._then);

  final MelonDataV4 _self;
  final $Res Function(MelonDataV4) _then;

/// Create a copy of MelonDataV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parts = null,Object? modHuman = null,Object? modFirearms = null,Object? modClothes = null,Object? colorData = null,Object? scriptsData = null,}) {
  return _then(_self.copyWith(
parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV4>,modHuman: null == modHuman ? _self.modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV4>,modFirearms: null == modFirearms ? _self.modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<Object>,modClothes: null == modClothes ? _self.modClothes : modClothes // ignore: cast_nullable_to_non_nullable
as List<Object>,colorData: null == colorData ? _self.colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<Object>,scriptsData: null == scriptsData ? _self.scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<Object>,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonDataV4].
extension MelonDataV4Patterns on MelonDataV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonDataV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonDataV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonDataV4 value)  $default,){
final _that = this;
switch (_that) {
case _MelonDataV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonDataV4 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonDataV4() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PartV4> parts,  List<ModHumanV4> modHuman,  List<Object> modFirearms,  List<Object> modClothes,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonDataV4() when $default != null:
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.modClothes,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PartV4> parts,  List<ModHumanV4> modHuman,  List<Object> modFirearms,  List<Object> modClothes,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)  $default,) {final _that = this;
switch (_that) {
case _MelonDataV4():
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.modClothes,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PartV4> parts,  List<ModHumanV4> modHuman,  List<Object> modFirearms,  List<Object> modClothes,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)?  $default,) {final _that = this;
switch (_that) {
case _MelonDataV4() when $default != null:
return $default(_that.parts,_that.modHuman,_that.modFirearms,_that.modClothes,_that.colorData,_that.scriptsData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonDataV4 implements MelonDataV4 {
  const _MelonDataV4({required final  List<PartV4> parts, required final  List<ModHumanV4> modHuman, required final  List<Object> modFirearms, required final  List<Object> modClothes, required final  List<Object> colorData, @JsonKey(name: 'ScriptsData') required final  List<Object> scriptsData}): _parts = parts,_modHuman = modHuman,_modFirearms = modFirearms,_modClothes = modClothes,_colorData = colorData,_scriptsData = scriptsData;
  factory _MelonDataV4.fromJson(Map<String, dynamic> json) => _$MelonDataV4FromJson(json);

 final  List<PartV4> _parts;
@override List<PartV4> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

 final  List<ModHumanV4> _modHuman;
@override List<ModHumanV4> get modHuman {
  if (_modHuman is EqualUnmodifiableListView) return _modHuman;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modHuman);
}

 final  List<Object> _modFirearms;
@override List<Object> get modFirearms {
  if (_modFirearms is EqualUnmodifiableListView) return _modFirearms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modFirearms);
}

 final  List<Object> _modClothes;
@override List<Object> get modClothes {
  if (_modClothes is EqualUnmodifiableListView) return _modClothes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modClothes);
}

 final  List<Object> _colorData;
@override List<Object> get colorData {
  if (_colorData is EqualUnmodifiableListView) return _colorData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorData);
}

 final  List<Object> _scriptsData;
@override@JsonKey(name: 'ScriptsData') List<Object> get scriptsData {
  if (_scriptsData is EqualUnmodifiableListView) return _scriptsData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scriptsData);
}


/// Create a copy of MelonDataV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonDataV4CopyWith<_MelonDataV4> get copyWith => __$MelonDataV4CopyWithImpl<_MelonDataV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonDataV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonDataV4&&const DeepCollectionEquality().equals(other._parts, _parts)&&const DeepCollectionEquality().equals(other._modHuman, _modHuman)&&const DeepCollectionEquality().equals(other._modFirearms, _modFirearms)&&const DeepCollectionEquality().equals(other._modClothes, _modClothes)&&const DeepCollectionEquality().equals(other._colorData, _colorData)&&const DeepCollectionEquality().equals(other._scriptsData, _scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_modHuman),const DeepCollectionEquality().hash(_modFirearms),const DeepCollectionEquality().hash(_modClothes),const DeepCollectionEquality().hash(_colorData),const DeepCollectionEquality().hash(_scriptsData));

@override
String toString() {
  return 'MelonDataV4(parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, modClothes: $modClothes, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class _$MelonDataV4CopyWith<$Res> implements $MelonDataV4CopyWith<$Res> {
  factory _$MelonDataV4CopyWith(_MelonDataV4 value, $Res Function(_MelonDataV4) _then) = __$MelonDataV4CopyWithImpl;
@override @useResult
$Res call({
 List<PartV4> parts, List<ModHumanV4> modHuman, List<Object> modFirearms, List<Object> modClothes, List<Object> colorData,@JsonKey(name: 'ScriptsData') List<Object> scriptsData
});




}
/// @nodoc
class __$MelonDataV4CopyWithImpl<$Res>
    implements _$MelonDataV4CopyWith<$Res> {
  __$MelonDataV4CopyWithImpl(this._self, this._then);

  final _MelonDataV4 _self;
  final $Res Function(_MelonDataV4) _then;

/// Create a copy of MelonDataV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parts = null,Object? modHuman = null,Object? modFirearms = null,Object? modClothes = null,Object? colorData = null,Object? scriptsData = null,}) {
  return _then(_MelonDataV4(
parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV4>,modHuman: null == modHuman ? _self._modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV4>,modFirearms: null == modFirearms ? _self._modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<Object>,modClothes: null == modClothes ? _self._modClothes : modClothes // ignore: cast_nullable_to_non_nullable
as List<Object>,colorData: null == colorData ? _self._colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<Object>,scriptsData: null == scriptsData ? _self._scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<Object>,
  ));
}


}

// dart format on
