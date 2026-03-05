// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonV2 {

 int get convertVersion; int get modType; String get uniqueId; String get type; String get category; String get customCategory; bool get isActivated; List<int> get icon; int get iconWidth; int get iconHeight; List<PartV2> get parts; List<ModHumanV2> get modHuman; List<Object> get modFirearms; MelonMetadataV2 get metadata; List<Object> get colorData;@JsonKey(name: 'ScriptsData') List<Object> get scriptsData;
/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonV2CopyWith<MelonV2> get copyWith => _$MelonV2CopyWithImpl<MelonV2>(this as MelonV2, _$identity);

  /// Serializes this MelonV2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonV2&&(identical(other.convertVersion, convertVersion) || other.convertVersion == convertVersion)&&(identical(other.modType, modType) || other.modType == modType)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.customCategory, customCategory) || other.customCategory == customCategory)&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&const DeepCollectionEquality().equals(other.icon, icon)&&(identical(other.iconWidth, iconWidth) || other.iconWidth == iconWidth)&&(identical(other.iconHeight, iconHeight) || other.iconHeight == iconHeight)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.modHuman, modHuman)&&const DeepCollectionEquality().equals(other.modFirearms, modFirearms)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.colorData, colorData)&&const DeepCollectionEquality().equals(other.scriptsData, scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,convertVersion,modType,uniqueId,type,category,customCategory,isActivated,const DeepCollectionEquality().hash(icon),iconWidth,iconHeight,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(modHuman),const DeepCollectionEquality().hash(modFirearms),metadata,const DeepCollectionEquality().hash(colorData),const DeepCollectionEquality().hash(scriptsData));

