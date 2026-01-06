// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_v4.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonV4 {

 MelonDataV4? get data; MelonV4? get metadata;
/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonV4CopyWith<MelonV4> get copyWith => _$MelonV4CopyWithImpl<MelonV4>(this as MelonV4, _$identity);

  /// Serializes this MelonV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonV4&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata);

@override
String toString() {
  return 'MelonV4(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $MelonV4CopyWith<$Res>  {
  factory $MelonV4CopyWith(MelonV4 value, $Res Function(MelonV4) _then) = _$MelonV4CopyWithImpl;
@useResult
$Res call({
 MelonDataV4? data, MelonV4? metadata
});


$MelonDataV4CopyWith<$Res>? get data;$MelonV4CopyWith<$Res>? get metadata;

}
/// @nodoc
class _$MelonV4CopyWithImpl<$Res>
    implements $MelonV4CopyWith<$Res> {
  _$MelonV4CopyWithImpl(this._self, this._then);

  final MelonV4 _self;
  final $Res Function(MelonV4) _then;

/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MelonDataV4?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonV4?,
  ));
}
/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonDataV4CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MelonDataV4CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonV4CopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MelonV4CopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [MelonV4].
extension MelonV4Patterns on MelonV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonV4 value)  $default,){
final _that = this;
switch (_that) {
case _MelonV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonV4 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonV4() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MelonDataV4? data,  MelonV4? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonV4() when $default != null:
return $default(_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MelonDataV4? data,  MelonV4? metadata)  $default,) {final _that = this;
switch (_that) {
case _MelonV4():
return $default(_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MelonDataV4? data,  MelonV4? metadata)?  $default,) {final _that = this;
switch (_that) {
case _MelonV4() when $default != null:
return $default(_that.data,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonV4 implements MelonV4 {
  const _MelonV4({required this.data, required this.metadata});
  factory _MelonV4.fromJson(Map<String, dynamic> json) => _$MelonV4FromJson(json);

@override final  MelonDataV4? data;
@override final  MelonV4? metadata;

/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonV4CopyWith<_MelonV4> get copyWith => __$MelonV4CopyWithImpl<_MelonV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonV4&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata);

@override
String toString() {
  return 'MelonV4(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MelonV4CopyWith<$Res> implements $MelonV4CopyWith<$Res> {
  factory _$MelonV4CopyWith(_MelonV4 value, $Res Function(_MelonV4) _then) = __$MelonV4CopyWithImpl;
@override @useResult
$Res call({
 MelonDataV4? data, MelonV4? metadata
});


@override $MelonDataV4CopyWith<$Res>? get data;@override $MelonV4CopyWith<$Res>? get metadata;

}
/// @nodoc
class __$MelonV4CopyWithImpl<$Res>
    implements _$MelonV4CopyWith<$Res> {
  __$MelonV4CopyWithImpl(this._self, this._then);

  final _MelonV4 _self;
  final $Res Function(_MelonV4) _then;

/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(_MelonV4(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MelonDataV4?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MelonV4?,
  ));
}

/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonDataV4CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MelonDataV4CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MelonV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonV4CopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $MelonV4CopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
