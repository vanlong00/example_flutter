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

 MelonV4 get item;
/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MelonBaseCopyWith<MelonBase> get copyWith => _$MelonBaseCopyWithImpl<MelonBase>(this as MelonBase, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MelonBase&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'MelonBase(item: $item)';
}


}

/// @nodoc
abstract mixin class $MelonBaseCopyWith<$Res>  {
  factory $MelonBaseCopyWith(MelonBase value, $Res Function(MelonBase) _then) = _$MelonBaseCopyWithImpl;
@useResult
$Res call({
 MelonV4 item
});


$MelonV4CopyWith<$Res> get item;

}
/// @nodoc
class _$MelonBaseCopyWithImpl<$Res>
    implements $MelonBaseCopyWith<$Res> {
  _$MelonBaseCopyWithImpl(this._self, this._then);

  final MelonBase _self;
  final $Res Function(MelonBase) _then;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MelonBaseV4 value)?  v4,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MelonBaseV4 value)  v4,}){
final _that = this;
switch (_that) {
case _MelonBaseV4():
return v4(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MelonBaseV4 value)?  v4,}){
final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MelonV4 item)?  v4,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MelonV4 item)  v4,}) {final _that = this;
switch (_that) {
case _MelonBaseV4():
return v4(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MelonV4 item)?  v4,}) {final _that = this;
switch (_that) {
case _MelonBaseV4() when v4 != null:
return v4(_that.item);case _:
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
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
$Res call({
 MelonV4 item
});


@override $MelonV4CopyWith<$Res> get item;

}
/// @nodoc
class __$MelonBaseV4CopyWithImpl<$Res>
    implements _$MelonBaseV4CopyWith<$Res> {
  __$MelonBaseV4CopyWithImpl(this._self, this._then);

  final _MelonBaseV4 _self;
  final $Res Function(_MelonBaseV4) _then;

/// Create a copy of MelonBase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
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

// dart format on
