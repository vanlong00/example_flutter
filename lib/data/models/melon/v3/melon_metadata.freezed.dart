// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonMetadata {

 bool? get isActivated; String? get uniqueId; int? get modType; dynamic get overrideId; dynamic get overrideFileId; String? get category; String? get customCategory; String? get type; int? get version; String? get appVersion;@JsonKey(name: 'ChangedTimestamp') int? get changedTimestamp;@JsonKey(name: 'Icon') AssetReference? get icon;@JsonKey(name: 'isCustomIcon') bool? get isCustomIcon;@JsonKey(name: 'templateId') dynamic get templateId;@JsonKey(name: 'WorkshopMetadata') dynamic get workshopMetadata;
/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonMetadataCopyWith<MelonMetadata> get copyWith => _$MelonMetadataCopyWithImpl<MelonMetadata>(this as MelonMetadata, _$identity);

  /// Serializes this MelonMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonMetadata&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.modType, modType) || other.modType == modType)&&const DeepCollectionEquality().equals(other.overrideId, overrideId)&&const DeepCollectionEquality().equals(other.overrideFileId, overrideFileId)&&(identical(other.category, category) || other.category == category)&&(identical(other.customCategory, customCategory) || other.customCategory == customCategory)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.changedTimestamp, changedTimestamp) || other.changedTimestamp == changedTimestamp)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isCustomIcon, isCustomIcon) || other.isCustomIcon == isCustomIcon)&&const DeepCollectionEquality().equals(other.templateId, templateId)&&const DeepCollectionEquality().equals(other.workshopMetadata, workshopMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActivated,uniqueId,modType,const DeepCollectionEquality().hash(overrideId),const DeepCollectionEquality().hash(overrideFileId),category,customCategory,type,version,appVersion,changedTimestamp,icon,isCustomIcon,const DeepCollectionEquality().hash(templateId),const DeepCollectionEquality().hash(workshopMetadata));

@override
String toString() {
  return 'MelonMetadata(isActivated: $isActivated, uniqueId: $uniqueId, modType: $modType, overrideId: $overrideId, overrideFileId: $overrideFileId, category: $category, customCategory: $customCategory, type: $type, version: $version, appVersion: $appVersion, changedTimestamp: $changedTimestamp, icon: $icon, isCustomIcon: $isCustomIcon, templateId: $templateId, workshopMetadata: $workshopMetadata)';
}


}

