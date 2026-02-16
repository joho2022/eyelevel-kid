// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NicknameSetupState {

 String get nickname; String? get errorMessage; bool get isLoading; bool get canSubmit;
/// Create a copy of NicknameSetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameSetupStateCopyWith<NicknameSetupState> get copyWith => _$NicknameSetupStateCopyWithImpl<NicknameSetupState>(this as NicknameSetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameSetupState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,errorMessage,isLoading,canSubmit);

@override
String toString() {
  return 'NicknameSetupState(nickname: $nickname, errorMessage: $errorMessage, isLoading: $isLoading, canSubmit: $canSubmit)';
}


}

/// @nodoc
abstract mixin class $NicknameSetupStateCopyWith<$Res>  {
  factory $NicknameSetupStateCopyWith(NicknameSetupState value, $Res Function(NicknameSetupState) _then) = _$NicknameSetupStateCopyWithImpl;
@useResult
$Res call({
 String nickname, String? errorMessage, bool isLoading, bool canSubmit
});




}
/// @nodoc
class _$NicknameSetupStateCopyWithImpl<$Res>
    implements $NicknameSetupStateCopyWith<$Res> {
  _$NicknameSetupStateCopyWithImpl(this._self, this._then);

  final NicknameSetupState _self;
  final $Res Function(NicknameSetupState) _then;

/// Create a copy of NicknameSetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = null,Object? errorMessage = freezed,Object? isLoading = null,Object? canSubmit = null,}) {
  return _then(_self.copyWith(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NicknameSetupState].
extension NicknameSetupStatePatterns on NicknameSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NicknameSetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NicknameSetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NicknameSetupState value)  $default,){
final _that = this;
switch (_that) {
case _NicknameSetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NicknameSetupState value)?  $default,){
final _that = this;
switch (_that) {
case _NicknameSetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickname,  String? errorMessage,  bool isLoading,  bool canSubmit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NicknameSetupState() when $default != null:
return $default(_that.nickname,_that.errorMessage,_that.isLoading,_that.canSubmit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickname,  String? errorMessage,  bool isLoading,  bool canSubmit)  $default,) {final _that = this;
switch (_that) {
case _NicknameSetupState():
return $default(_that.nickname,_that.errorMessage,_that.isLoading,_that.canSubmit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickname,  String? errorMessage,  bool isLoading,  bool canSubmit)?  $default,) {final _that = this;
switch (_that) {
case _NicknameSetupState() when $default != null:
return $default(_that.nickname,_that.errorMessage,_that.isLoading,_that.canSubmit);case _:
  return null;

}
}

}

/// @nodoc


class _NicknameSetupState implements NicknameSetupState {
  const _NicknameSetupState({this.nickname = '', this.errorMessage, this.isLoading = false, this.canSubmit = false});
  

@override@JsonKey() final  String nickname;
@override final  String? errorMessage;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool canSubmit;

/// Create a copy of NicknameSetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NicknameSetupStateCopyWith<_NicknameSetupState> get copyWith => __$NicknameSetupStateCopyWithImpl<_NicknameSetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NicknameSetupState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,errorMessage,isLoading,canSubmit);

@override
String toString() {
  return 'NicknameSetupState(nickname: $nickname, errorMessage: $errorMessage, isLoading: $isLoading, canSubmit: $canSubmit)';
}


}

/// @nodoc
abstract mixin class _$NicknameSetupStateCopyWith<$Res> implements $NicknameSetupStateCopyWith<$Res> {
  factory _$NicknameSetupStateCopyWith(_NicknameSetupState value, $Res Function(_NicknameSetupState) _then) = __$NicknameSetupStateCopyWithImpl;
@override @useResult
$Res call({
 String nickname, String? errorMessage, bool isLoading, bool canSubmit
});




}
/// @nodoc
class __$NicknameSetupStateCopyWithImpl<$Res>
    implements _$NicknameSetupStateCopyWith<$Res> {
  __$NicknameSetupStateCopyWithImpl(this._self, this._then);

  final _NicknameSetupState _self;
  final $Res Function(_NicknameSetupState) _then;

/// Create a copy of NicknameSetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? errorMessage = freezed,Object? isLoading = null,Object? canSubmit = null,}) {
  return _then(_NicknameSetupState(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
