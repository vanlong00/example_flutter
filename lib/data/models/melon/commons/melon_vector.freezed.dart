// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_vector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonVector2 {

 double get x; double get y;
/// Create a copy of MelonVector2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonVector2CopyWith<MelonVector2> get copyWith => _$MelonVector2CopyWithImpl<MelonVector2>(this as MelonVector2, _$identity);

  /// Serializes this MelonVector2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonVector2&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'MelonVector2(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $MelonVector2CopyWith<$Res>  {
  factory $MelonVector2CopyWith(MelonVector2 value, $Res Function(MelonVector2) _then) = _$MelonVector2CopyWithImpl;
@useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class _$MelonVector2CopyWithImpl<$Res>
    implements $MelonVector2CopyWith<$Res> {
  _$MelonVector2CopyWithImpl(this._self, this._then);

  final MelonVector2 _self;
  final $Res Function(MelonVector2) _then;

/// Create a copy of MelonVector2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonVector2].
extension MelonVector2Patterns on MelonVector2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonVector2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonVector2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonVector2 value)  $default,){
final _that = this;
switch (_that) {
case _MelonVector2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonVector2 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonVector2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonVector2() when $default != null:
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y)  $default,) {final _that = this;
switch (_that) {
case _MelonVector2():
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y)?  $default,) {final _that = this;
switch (_that) {
case _MelonVector2() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonVector2 implements MelonVector2 {
  const _MelonVector2({required this.x, required this.y});
  factory _MelonVector2.fromJson(Map<String, dynamic> json) => _$MelonVector2FromJson(json);

@override final  double x;
@override final  double y;

/// Create a copy of MelonVector2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonVector2CopyWith<_MelonVector2> get copyWith => __$MelonVector2CopyWithImpl<_MelonVector2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonVector2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonVector2&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'MelonVector2(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$MelonVector2CopyWith<$Res> implements $MelonVector2CopyWith<$Res> {
  factory _$MelonVector2CopyWith(_MelonVector2 value, $Res Function(_MelonVector2) _then) = __$MelonVector2CopyWithImpl;
@override @useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class __$MelonVector2CopyWithImpl<$Res>
    implements _$MelonVector2CopyWith<$Res> {
  __$MelonVector2CopyWithImpl(this._self, this._then);

  final _MelonVector2 _self;
  final $Res Function(_MelonVector2) _then;

/// Create a copy of MelonVector2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_MelonVector2(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$MelonVector3 {

 double get x; double get y; double get z;
/// Create a copy of MelonVector3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonVector3CopyWith<MelonVector3> get copyWith => _$MelonVector3CopyWithImpl<MelonVector3>(this as MelonVector3, _$identity);

  /// Serializes this MelonVector3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonVector3&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z);

@override
String toString() {
  return 'MelonVector3(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class $MelonVector3CopyWith<$Res>  {
  factory $MelonVector3CopyWith(MelonVector3 value, $Res Function(MelonVector3) _then) = _$MelonVector3CopyWithImpl;
@useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class _$MelonVector3CopyWithImpl<$Res>
    implements $MelonVector3CopyWith<$Res> {
  _$MelonVector3CopyWithImpl(this._self, this._then);

  final MelonVector3 _self;
  final $Res Function(MelonVector3) _then;

/// Create a copy of MelonVector3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonVector3].
extension MelonVector3Patterns on MelonVector3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonVector3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonVector3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonVector3 value)  $default,){
final _that = this;
switch (_that) {
case _MelonVector3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonVector3 value)?  $default,){
final _that = this;
switch (_that) {
case _MelonVector3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double z)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonVector3() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double z)  $default,) {final _that = this;
switch (_that) {
case _MelonVector3():
return $default(_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double z)?  $default,) {final _that = this;
switch (_that) {
case _MelonVector3() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonVector3 implements MelonVector3 {
  const _MelonVector3({required this.x, required this.y, required this.z});
  factory _MelonVector3.fromJson(Map<String, dynamic> json) => _$MelonVector3FromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;

/// Create a copy of MelonVector3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonVector3CopyWith<_MelonVector3> get copyWith => __$MelonVector3CopyWithImpl<_MelonVector3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonVector3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonVector3&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z);

@override
String toString() {
  return 'MelonVector3(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class _$MelonVector3CopyWith<$Res> implements $MelonVector3CopyWith<$Res> {
  factory _$MelonVector3CopyWith(_MelonVector3 value, $Res Function(_MelonVector3) _then) = __$MelonVector3CopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class __$MelonVector3CopyWithImpl<$Res>
    implements _$MelonVector3CopyWith<$Res> {
  __$MelonVector3CopyWithImpl(this._self, this._then);

  final _MelonVector3 _self;
  final $Res Function(_MelonVector3) _then;

/// Create a copy of MelonVector3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_MelonVector3(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
