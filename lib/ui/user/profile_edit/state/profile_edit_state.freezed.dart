// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditState {

 String get nickname; String? get errorMessage; String? get imagePath; bool get isLoading; bool get canSubmit;
/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditStateCopyWith<ProfileEditState> get copyWith => _$ProfileEditStateCopyWithImpl<ProfileEditState>(this as ProfileEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,errorMessage,imagePath,isLoading,canSubmit);

@override
String toString() {
  return 'ProfileEditState(nickname: $nickname, errorMessage: $errorMessage, imagePath: $imagePath, isLoading: $isLoading, canSubmit: $canSubmit)';
}


}

/// @nodoc
abstract mixin class $ProfileEditStateCopyWith<$Res>  {
  factory $ProfileEditStateCopyWith(ProfileEditState value, $Res Function(ProfileEditState) _then) = _$ProfileEditStateCopyWithImpl;
@useResult
$Res call({
 String nickname, String? errorMessage, String? imagePath, bool isLoading, bool canSubmit
});




}
/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._self, this._then);

  final ProfileEditState _self;
  final $Res Function(ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = null,Object? errorMessage = freezed,Object? imagePath = freezed,Object? isLoading = null,Object? canSubmit = null,}) {
  return _then(_self.copyWith(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEditState].
extension ProfileEditStatePatterns on ProfileEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEditState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEditState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickname,  String? errorMessage,  String? imagePath,  bool isLoading,  bool canSubmit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.nickname,_that.errorMessage,_that.imagePath,_that.isLoading,_that.canSubmit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickname,  String? errorMessage,  String? imagePath,  bool isLoading,  bool canSubmit)  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState():
return $default(_that.nickname,_that.errorMessage,_that.imagePath,_that.isLoading,_that.canSubmit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickname,  String? errorMessage,  String? imagePath,  bool isLoading,  bool canSubmit)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEditState() when $default != null:
return $default(_that.nickname,_that.errorMessage,_that.imagePath,_that.isLoading,_that.canSubmit);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEditState implements ProfileEditState {
  const _ProfileEditState({this.nickname = '', this.errorMessage, this.imagePath, this.isLoading = false, this.canSubmit = false});
  

@override@JsonKey() final  String nickname;
@override final  String? errorMessage;
@override final  String? imagePath;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool canSubmit;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEditStateCopyWith<_ProfileEditState> get copyWith => __$ProfileEditStateCopyWithImpl<_ProfileEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEditState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,errorMessage,imagePath,isLoading,canSubmit);

@override
String toString() {
  return 'ProfileEditState(nickname: $nickname, errorMessage: $errorMessage, imagePath: $imagePath, isLoading: $isLoading, canSubmit: $canSubmit)';
}


}

/// @nodoc
abstract mixin class _$ProfileEditStateCopyWith<$Res> implements $ProfileEditStateCopyWith<$Res> {
  factory _$ProfileEditStateCopyWith(_ProfileEditState value, $Res Function(_ProfileEditState) _then) = __$ProfileEditStateCopyWithImpl;
@override @useResult
$Res call({
 String nickname, String? errorMessage, String? imagePath, bool isLoading, bool canSubmit
});




}
/// @nodoc
class __$ProfileEditStateCopyWithImpl<$Res>
    implements _$ProfileEditStateCopyWith<$Res> {
  __$ProfileEditStateCopyWithImpl(this._self, this._then);

  final _ProfileEditState _self;
  final $Res Function(_ProfileEditState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? errorMessage = freezed,Object? imagePath = freezed,Object? isLoading = null,Object? canSubmit = null,}) {
  return _then(_ProfileEditState(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
