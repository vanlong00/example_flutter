// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_v3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonV3 {

 MelonDataV3? get data; MelonMetadataV3? get metadata;/// Map of AssetId -> binary data for asset files
 Map<String, List<int>>? get assets;
/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonV3CopyWith<MelonV3> get copyWith => _$MelonV3CopyWithImpl<MelonV3>(this as MelonV3, _$identity);

  /// Serializes this MelonV3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonV3&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.assets, assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata,const DeepCollectionEquality().hash(assets));

@override
String toString() {
  return 'MelonV3(data: $data, metadata: $metadata, assets: $assets)';
}


}

/// @nodoc
abstract mixin class $MelonV3CopyWith<$Res>  {
  factory $MelonV3CopyWith(MelonV3 value, $Res Function(MelonV3) _then) = _$MelonV3CopyWithImpl;
@useResult
$Res call({
 MelonDataV3? data, MelonMetadataV3? metadata, Map<String, List<int>>? assets
});


$MelonDataV3CopyWith<$Res>? get data;$MelonMetadataV3CopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MelonV3CopyWithImpl<$Res>
    implements $MelonV3CopyWith<$Res> {
  _$MelonV3CopyWithImpl(this._self, this._then);

  final MelonV3 _self;
  final $Res Function(MelonV3) _then;

/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? metadata = freezed,Object? assets = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MelonDataV3?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonMetadataV3?,assets: freezed == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, List<int>>?,
  ));
}
/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonDataV3CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MelonDataV3CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonMetadataV3CopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MelonMetadataV3CopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [MelonV3].
extension MelonV3Patterns on MelonV3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonV3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonV3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonV3 value)  $default,){
final _that = this;
switch (_that) {
case _MelonV3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonV3 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonV3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MelonDataV3? data,  MelonMetadataV3? metadata,  Map<String, List<int>>? assets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonV3() when $default != null:
return $default(_that.data,_that.metadata,_that.assets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MelonDataV3? data,  MelonMetadataV3? metadata,  Map<String, List<int>>? assets)  $default,) {final _that = this;
switch (_that) {
case _MelonV3():
return $default(_that.data,_that.metadata,_that.assets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MelonDataV3? data,  MelonMetadataV3? metadata,  Map<String, List<int>>? assets)?  $default,) {final _that = this;
switch (_that) {
case _MelonV3() when $default != null:
return $default(_that.data,_that.metadata,_that.assets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonV3 implements MelonV3 {
  const _MelonV3({required this.data, required this.metadata, final  Map<String, List<int>>? assets}): _assets = assets;
  factory _MelonV3.fromJson(Map<String, dynamic> json) => _$MelonV3FromJson(json);

@override final  MelonDataV3? data;
@override final  MelonMetadataV3? metadata;
/// Map of AssetId -> binary data for asset files
 final  Map<String, List<int>>? _assets;
/// Map of AssetId -> binary data for asset files
@override Map<String, List<int>>? get assets {
  final value = _assets;
  if (value == null) return null;
  if (_assets is EqualUnmodifiableMapView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonV3CopyWith<_MelonV3> get copyWith => __$MelonV3CopyWithImpl<_MelonV3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonV3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonV3&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._assets, _assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata,const DeepCollectionEquality().hash(_assets));

@override
String toString() {
  return 'MelonV3(data: $data, metadata: $metadata, assets: $assets)';
}


}

/// @nodoc
abstract mixin class _$MelonV3CopyWith<$Res> implements $MelonV3CopyWith<$Res> {
  factory _$MelonV3CopyWith(_MelonV3 value, $Res Function(_MelonV3) _then) = __$MelonV3CopyWithImpl;
@override @useResult
$Res call({
 MelonDataV3? data, MelonMetadataV3? metadata, Map<String, List<int>>? assets
});


@override $MelonDataV3CopyWith<$Res>? get data;@override $MelonMetadataV3CopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MelonV3CopyWithImpl<$Res>
    implements _$MelonV3CopyWith<$Res> {
  __$MelonV3CopyWithImpl(this._self, this._then);

  final _MelonV3 _self;
  final $Res Function(_MelonV3) _then;

/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? metadata = freezed,Object? assets = freezed,}) {
  return _then(_MelonV3(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MelonDataV3?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonMetadataV3?,assets: freezed == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, List<int>>?,
  ));
}

/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonDataV3CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MelonDataV3CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MelonV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonMetadataV3CopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MelonMetadataV3CopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
