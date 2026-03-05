// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_human_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModHumanV2 {

 bool get canBlink; MelonColor get eyeLid; MelonColor get bloodColor; List<MelonVector2> get eyePos; List<String> get secondTextures; List<String> get thirdTextures;
/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModHumanV2CopyWith<ModHumanV2> get copyWith => _$ModHumanV2CopyWithImpl<ModHumanV2>(this as ModHumanV2, _$identity);

  /// Serializes this ModHumanV2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModHumanV2&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&const DeepCollectionEquality().equals(other.eyePos, eyePos)&&const DeepCollectionEquality().equals(other.secondTextures, secondTextures)&&const DeepCollectionEquality().equals(other.thirdTextures, thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,const DeepCollectionEquality().hash(eyePos),const DeepCollectionEquality().hash(secondTextures),const DeepCollectionEquality().hash(thirdTextures));

@override
String toString() {
  return 'ModHumanV2(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class $ModHumanV2CopyWith<$Res>  {
  factory $ModHumanV2CopyWith(ModHumanV2 value, $Res Function(ModHumanV2) _then) = _$ModHumanV2CopyWithImpl;
@useResult
$Res call({
 bool canBlink, MelonColor eyeLid, MelonColor bloodColor, List<MelonVector2> eyePos, List<String> secondTextures, List<String> thirdTextures
});


$MelonColorCopyWith<$Res> get eyeLid;$MelonColorCopyWith<$Res> get bloodColor;

}
/// @nodoc
class _$ModHumanV2CopyWithImpl<$Res>
    implements $ModHumanV2CopyWith<$Res> {
  _$ModHumanV2CopyWithImpl(this._self, this._then);

  final ModHumanV2 _self;
  final $Res Function(ModHumanV2) _then;

/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canBlink = null,Object? eyeLid = null,Object? bloodColor = null,Object? eyePos = null,Object? secondTextures = null,Object? thirdTextures = null,}) {
  return _then(_self.copyWith(
canBlink: null == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool,eyeLid: null == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor,bloodColor: null == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor,eyePos: null == eyePos ? _self.eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as List<MelonVector2>,secondTextures: null == secondTextures ? _self.secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<String>,thirdTextures: null == thirdTextures ? _self.thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res> get eyeLid {
  
  return $MelonColorCopyWith<$Res>(_self.eyeLid, (value) {
    return _then(_self.copyWith(eyeLid: value));
  });
}/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res> get bloodColor {
  
  return $MelonColorCopyWith<$Res>(_self.bloodColor, (value) {
    return _then(_self.copyWith(bloodColor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModHumanV2].
extension ModHumanV2Patterns on ModHumanV2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModHumanV2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModHumanV2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModHumanV2 value)  $default,){
final _that = this;
switch (_that) {
case _ModHumanV2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModHumanV2 value)?  $default,){
final _that = this;
switch (_that) {
case _ModHumanV2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canBlink,  MelonColor eyeLid,  MelonColor bloodColor,  List<MelonVector2> eyePos,  List<String> secondTextures,  List<String> thirdTextures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModHumanV2() when $default != null:
return $default(_that.canBlink,_that.eyeLid,_that.bloodColor,_that.eyePos,_that.secondTextures,_that.thirdTextures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canBlink,  MelonColor eyeLid,  MelonColor bloodColor,  List<MelonVector2> eyePos,  List<String> secondTextures,  List<String> thirdTextures)  $default,) {final _that = this;
switch (_that) {
case _ModHumanV2():
return $default(_that.canBlink,_that.eyeLid,_that.bloodColor,_that.eyePos,_that.secondTextures,_that.thirdTextures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canBlink,  MelonColor eyeLid,  MelonColor bloodColor,  List<MelonVector2> eyePos,  List<String> secondTextures,  List<String> thirdTextures)?  $default,) {final _that = this;
switch (_that) {
case _ModHumanV2() when $default != null:
return $default(_that.canBlink,_that.eyeLid,_that.bloodColor,_that.eyePos,_that.secondTextures,_that.thirdTextures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModHumanV2 implements ModHumanV2 {
  const _ModHumanV2({required this.canBlink, required this.eyeLid, required this.bloodColor, required final  List<MelonVector2> eyePos, required final  List<String> secondTextures, required final  List<String> thirdTextures}): _eyePos = eyePos,_secondTextures = secondTextures,_thirdTextures = thirdTextures;
  factory _ModHumanV2.fromJson(Map<String, dynamic> json) => _$ModHumanV2FromJson(json);

@override final  bool canBlink;
@override final  MelonColor eyeLid;
@override final  MelonColor bloodColor;
 final  List<MelonVector2> _eyePos;
@override List<MelonVector2> get eyePos {
  if (_eyePos is EqualUnmodifiableListView) return _eyePos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eyePos);
}

 final  List<String> _secondTextures;
@override List<String> get secondTextures {
  if (_secondTextures is EqualUnmodifiableListView) return _secondTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondTextures);
}

 final  List<String> _thirdTextures;
@override List<String> get thirdTextures {
  if (_thirdTextures is EqualUnmodifiableListView) return _thirdTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_thirdTextures);
}


/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModHumanV2CopyWith<_ModHumanV2> get copyWith => __$ModHumanV2CopyWithImpl<_ModHumanV2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModHumanV2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModHumanV2&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&const DeepCollectionEquality().equals(other._eyePos, _eyePos)&&const DeepCollectionEquality().equals(other._secondTextures, _secondTextures)&&const DeepCollectionEquality().equals(other._thirdTextures, _thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,const DeepCollectionEquality().hash(_eyePos),const DeepCollectionEquality().hash(_secondTextures),const DeepCollectionEquality().hash(_thirdTextures));

@override
String toString() {
  return 'ModHumanV2(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class _$ModHumanV2CopyWith<$Res> implements $ModHumanV2CopyWith<$Res> {
  factory _$ModHumanV2CopyWith(_ModHumanV2 value, $Res Function(_ModHumanV2) _then) = __$ModHumanV2CopyWithImpl;
@override @useResult
$Res call({
 bool canBlink, MelonColor eyeLid, MelonColor bloodColor, List<MelonVector2> eyePos, List<String> secondTextures, List<String> thirdTextures
});


@override $MelonColorCopyWith<$Res> get eyeLid;@override $MelonColorCopyWith<$Res> get bloodColor;

}
/// @nodoc
class __$ModHumanV2CopyWithImpl<$Res>
    implements _$ModHumanV2CopyWith<$Res> {
  __$ModHumanV2CopyWithImpl(this._self, this._then);

  final _ModHumanV2 _self;
  final $Res Function(_ModHumanV2) _then;

/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canBlink = null,Object? eyeLid = null,Object? bloodColor = null,Object? eyePos = null,Object? secondTextures = null,Object? thirdTextures = null,}) {
  return _then(_ModHumanV2(
canBlink: null == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool,eyeLid: null == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor,bloodColor: null == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor,eyePos: null == eyePos ? _self._eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as List<MelonVector2>,secondTextures: null == secondTextures ? _self._secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<String>,thirdTextures: null == thirdTextures ? _self._thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res> get eyeLid {
  
  return $MelonColorCopyWith<$Res>(_self.eyeLid, (value) {
    return _then(_self.copyWith(eyeLid: value));
  });
}/// Create a copy of ModHumanV2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res> get bloodColor {
  
  return $MelonColorCopyWith<$Res>(_self.bloodColor, (value) {
    return _then(_self.copyWith(bloodColor: value));
  });
}
}

// dart format on
