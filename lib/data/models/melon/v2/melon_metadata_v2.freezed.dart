// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_metadata_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonMetadataV2 {

@JsonKey(name: 'ManifestId') String get manifestId;@JsonKey(name: 'Name') String get name;
/// Create a copy of MelonMetadataV2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonMetadataV2CopyWith<MelonMetadataV2> get copyWith => _$MelonMetadataV2CopyWithImpl<MelonMetadataV2>(this as MelonMetadataV2, _$identity);

  /// Serializes this MelonMetadataV2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonMetadataV2&&(identical(other.manifestId, manifestId) || other.manifestId == manifestId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,manifestId,name);

@override
String toString() {
  return 'MelonMetadataV2(manifestId: $manifestId, name: $name)';
}


}

/// @nodoc
abstract mixin class $MelonMetadataV2CopyWith<$Res>  {
  factory $MelonMetadataV2CopyWith(MelonMetadataV2 value, $Res Function(MelonMetadataV2) _then) = _$MelonMetadataV2CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ManifestId') String manifestId,@JsonKey(name: 'Name') String name
});




}
/// @nodoc
class _$MelonMetadataV2CopyWithImpl<$Res>
    implements $MelonMetadataV2CopyWith<$Res> {
  _$MelonMetadataV2CopyWithImpl(this._self, this._then);

  final MelonMetadataV2 _self;
  final $Res Function(MelonMetadataV2) _then;

/// Create a copy of MelonMetadataV2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? manifestId = null,Object? name = null,}) {
  return _then(_self.copyWith(
manifestId: null == manifestId ? _self.manifestId : manifestId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonMetadataV2].
extension MelonMetadataV2Patterns on MelonMetadataV2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonMetadataV2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonMetadataV2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonMetadataV2 value)  $default,){
final _that = this;
switch (_that) {
case _MelonMetadataV2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonMetadataV2 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonMetadataV2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ManifestId')  String manifestId, @JsonKey(name: 'Name')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonMetadataV2() when $default != null:
return $default(_that.manifestId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ManifestId')  String manifestId, @JsonKey(name: 'Name')  String name)  $default,) {final _that = this;
switch (_that) {
case _MelonMetadataV2():
return $default(_that.manifestId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ManifestId')  String manifestId, @JsonKey(name: 'Name')  String name)?  $default,) {final _that = this;
switch (_that) {
case _MelonMetadataV2() when $default != null:
return $default(_that.manifestId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonMetadataV2 implements MelonMetadataV2 {
  const _MelonMetadataV2({@JsonKey(name: 'ManifestId') required this.manifestId, @JsonKey(name: 'Name') required this.name});
  factory _MelonMetadataV2.fromJson(Map<String, dynamic> json) => _$MelonMetadataV2FromJson(json);

@override@JsonKey(name: 'ManifestId') final  String manifestId;
@override@JsonKey(name: 'Name') final  String name;

/// Create a copy of MelonMetadataV2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonMetadataV2CopyWith<_MelonMetadataV2> get copyWith => __$MelonMetadataV2CopyWithImpl<_MelonMetadataV2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonMetadataV2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonMetadataV2&&(identical(other.manifestId, manifestId) || other.manifestId == manifestId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,manifestId,name);

@override
String toString() {
  return 'MelonMetadataV2(manifestId: $manifestId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MelonMetadataV2CopyWith<$Res> implements $MelonMetadataV2CopyWith<$Res> {
  factory _$MelonMetadataV2CopyWith(_MelonMetadataV2 value, $Res Function(_MelonMetadataV2) _then) = __$MelonMetadataV2CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ManifestId') String manifestId,@JsonKey(name: 'Name') String name
});




}
/// @nodoc
class __$MelonMetadataV2CopyWithImpl<$Res>
    implements _$MelonMetadataV2CopyWith<$Res> {
  __$MelonMetadataV2CopyWithImpl(this._self, this._then);

  final _MelonMetadataV2 _self;
  final $Res Function(_MelonMetadataV2) _then;

/// Create a copy of MelonMetadataV2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? manifestId = null,Object? name = null,}) {
  return _then(_MelonMetadataV2(
manifestId: null == manifestId ? _self.manifestId : manifestId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
