// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_human_v3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModHumanV3 {

 bool? get canBlink; MelonColor? get eyeLid; MelonColor? get bloodColor; List<MelonVector2>? get eyePos; List<AssetReferenceV3>? get secondTextures; List<AssetReferenceV3>? get thirdTextures;
/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModHumanV3CopyWith<ModHumanV3> get copyWith => _$ModHumanV3CopyWithImpl<ModHumanV3>(this as ModHumanV3, _$identity);

  /// Serializes this ModHumanV3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModHumanV3&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&const DeepCollectionEquality().equals(other.eyePos, eyePos)&&const DeepCollectionEquality().equals(other.secondTextures, secondTextures)&&const DeepCollectionEquality().equals(other.thirdTextures, thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,const DeepCollectionEquality().hash(eyePos),const DeepCollectionEquality().hash(secondTextures),const DeepCollectionEquality().hash(thirdTextures));

@override
String toString() {
  return 'ModHumanV3(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class $ModHumanV3CopyWith<$Res>  {
  factory $ModHumanV3CopyWith(ModHumanV3 value, $Res Function(ModHumanV3) _then) = _$ModHumanV3CopyWithImpl;
@useResult
$Res call({
 bool? canBlink, MelonColor? eyeLid, MelonColor? bloodColor, List<MelonVector2>? eyePos, List<AssetReferenceV3>? secondTextures, List<AssetReferenceV3>? thirdTextures
});


$MelonColorCopyWith<$Res>? get eyeLid;$MelonColorCopyWith<$Res>? get bloodColor;

}
/// @nodoc
class _$ModHumanV3CopyWithImpl<$Res>
    implements $ModHumanV3CopyWith<$Res> {
  _$ModHumanV3CopyWithImpl(this._self, this._then);

  final ModHumanV3 _self;
  final $Res Function(ModHumanV3) _then;

/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canBlink = freezed,Object? eyeLid = freezed,Object? bloodColor = freezed,Object? eyePos = freezed,Object? secondTextures = freezed,Object? thirdTextures = freezed,}) {
  return _then(_self.copyWith(
canBlink: freezed == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool?,eyeLid: freezed == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor?,bloodColor: freezed == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor?,eyePos: freezed == eyePos ? _self.eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as List<MelonVector2>?,secondTextures: freezed == secondTextures ? _self.secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReferenceV3>?,thirdTextures: freezed == thirdTextures ? _self.thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReferenceV3>?,
  ));
}
/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res>? get eyeLid {
    if (_self.eyeLid == null) {
    return null;
  }

  return $MelonColorCopyWith<$Res>(_self.eyeLid!, (value) {
    return _then(_self.copyWith(eyeLid: value));
  });
}/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res>? get bloodColor {
    if (_self.bloodColor == null) {
    return null;
  }

  return $MelonColorCopyWith<$Res>(_self.bloodColor!, (value) {
    return _then(_self.copyWith(bloodColor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModHumanV3].
extension ModHumanV3Patterns on ModHumanV3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModHumanV3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModHumanV3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModHumanV3 value)  $default,){
final _that = this;
switch (_that) {
case _ModHumanV3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModHumanV3 value)?  $default,){
final _that = this;
switch (_that) {
case _ModHumanV3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  List<MelonVector2>? eyePos,  List<AssetReferenceV3>? secondTextures,  List<AssetReferenceV3>? thirdTextures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModHumanV3() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  List<MelonVector2>? eyePos,  List<AssetReferenceV3>? secondTextures,  List<AssetReferenceV3>? thirdTextures)  $default,) {final _that = this;
switch (_that) {
case _ModHumanV3():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  List<MelonVector2>? eyePos,  List<AssetReferenceV3>? secondTextures,  List<AssetReferenceV3>? thirdTextures)?  $default,) {final _that = this;
switch (_that) {
case _ModHumanV3() when $default != null:
return $default(_that.canBlink,_that.eyeLid,_that.bloodColor,_that.eyePos,_that.secondTextures,_that.thirdTextures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModHumanV3 implements ModHumanV3 {
  const _ModHumanV3({this.canBlink, this.eyeLid, this.bloodColor, final  List<MelonVector2>? eyePos, final  List<AssetReferenceV3>? secondTextures, final  List<AssetReferenceV3>? thirdTextures}): _eyePos = eyePos,_secondTextures = secondTextures,_thirdTextures = thirdTextures;
  factory _ModHumanV3.fromJson(Map<String, dynamic> json) => _$ModHumanV3FromJson(json);

@override final  bool? canBlink;
@override final  MelonColor? eyeLid;
@override final  MelonColor? bloodColor;
 final  List<MelonVector2>? _eyePos;
@override List<MelonVector2>? get eyePos {
  final value = _eyePos;
  if (value == null) return null;
  if (_eyePos is EqualUnmodifiableListView) return _eyePos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AssetReferenceV3>? _secondTextures;
@override List<AssetReferenceV3>? get secondTextures {
  final value = _secondTextures;
  if (value == null) return null;
  if (_secondTextures is EqualUnmodifiableListView) return _secondTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AssetReferenceV3>? _thirdTextures;
@override List<AssetReferenceV3>? get thirdTextures {
  final value = _thirdTextures;
  if (value == null) return null;
  if (_thirdTextures is EqualUnmodifiableListView) return _thirdTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModHumanV3CopyWith<_ModHumanV3> get copyWith => __$ModHumanV3CopyWithImpl<_ModHumanV3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModHumanV3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModHumanV3&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&const DeepCollectionEquality().equals(other._eyePos, _eyePos)&&const DeepCollectionEquality().equals(other._secondTextures, _secondTextures)&&const DeepCollectionEquality().equals(other._thirdTextures, _thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,const DeepCollectionEquality().hash(_eyePos),const DeepCollectionEquality().hash(_secondTextures),const DeepCollectionEquality().hash(_thirdTextures));

@override
String toString() {
  return 'ModHumanV3(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class _$ModHumanV3CopyWith<$Res> implements $ModHumanV3CopyWith<$Res> {
  factory _$ModHumanV3CopyWith(_ModHumanV3 value, $Res Function(_ModHumanV3) _then) = __$ModHumanV3CopyWithImpl;
@override @useResult
$Res call({
 bool? canBlink, MelonColor? eyeLid, MelonColor? bloodColor, List<MelonVector2>? eyePos, List<AssetReferenceV3>? secondTextures, List<AssetReferenceV3>? thirdTextures
});


@override $MelonColorCopyWith<$Res>? get eyeLid;@override $MelonColorCopyWith<$Res>? get bloodColor;

}
/// @nodoc
class __$ModHumanV3CopyWithImpl<$Res>
    implements _$ModHumanV3CopyWith<$Res> {
  __$ModHumanV3CopyWithImpl(this._self, this._then);

  final _ModHumanV3 _self;
  final $Res Function(_ModHumanV3) _then;

/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canBlink = freezed,Object? eyeLid = freezed,Object? bloodColor = freezed,Object? eyePos = freezed,Object? secondTextures = freezed,Object? thirdTextures = freezed,}) {
  return _then(_ModHumanV3(
canBlink: freezed == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool?,eyeLid: freezed == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor?,bloodColor: freezed == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor?,eyePos: freezed == eyePos ? _self._eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as List<MelonVector2>?,secondTextures: freezed == secondTextures ? _self._secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReferenceV3>?,thirdTextures: freezed == thirdTextures ? _self._thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReferenceV3>?,
  ));
}

/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res>? get eyeLid {
    if (_self.eyeLid == null) {
    return null;
  }

  return $MelonColorCopyWith<$Res>(_self.eyeLid!, (value) {
    return _then(_self.copyWith(eyeLid: value));
  });
}/// Create a copy of ModHumanV3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonColorCopyWith<$Res>? get bloodColor {
    if (_self.bloodColor == null) {
    return null;
  }

  return $MelonColorCopyWith<$Res>(_self.bloodColor!, (value) {
    return _then(_self.copyWith(bloodColor: value));
  });
}
}

// dart format on
