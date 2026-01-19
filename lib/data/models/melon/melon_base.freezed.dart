// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'melon_base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MelonBase {

 Object get item;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonBase&&const DeepCollectionEquality().equals(other.item, item));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(item));

@override
String toString() {
  return 'MelonBase(item: $item)';
}


}

/// @nodoc
class $MelonBaseCopyWith<$Res>  {
$MelonBaseCopyWith(MelonBase _, $Res Function(MelonBase) __);
}


/// Adds pattern-matching-related methods to [MelonBase].
extension MelonBasePatterns on MelonBase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MelonBaseV4 value)?  v4,TResult Function( _MelonBaseV2 value)?  v2,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that);case _MelonBaseV2() when v2 != null:
return v2(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MelonBaseV4 value)  v4,required TResult Function( _MelonBaseV2 value)  v2,}){
final _that = this;
switch (_that) {
case _MelonBaseV4():
return v4(_that);case _MelonBaseV2():
return v2(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MelonBaseV4 value)?  v4,TResult? Function( _MelonBaseV2 value)?  v2,}){
final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that);case _MelonBaseV2() when v2 != null:
return v2(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MelonV4 item)?  v4,TResult Function( MelonV2 item)?  v2,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that.item);case _MelonBaseV2() when v2 != null:
return v2(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MelonV4 item)  v4,required TResult Function( MelonV2 item)  v2,}) {final _that = this;
switch (_that) {
case _MelonBaseV4():
return v4(_that.item);case _MelonBaseV2():
return v2(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MelonV4 item)?  v4,TResult? Function( MelonV2 item)?  v2,}) {final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that.item);case _MelonBaseV2() when v2 != null:
return v2(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _MelonBaseV4 extends MelonBase {
  const _MelonBaseV4(this.item): super._();
  

@override final  MelonV4 item;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonBaseV4CopyWith<_MelonBaseV4> get copyWith => __$MelonBaseV4CopyWithImpl<_MelonBaseV4>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonBaseV4&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'MelonBase.v4(item: $item)';
}


}

/// @nodoc
abstract mixin class _$MelonBaseV4CopyWith<$Res> implements $MelonBaseCopyWith<$Res> {
  factory _$MelonBaseV4CopyWith(_MelonBaseV4 value, $Res Function(_MelonBaseV4) _then) = __$MelonBaseV4CopyWithImpl;
@useResult
$Res call({
 MelonV4 item
});


$MelonV4CopyWith<$Res> get item;

}
/// @nodoc
class __$MelonBaseV4CopyWithImpl<$Res>
    implements _$MelonBaseV4CopyWith<$Res> {
  __$MelonBaseV4CopyWithImpl(this._self, this._then);

  final _MelonBaseV4 _self;
  final $Res Function(_MelonBaseV4) _then;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_MelonBaseV4(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MelonV4,
  ));
}

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonV4CopyWith<$Res> get item {
  
  return $MelonV4CopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _MelonBaseV2 extends MelonBase {
  const _MelonBaseV2(this.item): super._();
  

@override final  MelonV2 item;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MelonBaseV2CopyWith<_MelonBaseV2> get copyWith => __$MelonBaseV2CopyWithImpl<_MelonBaseV2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MelonBaseV2&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'MelonBase.v2(item: $item)';
}


}

/// @nodoc
abstract mixin class _$MelonBaseV2CopyWith<$Res> implements $MelonBaseCopyWith<$Res> {
  factory _$MelonBaseV2CopyWith(_MelonBaseV2 value, $Res Function(_MelonBaseV2) _then) = __$MelonBaseV2CopyWithImpl;
@useResult
$Res call({
 MelonV2 item
});


$MelonV2CopyWith<$Res> get item;

}
/// @nodoc
class __$MelonBaseV2CopyWithImpl<$Res>
    implements _$MelonBaseV2CopyWith<$Res> {
  __$MelonBaseV2CopyWithImpl(this._self, this._then);

  final _MelonBaseV2 _self;
  final $Res Function(_MelonBaseV2) _then;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_MelonBaseV2(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MelonV2,
  ));
}

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonV2CopyWith<$Res> get item {
  
  return $MelonV2CopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