@override
String toString() {
  return 'MelonV2(convertVersion: $convertVersion, modType: $modType, uniqueId: $uniqueId, type: $type, category: $category, customCategory: $customCategory, isActivated: $isActivated, icon: $icon, iconWidth: $iconWidth, iconHeight: $iconHeight, parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, metadata: $metadata, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class $MelonV2CopyWith<$Res>  {
  factory $MelonV2CopyWith(MelonV2 value, $Res Function(MelonV2) _then) = _$MelonV2CopyWithImpl;
@useResult
$Res call({
 int convertVersion, int modType, String uniqueId, String type, String category, String customCategory, bool isActivated, List<int> icon, int iconWidth, int iconHeight, List<PartV2> parts, List<ModHumanV2> modHuman, List<Object> modFirearms, MelonMetadataV2 metadata, List<Object> colorData,@JsonKey(name: 'ScriptsData') List<Object> scriptsData
});


$MelonMetadataV2CopyWith<$Res> get metadata;

}
/// @nodoc
class _$MelonV2CopyWithImpl<$Res>
    implements $MelonV2CopyWith<$Res> {
  _$MelonV2CopyWithImpl(this._self, this._then);

  final MelonV2 _self;
  final $Res Function(MelonV2) _then;

/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? convertVersion = null,Object? modType = null,Object? uniqueId = null,Object? type = null,Object? category = null,Object? customCategory = null,Object? isActivated = null,Object? icon = null,Object? iconWidth = null,Object? iconHeight = null,Object? parts = null,Object? modHuman = null,Object? modFirearms = null,Object? metadata = null,Object? colorData = null,Object? scriptsData = null,}) {
  return _then(_self.copyWith(
convertVersion: null == convertVersion ? _self.convertVersion : convertVersion // ignore: cast_nullable_to_non_nullable
as int,modType: null == modType ? _self.modType : modType // ignore: cast_nullable_to_non_nullable
as int,uniqueId: null == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,customCategory: null == customCategory ? _self.customCategory : customCategory // ignore: cast_nullable_to_non_nullable
as String,isActivated: null == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as List<int>,iconWidth: null == iconWidth ? _self.iconWidth : iconWidth // ignore: cast_nullable_to_non_nullable
as int,iconHeight: null == iconHeight ? _self.iconHeight : iconHeight // ignore: cast_nullable_to_non_nullable
as int,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV2>,modHuman: null == modHuman ? _self.modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV2>,modFirearms: null == modFirearms ? _self.modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<Object>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonMetadataV2,colorData: null == colorData ? _self.colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<Object>,scriptsData: null == scriptsData ? _self.scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<Object>,
  ));
}
/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonMetadataV2CopyWith<$Res> get metadata {
  
  return $MelonMetadataV2CopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [MelonV2].
extension MelonV2Patterns on MelonV2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonV2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonV2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonV2 value)  $default,){
final _that = this;
switch (_that) {
case _MelonV2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonV2 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonV2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int convertVersion,  int modType,  String uniqueId,  String type,  String category,  String customCategory,  bool isActivated,  List<int> icon,  int iconWidth,  int iconHeight,  List<PartV2> parts,  List<ModHumanV2> modHuman,  List<Object> modFirearms,  MelonMetadataV2 metadata,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonV2() when $default != null:
return $default(_that.convertVersion,_that.modType,_that.uniqueId,_that.type,_that.category,_that.customCategory,_that.isActivated,_that.icon,_that.iconWidth,_that.iconHeight,_that.parts,_that.modHuman,_that.modFirearms,_that.metadata,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int convertVersion,  int modType,  String uniqueId,  String type,  String category,  String customCategory,  bool isActivated,  List<int> icon,  int iconWidth,  int iconHeight,  List<PartV2> parts,  List<ModHumanV2> modHuman,  List<Object> modFirearms,  MelonMetadataV2 metadata,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)  $default,) {final _that = this;
switch (_that) {
case _MelonV2():
return $default(_that.convertVersion,_that.modType,_that.uniqueId,_that.type,_that.category,_that.customCategory,_that.isActivated,_that.icon,_that.iconWidth,_that.iconHeight,_that.parts,_that.modHuman,_that.modFirearms,_that.metadata,_that.colorData,_that.scriptsData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int convertVersion,  int modType,  String uniqueId,  String type,  String category,  String customCategory,  bool isActivated,  List<int> icon,  int iconWidth,  int iconHeight,  List<PartV2> parts,  List<ModHumanV2> modHuman,  List<Object> modFirearms,  MelonMetadataV2 metadata,  List<Object> colorData, @JsonKey(name: 'ScriptsData')  List<Object> scriptsData)?  $default,) {final _that = this;
switch (_that) {
case _MelonV2() when $default != null:
return $default(_that.convertVersion,_that.modType,_that.uniqueId,_that.type,_that.category,_that.customCategory,_that.isActivated,_that.icon,_that.iconWidth,_that.iconHeight,_that.parts,_that.modHuman,_that.modFirearms,_that.metadata,_that.colorData,_that.scriptsData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonV2 implements MelonV2 {
  const _MelonV2({required this.convertVersion, required this.modType, required this.uniqueId, required this.type, required this.category, required this.customCategory, required this.isActivated, required final  List<int> icon, required this.iconWidth, required this.iconHeight, required final  List<PartV2> parts, required final  List<ModHumanV2> modHuman, required final  List<Object> modFirearms, required this.metadata, required final  List<Object> colorData, @JsonKey(name: 'ScriptsData') required final  List<Object> scriptsData}): _icon = icon,_parts = parts,_modHuman = modHuman,_modFirearms = modFirearms,_colorData = colorData,_scriptsData = scriptsData;
  factory _MelonV2.fromJson(Map<String, dynamic> json) => _$MelonV2FromJson(json);

@override final  int convertVersion;
@override final  int modType;
@override final  String uniqueId;
@override final  String type;
@override final  String category;
@override final  String customCategory;
@override final  bool isActivated;
 final  List<int> _icon;
@override List<int> get icon {
  if (_icon is EqualUnmodifiableListView) return _icon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_icon);
}

@override final  int iconWidth;
@override final  int iconHeight;
 final  List<PartV2> _parts;
@override List<PartV2> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

 final  List<ModHumanV2> _modHuman;
@override List<ModHumanV2> get modHuman {
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

@override final  MelonMetadataV2 metadata;
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


/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonV2CopyWith<_MelonV2> get copyWith => __$MelonV2CopyWithImpl<_MelonV2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonV2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonV2&&(identical(other.convertVersion, convertVersion) || other.convertVersion == convertVersion)&&(identical(other.modType, modType) || other.modType == modType)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.customCategory, customCategory) || other.customCategory == customCategory)&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&const DeepCollectionEquality().equals(other._icon, _icon)&&(identical(other.iconWidth, iconWidth) || other.iconWidth == iconWidth)&&(identical(other.iconHeight, iconHeight) || other.iconHeight == iconHeight)&&const DeepCollectionEquality().equals(other._parts, _parts)&&const DeepCollectionEquality().equals(other._modHuman, _modHuman)&&const DeepCollectionEquality().equals(other._modFirearms, _modFirearms)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._colorData, _colorData)&&const DeepCollectionEquality().equals(other._scriptsData, _scriptsData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,convertVersion,modType,uniqueId,type,category,customCategory,isActivated,const DeepCollectionEquality().hash(_icon),iconWidth,iconHeight,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_modHuman),const DeepCollectionEquality().hash(_modFirearms),metadata,const DeepCollectionEquality().hash(_colorData),const DeepCollectionEquality().hash(_scriptsData));

@override
String toString() {
  return 'MelonV2(convertVersion: $convertVersion, modType: $modType, uniqueId: $uniqueId, type: $type, category: $category, customCategory: $customCategory, isActivated: $isActivated, icon: $icon, iconWidth: $iconWidth, iconHeight: $iconHeight, parts: $parts, modHuman: $modHuman, modFirearms: $modFirearms, metadata: $metadata, colorData: $colorData, scriptsData: $scriptsData)';
}


}

/// @nodoc
abstract mixin class _$MelonV2CopyWith<$Res> implements $MelonV2CopyWith<$Res> {
  factory _$MelonV2CopyWith(_MelonV2 value, $Res Function(_MelonV2) _then) = __$MelonV2CopyWithImpl;
@override @useResult
$Res call({
 int convertVersion, int modType, String uniqueId, String type, String category, String customCategory, bool isActivated, List<int> icon, int iconWidth, int iconHeight, List<PartV2> parts, List<ModHumanV2> modHuman, List<Object> modFirearms, MelonMetadataV2 metadata, List<Object> colorData,@JsonKey(name: 'ScriptsData') List<Object> scriptsData
});


@override $MelonMetadataV2CopyWith<$Res> get metadata;

}
/// @nodoc
class __$MelonV2CopyWithImpl<$Res>
    implements _$MelonV2CopyWith<$Res> {
  __$MelonV2CopyWithImpl(this._self, this._then);

  final _MelonV2 _self;
  final $Res Function(_MelonV2) _then;

/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? convertVersion = null,Object? modType = null,Object? uniqueId = null,Object? type = null,Object? category = null,Object? customCategory = null,Object? isActivated = null,Object? icon = null,Object? iconWidth = null,Object? iconHeight = null,Object? parts = null,Object? modHuman = null,Object? modFirearms = null,Object? metadata = null,Object? colorData = null,Object? scriptsData = null,}) {
  return _then(_MelonV2(
convertVersion: null == convertVersion ? _self.convertVersion : convertVersion // ignore: cast_nullable_to_non_nullable
as int,modType: null == modType ? _self.modType : modType // ignore: cast_nullable_to_non_nullable
as int,uniqueId: null == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,customCategory: null == customCategory ? _self.customCategory : customCategory // ignore: cast_nullable_to_non_nullable
as String,isActivated: null == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool,icon: null == icon ? _self._icon : icon // ignore: cast_nullable_to_non_nullable
as List<int>,iconWidth: null == iconWidth ? _self.iconWidth : iconWidth // ignore: cast_nullable_to_non_nullable
as int,iconHeight: null == iconHeight ? _self.iconHeight : iconHeight // ignore: cast_nullable_to_non_nullable
as int,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartV2>,modHuman: null == modHuman ? _self._modHuman : modHuman // ignore: cast_nullable_to_non_nullable
as List<ModHumanV2>,modFirearms: null == modFirearms ? _self._modFirearms : modFirearms // ignore: cast_nullable_to_non_nullable
as List<Object>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonMetadataV2,colorData: null == colorData ? _self._colorData : colorData // ignore: cast_nullable_to_non_nullable
as List<Object>,scriptsData: null == scriptsData ? _self._scriptsData : scriptsData // ignore: cast_nullable_to_non_nullable
as List<Object>,
  ));
}

/// Create a copy of MelonV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonMetadataV2CopyWith<$Res> get metadata {
  
  return $MelonMetadataV2CopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
