// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserFileData {

 String get id; String? get fileName; Uint8List? get bytes; String? get path; MelonBase? get melon;
/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFileDataCopyWith<UserFileData> get copyWith => _$UserFileDataCopyWithImpl<UserFileData>(this as UserFileData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.path, path) || other.path == path)&&(identical(other.melon, melon) || other.melon == melon));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,const DeepCollectionEquality().hash(bytes),path,melon);

@override
String toString() {
  return 'UserFileData(id: $id, fileName: $fileName, bytes: $bytes, path: $path, melon: $melon)';
}


}

/// @nodoc
abstract mixin class $UserFileDataCopyWith<$Res>  {
  factory $UserFileDataCopyWith(UserFileData value, $Res Function(UserFileData) _then) = _$UserFileDataCopyWithImpl;
@useResult
$Res call({
 String id, String? fileName, Uint8List? bytes, String? path, MelonBase? melon
});


$MelonBaseCopyWith<$Res>? get melon;

}
/// @nodoc
class _$UserFileDataCopyWithImpl<$Res>
    implements $UserFileDataCopyWith<$Res> {
  _$UserFileDataCopyWithImpl(this._self, this._then);

  final UserFileData _self;
  final $Res Function(UserFileData) _then;

/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = freezed,Object? bytes = freezed,Object? path = freezed,Object? melon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,melon: freezed == melon ? _self.melon : melon // ignore: cast_nullable_to_non_nullable
as MelonBase?,
  ));
}
/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonBaseCopyWith<$Res>? get melon {
    if (_self.melon == null) {
    return null;
  }

  return $MelonBaseCopyWith<$Res>(_self.melon!, (value) {
    return _then(_self.copyWith(melon: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserFileData].
extension UserFileDataPatterns on UserFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFileData value)  $default,){
final _that = this;
switch (_that) {
case _UserFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFileData value)?  $default,){
final _that = this;
switch (_that) {
case _UserFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fileName,  Uint8List? bytes,  String? path,  MelonBase? melon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFileData() when $default != null:
return $default(_that.id,_that.fileName,_that.bytes,_that.path,_that.melon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fileName,  Uint8List? bytes,  String? path,  MelonBase? melon)  $default,) {final _that = this;
switch (_that) {
case _UserFileData():
return $default(_that.id,_that.fileName,_that.bytes,_that.path,_that.melon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fileName,  Uint8List? bytes,  String? path,  MelonBase? melon)?  $default,) {final _that = this;
switch (_that) {
case _UserFileData() when $default != null:
return $default(_that.id,_that.fileName,_that.bytes,_that.path,_that.melon);case _:
  return null;

}
}

}

/// @nodoc


class _UserFileData extends UserFileData {
  const _UserFileData({required this.id, this.fileName, this.bytes, this.path, this.melon}): super._();
  

@override final  String id;
@override final  String? fileName;
@override final  Uint8List? bytes;
@override final  String? path;
@override final  MelonBase? melon;

/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFileDataCopyWith<_UserFileData> get copyWith => __$UserFileDataCopyWithImpl<_UserFileData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.path, path) || other.path == path)&&(identical(other.melon, melon) || other.melon == melon));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,const DeepCollectionEquality().hash(bytes),path,melon);

@override
String toString() {
  return 'UserFileData(id: $id, fileName: $fileName, bytes: $bytes, path: $path, melon: $melon)';
}


}

/// @nodoc
abstract mixin class _$UserFileDataCopyWith<$Res> implements $UserFileDataCopyWith<$Res> {
  factory _$UserFileDataCopyWith(_UserFileData value, $Res Function(_UserFileData) _then) = __$UserFileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fileName, Uint8List? bytes, String? path, MelonBase? melon
});


@override $MelonBaseCopyWith<$Res>? get melon;

}
/// @nodoc
class __$UserFileDataCopyWithImpl<$Res>
    implements _$UserFileDataCopyWith<$Res> {
  __$UserFileDataCopyWithImpl(this._self, this._then);

  final _UserFileData _self;
  final $Res Function(_UserFileData) _then;

/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = freezed,Object? bytes = freezed,Object? path = freezed,Object? melon = freezed,}) {
  return _then(_UserFileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,melon: freezed == melon ? _self.melon : melon // ignore: cast_nullable_to_non_nullable
as MelonBase?,
  ));
}

/// Create a copy of UserFileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MelonBaseCopyWith<$Res>? get melon {
    if (_self.melon == null) {
    return null;
  }

  return $MelonBaseCopyWith<$Res>(_self.melon!, (value) {
    return _then(_self.copyWith(melon: value));
  });
}
}

// dart format on
