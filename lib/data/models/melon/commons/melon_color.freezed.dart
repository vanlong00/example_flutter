// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MelonColor {

 int get r; int get g; int get b; int get a;
/// Create a copy of MelonColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonColorCopyWith<MelonColor> get copyWith => _$MelonColorCopyWithImpl<MelonColor>(this as MelonColor, _$identity);

  /// Serializes this MelonColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonColor&&(identical(other.r, r) || other.r == r)&&(identical(other.g, g) || other.g == g)&&(identical(other.b, b) || other.b == b)&&(identical(other.a, a) || other.a == a));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,r,g,b,a);

@override
String toString() {
  return 'MelonColor(r: $r, g: $g, b: $b, a: $a)';
}


}

/// @nodoc
abstract mixin class $MelonColorCopyWith<$Res>  {
  factory $MelonColorCopyWith(MelonColor value, $Res Function(MelonColor) _then) = _$MelonColorCopyWithImpl;
@useResult
$Res call({
 int r, int g, int b, int a
});




}
/// @nodoc
class _$MelonColorCopyWithImpl<$Res>
    implements $MelonColorCopyWith<$Res> {
  _$MelonColorCopyWithImpl(this._self, this._then);

  final MelonColor _self;
  final $Res Function(MelonColor) _then;

/// Create a copy of MelonColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? r = null,Object? g = null,Object? b = null,Object? a = null,}) {
  return _then(_self.copyWith(
r: null == r ? _self.r : r // ignore: cast_nullable_to_non_nullable
as int,g: null == g ? _self.g : g // ignore: cast_nullable_to_non_nullable
as int,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int,a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MelonColor].
extension MelonColorPatterns on MelonColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MelonColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MelonColor value)  $default,){
final _that = this;
switch (_that) {
case _MelonColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MelonColor value)?  $default,){
final _that = this;
switch (_that) {
case _MelonColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int r,  int g,  int b,  int a)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonColor() when $default != null:
return $default(_that.r,_that.g,_that.b,_that.a);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int r,  int g,  int b,  int a)  $default,) {final _that = this;
switch (_that) {
case _MelonColor():
return $default(_that.r,_that.g,_that.b,_that.a);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int r,  int g,  int b,  int a)?  $default,) {final _that = this;
switch (_that) {
case _MelonColor() when $default != null:
return $default(_that.r,_that.g,_that.b,_that.a);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MelonColor implements MelonColor {
  const _MelonColor({required this.r, required this.g, required this.b, required this.a});
  factory _MelonColor.fromJson(Map<String, dynamic> json) => _$MelonColorFromJson(json);

@override final  int r;
@override final  int g;
@override final  int b;
@override final  int a;

/// Create a copy of MelonColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonColorCopyWith<_MelonColor> get copyWith => __$MelonColorCopyWithImpl<_MelonColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MelonColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonColor&&(identical(other.r, r) || other.r == r)&&(identical(other.g, g) || other.g == g)&&(identical(other.b, b) || other.b == b)&&(identical(other.a, a) || other.a == a));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,r,g,b,a);

@override
String toString() {
  return 'MelonColor(r: $r, g: $g, b: $b, a: $a)';
}


}

/// @nodoc
abstract mixin class _$MelonColorCopyWith<$Res> implements $MelonColorCopyWith<$Res> {
  factory _$MelonColorCopyWith(_MelonColor value, $Res Function(_MelonColor) _then) = __$MelonColorCopyWithImpl;
@override @useResult
$Res call({
 int r, int g, int b, int a
});




}
/// @nodoc
class __$MelonColorCopyWithImpl<$Res>
    implements _$MelonColorCopyWith<$Res> {
  __$MelonColorCopyWithImpl(this._self, this._then);

  final _MelonColor _self;
  final $Res Function(_MelonColor) _then;

/// Create a copy of MelonColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? r = null,Object? g = null,Object? b = null,Object? a = null,}) {
  return _then(_MelonColor(
r: null == r ? _self.r : r // ignore: cast_nullable_to_non_nullable
as int,g: null == g ? _self.g : g // ignore: cast_nullable_to_non_nullable
as int,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as int,a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