/// @nodoc
abstract mixin class $MelonMetadataCopyWith<$Res>  {
  factory $MelonMetadataCopyWith(MelonMetadata value, $Res Function(MelonMetadata) _then) = _$MelonMetadataCopyWithImpl;
@useResult
$Res call({
 bool? isActivated, String? uniqueId, int? modType, dynamic overrideId, dynamic overrideFileId, String? category, String? customCategory, String? type, int? version, String? appVersion,@JsonKey(name: 'ChangedTimestamp') int? changedTimestamp,@JsonKey(name: 'Icon') AssetReference? icon,@JsonKey(name: 'isCustomIcon') bool? isCustomIcon,@JsonKey(name: 'templateId') dynamic templateId,@JsonKey(name: 'WorkshopMetadata') dynamic workshopMetadata
});


$AssetReferenceCopyWith<$Res>? get icon;

}
/// @nodoc
class _$MelonMetadataCopyWithImpl<$Res>
    implements $MelonMetadataCopyWith<$Res> {
  _$MelonMetadataCopyWithImpl(this._self, this._then);

  final MelonMetadata _self;
  final $Res Function(MelonMetadata) _then;

/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActivated = freezed,Object? uniqueId = freezed,Object? modType = freezed,Object? overrideId = freezed,Object? overrideFileId = freezed,Object? category = freezed,Object? customCategory = freezed,Object? type = freezed,Object? version = freezed,Object? appVersion = freezed,Object? changedTimestamp = freezed,Object? icon = freezed,Object? isCustomIcon = freezed,Object? templateId = freezed,Object? workshopMetadata = freezed,}) {
  return _then(_self.copyWith(
isActivated: freezed == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,modType: freezed == modType ? _self.modType : modType // ignore: cast_nullable_to_non_nullable
as int?,overrideId: freezed == overrideId ? _self.overrideId : overrideId // ignore: cast_nullable_to_non_nullable
as dynamic,overrideFileId: freezed == overrideFileId ? _self.overrideFileId : overrideFileId // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,customCategory: freezed == customCategory ? _self.customCategory : customCategory // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,changedTimestamp: freezed == changedTimestamp ? _self.changedTimestamp : changedTimestamp // ignore: cast_nullable_to_non_nullable
as int?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as AssetReference?,isCustomIcon: freezed == isCustomIcon ? _self.isCustomIcon : isCustomIcon // ignore: cast_nullable_to_non_nullable
as bool?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as dynamic,workshopMetadata: freezed == workshopMetadata ? _self.workshopMetadata : workshopMetadata // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $AssetReferenceCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}


/// Adds pattern-matching-related methods to [MelonMetadata].
extension MelonMetadataPatterns on MelonMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonMetadata value)  $default,){
final _that = this;
switch (_that) {
case _MelonMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _MelonMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isActivated,  String? uniqueId,  int? modType,  dynamic overrideId,  dynamic overrideFileId,  String? category,  String? customCategory,  String? type,  int? version,  String? appVersion, @JsonKey(name: 'ChangedTimestamp')  int? changedTimestamp, @JsonKey(name: 'Icon')  AssetReference? icon, @JsonKey(name: 'isCustomIcon')  bool? isCustomIcon, @JsonKey(name: 'templateId')  dynamic templateId, @JsonKey(name: 'WorkshopMetadata')  dynamic workshopMetadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonMetadata() when $default != null:
return $default(_that.isActivated,_that.uniqueId,_that.modType,_that.overrideId,_that.overrideFileId,_that.category,_that.customCategory,_that.type,_that.version,_that.appVersion,_that.changedTimestamp,_that.icon,_that.isCustomIcon,_that.templateId,_that.workshopMetadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isActivated,  String? uniqueId,  int? modType,  dynamic overrideId,  dynamic overrideFileId,  String? category,  String? customCategory,  String? type,  int? version,  String? appVersion, @JsonKey(name: 'ChangedTimestamp')  int? changedTimestamp, @JsonKey(name: 'Icon')  AssetReference? icon, @JsonKey(name: 'isCustomIcon')  bool? isCustomIcon, @JsonKey(name: 'templateId')  dynamic templateId, @JsonKey(name: 'WorkshopMetadata')  dynamic workshopMetadata)  $default,) {final _that = this;
switch (_that) {
case _MelonMetadata():
return $default(_that.isActivated,_that.uniqueId,_that.modType,_that.overrideId,_that.overrideFileId,_that.category,_that.customCategory,_that.type,_that.version,_that.appVersion,_that.changedTimestamp,_that.icon,_that.isCustomIcon,_that.templateId,_that.workshopMetadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isActivated,  String? uniqueId,  int? modType,  dynamic overrideId,  dynamic overrideFileId,  String? category,  String? customCategory,  String? type,  int? version,  String? appVersion, @JsonKey(name: 'ChangedTimestamp')  int? changedTimestamp, @JsonKey(name: 'Icon')  AssetReference? icon, @JsonKey(name: 'isCustomIcon')  bool? isCustomIcon, @JsonKey(name: 'templateId')  dynamic templateId, @JsonKey(name: 'WorkshopMetadata')  dynamic workshopMetadata)?  $default,) {final _that = this;
switch (_that) {
case _MelonMetadata() when $default != null:
return $default(_that.isActivated,_that.uniqueId,_that.modType,_that.overrideId,_that.overrideFileId,_that.category,_that.customCategory,_that.type,_that.version,_that.appVersion,_that.changedTimestamp,_that.icon,_that.isCustomIcon,_that.templateId,_that.workshopMetadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonMetadata implements MelonMetadata {
  const _MelonMetadata({required this.isActivated, required this.uniqueId, required this.modType, required this.overrideId, required this.overrideFileId, required this.category, required this.customCategory, required this.type, required this.version, required this.appVersion, @JsonKey(name: 'ChangedTimestamp') required this.changedTimestamp, @JsonKey(name: 'Icon') required this.icon, @JsonKey(name: 'isCustomIcon') required this.isCustomIcon, @JsonKey(name: 'templateId') required this.templateId, @JsonKey(name: 'WorkshopMetadata') required this.workshopMetadata});
  factory _MelonMetadata.fromJson(Map<String, dynamic> json) => _$MelonMetadataFromJson(json);

@override final  bool? isActivated;
@override final  String? uniqueId;
@override final  int? modType;
@override final  dynamic overrideId;
@override final  dynamic overrideFileId;
@override final  String? category;
@override final  String? customCategory;
@override final  String? type;
@override final  int? version;
@override final  String? appVersion;
@override@JsonKey(name: 'ChangedTimestamp') final  int? changedTimestamp;
@override@JsonKey(name: 'Icon') final  AssetReference? icon;
@override@JsonKey(name: 'isCustomIcon') final  bool? isCustomIcon;
@override@JsonKey(name: 'templateId') final  dynamic templateId;
@override@JsonKey(name: 'WorkshopMetadata') final  dynamic workshopMetadata;

/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonMetadataCopyWith<_MelonMetadata> get copyWith => __$MelonMetadataCopyWithImpl<_MelonMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonMetadata&&(identical(other.isActivated, isActivated) || other.isActivated == isActivated)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.modType, modType) || other.modType == modType)&&const DeepCollectionEquality().equals(other.overrideId, overrideId)&&const DeepCollectionEquality().equals(other.overrideFileId, overrideFileId)&&(identical(other.category, category) || other.category == category)&&(identical(other.customCategory, customCategory) || other.customCategory == customCategory)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.changedTimestamp, changedTimestamp) || other.changedTimestamp == changedTimestamp)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isCustomIcon, isCustomIcon) || other.isCustomIcon == isCustomIcon)&&const DeepCollectionEquality().equals(other.templateId, templateId)&&const DeepCollectionEquality().equals(other.workshopMetadata, workshopMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActivated,uniqueId,modType,const DeepCollectionEquality().hash(overrideId),const DeepCollectionEquality().hash(overrideFileId),category,customCategory,type,version,appVersion,changedTimestamp,icon,isCustomIcon,const DeepCollectionEquality().hash(templateId),const DeepCollectionEquality().hash(workshopMetadata));

@override
String toString() {
  return 'MelonMetadata(isActivated: $isActivated, uniqueId: $uniqueId, modType: $modType, overrideId: $overrideId, overrideFileId: $overrideFileId, category: $category, customCategory: $customCategory, type: $type, version: $version, appVersion: $appVersion, changedTimestamp: $changedTimestamp, icon: $icon, isCustomIcon: $isCustomIcon, templateId: $templateId, workshopMetadata: $workshopMetadata)';
}


}

