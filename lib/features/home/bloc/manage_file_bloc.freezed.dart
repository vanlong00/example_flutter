// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_file_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageFileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageFileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileEvent()';
}


}

/// @nodoc
class $ManageFileEventCopyWith<$Res>  {
$ManageFileEventCopyWith(ManageFileEvent _, $Res Function(ManageFileEvent) __);
}


/// Adds pattern-matching-related methods to [ManageFileEvent].
extension ManageFileEventPatterns on ManageFileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PickFile value)?  pickFile,TResult Function( _ClearFile value)?  clearFile,TResult Function( _RemoveFile value)?  removeFile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickFile() when pickFile != null:
return pickFile(_that);case _ClearFile() when clearFile != null:
return clearFile(_that);case _RemoveFile() when removeFile != null:
return removeFile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PickFile value)  pickFile,required TResult Function( _ClearFile value)  clearFile,required TResult Function( _RemoveFile value)  removeFile,}){
final _that = this;
switch (_that) {
case _PickFile():
return pickFile(_that);case _ClearFile():
return clearFile(_that);case _RemoveFile():
return removeFile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PickFile value)?  pickFile,TResult? Function( _ClearFile value)?  clearFile,TResult? Function( _RemoveFile value)?  removeFile,}){
final _that = this;
switch (_that) {
case _PickFile() when pickFile != null:
return pickFile(_that);case _ClearFile() when clearFile != null:
return clearFile(_that);case _RemoveFile() when removeFile != null:
return removeFile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pickFile,TResult Function()?  clearFile,TResult Function( int index)?  removeFile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickFile() when pickFile != null:
return pickFile();case _ClearFile() when clearFile != null:
return clearFile();case _RemoveFile() when removeFile != null:
return removeFile(_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pickFile,required TResult Function()  clearFile,required TResult Function( int index)  removeFile,}) {final _that = this;
switch (_that) {
case _PickFile():
return pickFile();case _ClearFile():
return clearFile();case _RemoveFile():
return removeFile(_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pickFile,TResult? Function()?  clearFile,TResult? Function( int index)?  removeFile,}) {final _that = this;
switch (_that) {
case _PickFile() when pickFile != null:
return pickFile();case _ClearFile() when clearFile != null:
return clearFile();case _RemoveFile() when removeFile != null:
return removeFile(_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _PickFile implements ManageFileEvent {
  const _PickFile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickFile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileEvent.pickFile()';
}


}




/// @nodoc


class _ClearFile implements ManageFileEvent {
  const _ClearFile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearFile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileEvent.clearFile()';
}


}




/// @nodoc


class _RemoveFile implements ManageFileEvent {
  const _RemoveFile(this.index);
  

 final  int index;

/// Create a copy of ManageFileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFileCopyWith<_RemoveFile> get copyWith => __$RemoveFileCopyWithImpl<_RemoveFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFile&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'ManageFileEvent.removeFile(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveFileCopyWith<$Res> implements $ManageFileEventCopyWith<$Res> {
  factory _$RemoveFileCopyWith(_RemoveFile value, $Res Function(_RemoveFile) _then) = __$RemoveFileCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveFileCopyWithImpl<$Res>
    implements _$RemoveFileCopyWith<$Res> {
  __$RemoveFileCopyWithImpl(this._self, this._then);

  final _RemoveFile _self;
  final $Res Function(_RemoveFile) _then;

/// Create a copy of ManageFileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveFile(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ManageFileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageFileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileState()';
}


}

/// @nodoc
class $ManageFileStateCopyWith<$Res>  {
$ManageFileStateCopyWith(ManageFileState _, $Res Function(ManageFileState) __);
}


/// Adds pattern-matching-related methods to [ManageFileState].
extension ManageFileStatePatterns on ManageFileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PickedFileData> files)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.files);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PickedFileData> files)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.files);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PickedFileData> files)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.files);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ManageFileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileState.initial()';
}


}




/// @nodoc


class _Loading implements ManageFileState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageFileState.loading()';
}


}




/// @nodoc


class _Loaded implements ManageFileState {
  const _Loaded({required final  List<PickedFileData> files}): _files = files;
  

 final  List<PickedFileData> _files;
 List<PickedFileData> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of ManageFileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'ManageFileState.loaded(files: $files)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ManageFileStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<PickedFileData> files
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ManageFileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? files = null,}) {
  return _then(_Loaded(
files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<PickedFileData>,
  ));
}


}

/// @nodoc


class _Error implements ManageFileState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ManageFileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ManageFileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ManageFileStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ManageFileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
