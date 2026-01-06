// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picked_file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PickedFileData {

 String get id; String get fileName; Uint8List get bytes;
/// Create a copy of PickedFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickedFileDataCopyWith<PickedFileData> get copyWith => _$PickedFileDataCopyWithImpl<PickedFileData>(this as PickedFileData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickedFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'PickedFileData(id: $id, fileName: $fileName, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $PickedFileDataCopyWith<$Res>  {
  factory $PickedFileDataCopyWith(PickedFileData value, $Res Function(PickedFileData) _then) = _$PickedFileDataCopyWithImpl;
@useResult
$Res call({
 String id, String fileName, Uint8List bytes
});




}
/// @nodoc
class _$PickedFileDataCopyWithImpl<$Res>
    implements $PickedFileDataCopyWith<$Res> {
  _$PickedFileDataCopyWithImpl(this._self, this._then);

  final PickedFileData _self;
  final $Res Function(PickedFileData) _then;

/// Create a copy of PickedFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = null,Object? bytes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

}


/// Adds pattern-matching-related methods to [PickedFileData].
extension PickedFileDataPatterns on PickedFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickedFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickedFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickedFileData value)  $default,){
final _that = this;
switch (_that) {
case _PickedFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickedFileData value)?  $default,){
final _that = this;
switch (_that) {
case _PickedFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileName,  Uint8List bytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickedFileData() when $default != null:
return $default(_that.id,_that.fileName,_that.bytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileName,  Uint8List bytes)  $default,) {final _that = this;
switch (_that) {
case _PickedFileData():
return $default(_that.id,_that.fileName,_that.bytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileName,  Uint8List bytes)?  $default,) {final _that = this;
switch (_that) {
case _PickedFileData() when $default != null:
return $default(_that.id,_that.fileName,_that.bytes);case _:
  return null;

}
}

}

/// @nodoc


class _PickedFileData extends PickedFileData {
  const _PickedFileData({required this.id, required this.fileName, required this.bytes}): super._();
  

@override final  String id;
@override final  String fileName;
@override final  Uint8List bytes;

/// Create a copy of PickedFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickedFileDataCopyWith<_PickedFileData> get copyWith => __$PickedFileDataCopyWithImpl<_PickedFileData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickedFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileName,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'PickedFileData(id: $id, fileName: $fileName, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class _$PickedFileDataCopyWith<$Res> implements $PickedFileDataCopyWith<$Res> {
  factory _$PickedFileDataCopyWith(_PickedFileData value, $Res Function(_PickedFileData) _then) = __$PickedFileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileName, Uint8List bytes
});




}
/// @nodoc
class __$PickedFileDataCopyWithImpl<$Res>
    implements _$PickedFileDataCopyWith<$Res> {
  __$PickedFileDataCopyWithImpl(this._self, this._then);

  final _PickedFileData _self;
  final $Res Function(_PickedFileData) _then;

/// Create a copy of PickedFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = null,Object? bytes = null,}) {
  return _then(_PickedFileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
