// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_human_v4.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModHumanV4 {

 bool? get canBlink; MelonColor? get eyeLid; MelonColor? get bloodColor; MelonVector2? get eyePos; List<AssetReference>? get secondTextures; List<AssetReference>? get thirdTextures;
/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModHumanV4CopyWith<ModHumanV4> get copyWith => _$ModHumanV4CopyWithImpl<ModHumanV4>(this as ModHumanV4, _$identity);

  /// Serializes this ModHumanV4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModHumanV4&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&(identical(other.eyePos, eyePos) || other.eyePos == eyePos)&&const DeepCollectionEquality().equals(other.secondTextures, secondTextures)&&const DeepCollectionEquality().equals(other.thirdTextures, thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,eyePos,const DeepCollectionEquality().hash(secondTextures),const DeepCollectionEquality().hash(thirdTextures));

@override
String toString() {
  return 'ModHumanV4(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class $ModHumanV4CopyWith<$Res>  {
  factory $ModHumanV4CopyWith(ModHumanV4 value, $Res Function(ModHumanV4) _then) = _$ModHumanV4CopyWithImpl;
@useResult
$Res call({
 bool? canBlink, MelonColor? eyeLid, MelonColor? bloodColor, MelonVector2? eyePos, List<AssetReference>? secondTextures, List<AssetReference>? thirdTextures
});


$MelonColorCopyWith<$Res>? get eyeLid;$MelonColorCopyWith<$Res>? get bloodColor;$MelonVector2CopyWith<$Res>? get eyePos;

}
/// @nodoc
class _$ModHumanV4CopyWithImpl<$Res>
    implements $ModHumanV4CopyWith<$Res> {
  _$ModHumanV4CopyWithImpl(this._self, this._then);

  final ModHumanV4 _self;
  final $Res Function(ModHumanV4) _then;

/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canBlink = freezed,Object? eyeLid = freezed,Object? bloodColor = freezed,Object? eyePos = freezed,Object? secondTextures = freezed,Object? thirdTextures = freezed,}) {
  return _then(_self.copyWith(
canBlink: freezed == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool?,eyeLid: freezed == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor?,bloodColor: freezed == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor?,eyePos: freezed == eyePos ? _self.eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as MelonVector2?,secondTextures: freezed == secondTextures ? _self.secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReference>?,thirdTextures: freezed == thirdTextures ? _self.thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReference>?,
  ));
}
/// Create a copy of ModHumanV4
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
}/// Create a copy of ModHumanV4
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
}/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector2CopyWith<$Res>? get eyePos {
    if (_self.eyePos == null) {
    return null;
  }

  return $MelonVector2CopyWith<$Res>(_self.eyePos!, (value) {
    return _then(_self.copyWith(eyePos: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModHumanV4].
extension ModHumanV4Patterns on ModHumanV4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModHumanV4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModHumanV4() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModHumanV4 value)  $default,){
final _that = this;
switch (_that) {
case _ModHumanV4():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModHumanV4 value)?  $default,){
final _that = this;
switch (_that) {
case _ModHumanV4() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  MelonVector2? eyePos,  List<AssetReference>? secondTextures,  List<AssetReference>? thirdTextures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModHumanV4() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  MelonVector2? eyePos,  List<AssetReference>? secondTextures,  List<AssetReference>? thirdTextures)  $default,) {final _that = this;
switch (_that) {
case _ModHumanV4():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? canBlink,  MelonColor? eyeLid,  MelonColor? bloodColor,  MelonVector2? eyePos,  List<AssetReference>? secondTextures,  List<AssetReference>? thirdTextures)?  $default,) {final _that = this;
switch (_that) {
case _ModHumanV4() when $default != null:
return $default(_that.canBlink,_that.eyeLid,_that.bloodColor,_that.eyePos,_that.secondTextures,_that.thirdTextures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModHumanV4 implements ModHumanV4 {
  const _ModHumanV4({this.canBlink, this.eyeLid, this.bloodColor, this.eyePos, final  List<AssetReference>? secondTextures, final  List<AssetReference>? thirdTextures}): _secondTextures = secondTextures,_thirdTextures = thirdTextures;
  factory _ModHumanV4.fromJson(Map<String, dynamic> json) => _$ModHumanV4FromJson(json);

@override final  bool? canBlink;
@override final  MelonColor? eyeLid;
@override final  MelonColor? bloodColor;
@override final  MelonVector2? eyePos;
 final  List<AssetReference>? _secondTextures;
@override List<AssetReference>? get secondTextures {
  final value = _secondTextures;
  if (value == null) return null;
  if (_secondTextures is EqualUnmodifiableListView) return _secondTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AssetReference>? _thirdTextures;
@override List<AssetReference>? get thirdTextures {
  final value = _thirdTextures;
  if (value == null) return null;
  if (_thirdTextures is EqualUnmodifiableListView) return _thirdTextures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModHumanV4CopyWith<_ModHumanV4> get copyWith => __$ModHumanV4CopyWithImpl<_ModHumanV4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModHumanV4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModHumanV4&&(identical(other.canBlink, canBlink) || other.canBlink == canBlink)&&(identical(other.eyeLid, eyeLid) || other.eyeLid == eyeLid)&&(identical(other.bloodColor, bloodColor) || other.bloodColor == bloodColor)&&(identical(other.eyePos, eyePos) || other.eyePos == eyePos)&&const DeepCollectionEquality().equals(other._secondTextures, _secondTextures)&&const DeepCollectionEquality().equals(other._thirdTextures, _thirdTextures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canBlink,eyeLid,bloodColor,eyePos,const DeepCollectionEquality().hash(_secondTextures),const DeepCollectionEquality().hash(_thirdTextures));

@override
String toString() {
  return 'ModHumanV4(canBlink: $canBlink, eyeLid: $eyeLid, bloodColor: $bloodColor, eyePos: $eyePos, secondTextures: $secondTextures, thirdTextures: $thirdTextures)';
}


}

/// @nodoc
abstract mixin class _$ModHumanV4CopyWith<$Res> implements $ModHumanV4CopyWith<$Res> {
  factory _$ModHumanV4CopyWith(_ModHumanV4 value, $Res Function(_ModHumanV4) _then) = __$ModHumanV4CopyWithImpl;
@override @useResult
$Res call({
 bool? canBlink, MelonColor? eyeLid, MelonColor? bloodColor, MelonVector2? eyePos, List<AssetReference>? secondTextures, List<AssetReference>? thirdTextures
});


@override $MelonColorCopyWith<$Res>? get eyeLid;@override $MelonColorCopyWith<$Res>? get bloodColor;@override $MelonVector2CopyWith<$Res>? get eyePos;

}
/// @nodoc
class __$ModHumanV4CopyWithImpl<$Res>
    implements _$ModHumanV4CopyWith<$Res> {
  __$ModHumanV4CopyWithImpl(this._self, this._then);

  final _ModHumanV4 _self;
  final $Res Function(_ModHumanV4) _then;

/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canBlink = freezed,Object? eyeLid = freezed,Object? bloodColor = freezed,Object? eyePos = freezed,Object? secondTextures = freezed,Object? thirdTextures = freezed,}) {
  return _then(_ModHumanV4(
canBlink: freezed == canBlink ? _self.canBlink : canBlink // ignore: cast_nullable_to_non_nullable
as bool?,eyeLid: freezed == eyeLid ? _self.eyeLid : eyeLid // ignore: cast_nullable_to_non_nullable
as MelonColor?,bloodColor: freezed == bloodColor ? _self.bloodColor : bloodColor // ignore: cast_nullable_to_non_nullable
as MelonColor?,eyePos: freezed == eyePos ? _self.eyePos : eyePos // ignore: cast_nullable_to_non_nullable
as MelonVector2?,secondTextures: freezed == secondTextures ? _self._secondTextures : secondTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReference>?,thirdTextures: freezed == thirdTextures ? _self._thirdTextures : thirdTextures // ignore: cast_nullable_to_non_nullable
as List<AssetReference>?,
  ));
}

/// Create a copy of ModHumanV4
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
}/// Create a copy of ModHumanV4
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
}/// Create a copy of ModHumanV4
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonVector2CopyWith<$Res>? get eyePos {
    if (_self.eyePos == null) {
    return null;
  }

  return $MelonVector2CopyWith<$Res>(_self.eyePos!, (value) {
    return _then(_self.copyWith(eyePos: value));
  });
}
}

// dart format on