/// @nodoc
abstract mixin class _$MelonMetadataCopyWith<$Res> implements $MelonMetadataCopyWith<$Res> {
  factory _$MelonMetadataCopyWith(_MelonMetadata value, $Res Function(_MelonMetadata) _then) = __$MelonMetadataCopyWithImpl;
@override @useResult
$Res call({
 bool? isActivated, String? uniqueId, int? modType, dynamic overrideId, dynamic overrideFileId, String? category, String? customCategory, String? type, int? version, String? appVersion,@JsonKey(name: 'ChangedTimestamp') int? changedTimestamp,@JsonKey(name: 'Icon') AssetReference? icon,@JsonKey(name: 'isCustomIcon') bool? isCustomIcon,@JsonKey(name: 'templateId') dynamic templateId,@JsonKey(name: 'WorkshopMetadata') dynamic workshopMetadata
});


@override $AssetReferenceCopyWith<$Res>? get icon;

}
/// @nodoc
class __$MelonMetadataCopyWithImpl<$Res>
    implements _$MelonMetadataCopyWith<$Res> {
  __$MelonMetadataCopyWithImpl(this._self, this._then);

  final _MelonMetadata _self;
  final $Res Function(_MelonMetadata) _then;

/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActivated = freezed,Object? uniqueId = freezed,Object? modType = freezed,Object? overrideId = freezed,Object? overrideFileId = freezed,Object? category = freezed,Object? customCategory = freezed,Object? type = freezed,Object? version = freezed,Object? appVersion = freezed,Object? changedTimestamp = freezed,Object? icon = freezed,Object? isCustomIcon = freezed,Object? templateId = freezed,Object? workshopMetadata = freezed,}) {
  return _then(_MelonMetadata(
isActivated: freezed == isActivated ? _self.isActivated : isActivated // ignore: cast_nullable_to_non_nullable
as bool?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,modType: freezed == modType ? _self.modType : modType // ignore: cast_nullable_to_non_nullable
as int?,overrideId: freezed == overrideId ? _self.overrideId : overrideId // ignore: cast_nullable_to_non_nullable
as dynamic,overrideFileId: freezed == overrideFileId ? _self.overrideFileId : overrideFileId // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,customCategory: freezed == customCategory ? _self.customCategory : customCategory // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,changedTimestamp: freezed == changedTimestamp ? _self.changedTimestamp : changedTimestamp // ignore: cast_nullable_to_non_nullable
as int?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as AssetReference?,isCustomIcon: freezed == isCustomIcon ? _self.isCustomIcon : isCustomIcon // ignore: cast_nullable_to_non_nullable
as bool?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as dynamic,workshopMetadata: freezed == workshopMetadata ? _self.workshopMetadata : workshopMetadata // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of MelonMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetReferenceCopyWith<$Res>? get icon {
    if (_self.icon == null) {
    return null;
  }

  return $AssetReferenceCopyWith<$Res>(_self.icon!, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}

// dart format on
