// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ask_question_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AskQuestionState {

 String get question; AnswerStyle get style; bool get isLoading;
/// Create a copy of AskQuestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskQuestionStateCopyWith<AskQuestionState> get copyWith => _$AskQuestionStateCopyWithImpl<AskQuestionState>(this as AskQuestionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskQuestionState&&(identical(other.question, question) || other.question == question)&&(identical(other.style, style) || other.style == style)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,question,style,isLoading);

@override
String toString() {
  return 'AskQuestionState(question: $question, style: $style, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $AskQuestionStateCopyWith<$Res>  {
  factory $AskQuestionStateCopyWith(AskQuestionState value, $Res Function(AskQuestionState) _then) = _$AskQuestionStateCopyWithImpl;
@useResult
$Res call({
 String question, AnswerStyle style, bool isLoading
});




}
/// @nodoc
class _$AskQuestionStateCopyWithImpl<$Res>
    implements $AskQuestionStateCopyWith<$Res> {
  _$AskQuestionStateCopyWithImpl(this._self, this._then);

  final AskQuestionState _self;
  final $Res Function(AskQuestionState) _then;

/// Create a copy of AskQuestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? style = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AskQuestionState].
extension AskQuestionStatePatterns on AskQuestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AskQuestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AskQuestionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AskQuestionState value)  $default,){
final _that = this;
switch (_that) {
case _AskQuestionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AskQuestionState value)?  $default,){
final _that = this;
switch (_that) {
case _AskQuestionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  AnswerStyle style,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AskQuestionState() when $default != null:
return $default(_that.question,_that.style,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  AnswerStyle style,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _AskQuestionState():
return $default(_that.question,_that.style,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  AnswerStyle style,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _AskQuestionState() when $default != null:
return $default(_that.question,_that.style,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _AskQuestionState implements AskQuestionState {
  const _AskQuestionState({this.question = '', this.style = AnswerStyle.story, this.isLoading = false});
  

@override@JsonKey() final  String question;
@override@JsonKey() final  AnswerStyle style;
@override@JsonKey() final  bool isLoading;

/// Create a copy of AskQuestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AskQuestionStateCopyWith<_AskQuestionState> get copyWith => __$AskQuestionStateCopyWithImpl<_AskQuestionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AskQuestionState&&(identical(other.question, question) || other.question == question)&&(identical(other.style, style) || other.style == style)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,question,style,isLoading);

@override
String toString() {
  return 'AskQuestionState(question: $question, style: $style, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$AskQuestionStateCopyWith<$Res> implements $AskQuestionStateCopyWith<$Res> {
  factory _$AskQuestionStateCopyWith(_AskQuestionState value, $Res Function(_AskQuestionState) _then) = __$AskQuestionStateCopyWithImpl;
@override @useResult
$Res call({
 String question, AnswerStyle style, bool isLoading
});




}
/// @nodoc
class __$AskQuestionStateCopyWithImpl<$Res>
    implements _$AskQuestionStateCopyWith<$Res> {
  __$AskQuestionStateCopyWithImpl(this._self, this._then);

  final _AskQuestionState _self;
  final $Res Function(_AskQuestionState) _then;

/// Create a copy of AskQuestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? style = null,Object? isLoading = null,}) {
  return _then(_AskQuestionState(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
