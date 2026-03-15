// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyState {

 String get nickname; String? get profileImage; AnswerStyle get answerStyle;
/// Create a copy of MyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyStateCopyWith<MyState> get copyWith => _$MyStateCopyWithImpl<MyState>(this as MyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.answerStyle, answerStyle) || other.answerStyle == answerStyle));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,profileImage,answerStyle);

@override
String toString() {
  return 'MyState(nickname: $nickname, profileImage: $profileImage, answerStyle: $answerStyle)';
}


}

/// @nodoc
abstract mixin class $MyStateCopyWith<$Res>  {
  factory $MyStateCopyWith(MyState value, $Res Function(MyState) _then) = _$MyStateCopyWithImpl;
@useResult
$Res call({
 String nickname, String? profileImage, AnswerStyle answerStyle
});




}
/// @nodoc
class _$MyStateCopyWithImpl<$Res>
    implements $MyStateCopyWith<$Res> {
  _$MyStateCopyWithImpl(this._self, this._then);

  final MyState _self;
  final $Res Function(MyState) _then;

/// Create a copy of MyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = null,Object? profileImage = freezed,Object? answerStyle = null,}) {
  return _then(_self.copyWith(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,answerStyle: null == answerStyle ? _self.answerStyle : answerStyle // ignore: cast_nullable_to_non_nullable
as AnswerStyle,
  ));
}

}


/// Adds pattern-matching-related methods to [MyState].
extension MyStatePatterns on MyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyState value)  $default,){
final _that = this;
switch (_that) {
case _MyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyState value)?  $default,){
final _that = this;
switch (_that) {
case _MyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickname,  String? profileImage,  AnswerStyle answerStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyState() when $default != null:
return $default(_that.nickname,_that.profileImage,_that.answerStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickname,  String? profileImage,  AnswerStyle answerStyle)  $default,) {final _that = this;
switch (_that) {
case _MyState():
return $default(_that.nickname,_that.profileImage,_that.answerStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickname,  String? profileImage,  AnswerStyle answerStyle)?  $default,) {final _that = this;
switch (_that) {
case _MyState() when $default != null:
return $default(_that.nickname,_that.profileImage,_that.answerStyle);case _:
  return null;

}
}

}

/// @nodoc


class _MyState implements MyState {
  const _MyState({required this.nickname, this.profileImage, required this.answerStyle});
  

@override final  String nickname;
@override final  String? profileImage;
@override final  AnswerStyle answerStyle;

/// Create a copy of MyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyStateCopyWith<_MyState> get copyWith => __$MyStateCopyWithImpl<_MyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.answerStyle, answerStyle) || other.answerStyle == answerStyle));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,profileImage,answerStyle);

@override
String toString() {
  return 'MyState(nickname: $nickname, profileImage: $profileImage, answerStyle: $answerStyle)';
}


}

/// @nodoc
abstract mixin class _$MyStateCopyWith<$Res> implements $MyStateCopyWith<$Res> {
  factory _$MyStateCopyWith(_MyState value, $Res Function(_MyState) _then) = __$MyStateCopyWithImpl;
@override @useResult
$Res call({
 String nickname, String? profileImage, AnswerStyle answerStyle
});




}
/// @nodoc
class __$MyStateCopyWithImpl<$Res>
    implements _$MyStateCopyWith<$Res> {
  __$MyStateCopyWithImpl(this._self, this._then);

  final _MyState _self;
  final $Res Function(_MyState) _then;

/// Create a copy of MyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? profileImage = freezed,Object? answerStyle = null,}) {
  return _then(_MyState(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,answerStyle: null == answerStyle ? _self.answerStyle : answerStyle // ignore: cast_nullable_to_non_nullable
as AnswerStyle,
  ));
}


}

// dart format on
