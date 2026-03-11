// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ask_question_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AskQuestionRequestDto {

 String get question; AnswerStyle get style;
/// Create a copy of AskQuestionRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskQuestionRequestDtoCopyWith<AskQuestionRequestDto> get copyWith => _$AskQuestionRequestDtoCopyWithImpl<AskQuestionRequestDto>(this as AskQuestionRequestDto, _$identity);

  /// Serializes this AskQuestionRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskQuestionRequestDto&&(identical(other.question, question) || other.question == question)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,style);

@override
String toString() {
  return 'AskQuestionRequestDto(question: $question, style: $style)';
}


}

/// @nodoc
abstract mixin class $AskQuestionRequestDtoCopyWith<$Res>  {
  factory $AskQuestionRequestDtoCopyWith(AskQuestionRequestDto value, $Res Function(AskQuestionRequestDto) _then) = _$AskQuestionRequestDtoCopyWithImpl;
@useResult
$Res call({
 String question, AnswerStyle style
});




}
/// @nodoc
class _$AskQuestionRequestDtoCopyWithImpl<$Res>
    implements $AskQuestionRequestDtoCopyWith<$Res> {
  _$AskQuestionRequestDtoCopyWithImpl(this._self, this._then);

  final AskQuestionRequestDto _self;
  final $Res Function(AskQuestionRequestDto) _then;

/// Create a copy of AskQuestionRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? style = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,
  ));
}

}


/// Adds pattern-matching-related methods to [AskQuestionRequestDto].
extension AskQuestionRequestDtoPatterns on AskQuestionRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AskQuestionRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AskQuestionRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AskQuestionRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AskQuestionRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AskQuestionRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AskQuestionRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  AnswerStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AskQuestionRequestDto() when $default != null:
return $default(_that.question,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  AnswerStyle style)  $default,) {final _that = this;
switch (_that) {
case _AskQuestionRequestDto():
return $default(_that.question,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  AnswerStyle style)?  $default,) {final _that = this;
switch (_that) {
case _AskQuestionRequestDto() when $default != null:
return $default(_that.question,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AskQuestionRequestDto implements AskQuestionRequestDto {
  const _AskQuestionRequestDto({required this.question, required this.style});
  factory _AskQuestionRequestDto.fromJson(Map<String, dynamic> json) => _$AskQuestionRequestDtoFromJson(json);

@override final  String question;
@override final  AnswerStyle style;

/// Create a copy of AskQuestionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AskQuestionRequestDtoCopyWith<_AskQuestionRequestDto> get copyWith => __$AskQuestionRequestDtoCopyWithImpl<_AskQuestionRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AskQuestionRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AskQuestionRequestDto&&(identical(other.question, question) || other.question == question)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,style);

@override
String toString() {
  return 'AskQuestionRequestDto(question: $question, style: $style)';
}


}

/// @nodoc
abstract mixin class _$AskQuestionRequestDtoCopyWith<$Res> implements $AskQuestionRequestDtoCopyWith<$Res> {
  factory _$AskQuestionRequestDtoCopyWith(_AskQuestionRequestDto value, $Res Function(_AskQuestionRequestDto) _then) = __$AskQuestionRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String question, AnswerStyle style
});




}
/// @nodoc
class __$AskQuestionRequestDtoCopyWithImpl<$Res>
    implements _$AskQuestionRequestDtoCopyWith<$Res> {
  __$AskQuestionRequestDtoCopyWithImpl(this._self, this._then);

  final _AskQuestionRequestDto _self;
  final $Res Function(_AskQuestionRequestDto) _then;

/// Create a copy of AskQuestionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? style = null,}) {
  return _then(_AskQuestionRequestDto(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,
  ));
}


}

// dart format on
