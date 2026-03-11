// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionResponseDto {

 int get id; String get title; String get answer; AnswerStyle get style; DateTime get createdAt; bool get isBookmarked;
/// Create a copy of QuestionResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionResponseDtoCopyWith<QuestionResponseDto> get copyWith => _$QuestionResponseDtoCopyWithImpl<QuestionResponseDto>(this as QuestionResponseDto, _$identity);

  /// Serializes this QuestionResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,answer,style,createdAt,isBookmarked);

@override
String toString() {
  return 'QuestionResponseDto(id: $id, title: $title, answer: $answer, style: $style, createdAt: $createdAt, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class $QuestionResponseDtoCopyWith<$Res>  {
  factory $QuestionResponseDtoCopyWith(QuestionResponseDto value, $Res Function(QuestionResponseDto) _then) = _$QuestionResponseDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String answer, AnswerStyle style, DateTime createdAt, bool isBookmarked
});




}
/// @nodoc
class _$QuestionResponseDtoCopyWithImpl<$Res>
    implements $QuestionResponseDtoCopyWith<$Res> {
  _$QuestionResponseDtoCopyWithImpl(this._self, this._then);

  final QuestionResponseDto _self;
  final $Res Function(QuestionResponseDto) _then;

/// Create a copy of QuestionResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? answer = null,Object? style = null,Object? createdAt = null,Object? isBookmarked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionResponseDto].
extension QuestionResponseDtoPatterns on QuestionResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _QuestionResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String answer,  AnswerStyle style,  DateTime createdAt,  bool isBookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionResponseDto() when $default != null:
return $default(_that.id,_that.title,_that.answer,_that.style,_that.createdAt,_that.isBookmarked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String answer,  AnswerStyle style,  DateTime createdAt,  bool isBookmarked)  $default,) {final _that = this;
switch (_that) {
case _QuestionResponseDto():
return $default(_that.id,_that.title,_that.answer,_that.style,_that.createdAt,_that.isBookmarked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String answer,  AnswerStyle style,  DateTime createdAt,  bool isBookmarked)?  $default,) {final _that = this;
switch (_that) {
case _QuestionResponseDto() when $default != null:
return $default(_that.id,_that.title,_that.answer,_that.style,_that.createdAt,_that.isBookmarked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionResponseDto implements QuestionResponseDto {
  const _QuestionResponseDto({required this.id, required this.title, required this.answer, required this.style, required this.createdAt, required this.isBookmarked});
  factory _QuestionResponseDto.fromJson(Map<String, dynamic> json) => _$QuestionResponseDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String answer;
@override final  AnswerStyle style;
@override final  DateTime createdAt;
@override final  bool isBookmarked;

/// Create a copy of QuestionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionResponseDtoCopyWith<_QuestionResponseDto> get copyWith => __$QuestionResponseDtoCopyWithImpl<_QuestionResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,answer,style,createdAt,isBookmarked);

@override
String toString() {
  return 'QuestionResponseDto(id: $id, title: $title, answer: $answer, style: $style, createdAt: $createdAt, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class _$QuestionResponseDtoCopyWith<$Res> implements $QuestionResponseDtoCopyWith<$Res> {
  factory _$QuestionResponseDtoCopyWith(_QuestionResponseDto value, $Res Function(_QuestionResponseDto) _then) = __$QuestionResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String answer, AnswerStyle style, DateTime createdAt, bool isBookmarked
});




}
/// @nodoc
class __$QuestionResponseDtoCopyWithImpl<$Res>
    implements _$QuestionResponseDtoCopyWith<$Res> {
  __$QuestionResponseDtoCopyWithImpl(this._self, this._then);

  final _QuestionResponseDto _self;
  final $Res Function(_QuestionResponseDto) _then;

/// Create a copy of QuestionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? answer = null,Object? style = null,Object? createdAt = null,Object? isBookmarked = null,}) {
  return _then(_QuestionResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as AnswerStyle,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
