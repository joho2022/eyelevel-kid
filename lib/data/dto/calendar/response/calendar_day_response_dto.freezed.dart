// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_day_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarDayResponseDto {

 String get date; List<CalendarQuestionPreviewResponseDto> get questions;
/// Create a copy of CalendarDayResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarDayResponseDtoCopyWith<CalendarDayResponseDto> get copyWith => _$CalendarDayResponseDtoCopyWithImpl<CalendarDayResponseDto>(this as CalendarDayResponseDto, _$identity);

  /// Serializes this CalendarDayResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarDayResponseDto&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'CalendarDayResponseDto(date: $date, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $CalendarDayResponseDtoCopyWith<$Res>  {
  factory $CalendarDayResponseDtoCopyWith(CalendarDayResponseDto value, $Res Function(CalendarDayResponseDto) _then) = _$CalendarDayResponseDtoCopyWithImpl;
@useResult
$Res call({
 String date, List<CalendarQuestionPreviewResponseDto> questions
});




}
/// @nodoc
class _$CalendarDayResponseDtoCopyWithImpl<$Res>
    implements $CalendarDayResponseDtoCopyWith<$Res> {
  _$CalendarDayResponseDtoCopyWithImpl(this._self, this._then);

  final CalendarDayResponseDto _self;
  final $Res Function(CalendarDayResponseDto) _then;

/// Create a copy of CalendarDayResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? questions = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<CalendarQuestionPreviewResponseDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarDayResponseDto].
extension CalendarDayResponseDtoPatterns on CalendarDayResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarDayResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarDayResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarDayResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CalendarDayResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarDayResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarDayResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  List<CalendarQuestionPreviewResponseDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarDayResponseDto() when $default != null:
return $default(_that.date,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  List<CalendarQuestionPreviewResponseDto> questions)  $default,) {final _that = this;
switch (_that) {
case _CalendarDayResponseDto():
return $default(_that.date,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  List<CalendarQuestionPreviewResponseDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _CalendarDayResponseDto() when $default != null:
return $default(_that.date,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarDayResponseDto implements CalendarDayResponseDto {
  const _CalendarDayResponseDto({required this.date, required final  List<CalendarQuestionPreviewResponseDto> questions}): _questions = questions;
  factory _CalendarDayResponseDto.fromJson(Map<String, dynamic> json) => _$CalendarDayResponseDtoFromJson(json);

@override final  String date;
 final  List<CalendarQuestionPreviewResponseDto> _questions;
@override List<CalendarQuestionPreviewResponseDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of CalendarDayResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarDayResponseDtoCopyWith<_CalendarDayResponseDto> get copyWith => __$CalendarDayResponseDtoCopyWithImpl<_CalendarDayResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarDayResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarDayResponseDto&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'CalendarDayResponseDto(date: $date, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$CalendarDayResponseDtoCopyWith<$Res> implements $CalendarDayResponseDtoCopyWith<$Res> {
  factory _$CalendarDayResponseDtoCopyWith(_CalendarDayResponseDto value, $Res Function(_CalendarDayResponseDto) _then) = __$CalendarDayResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, List<CalendarQuestionPreviewResponseDto> questions
});




}
/// @nodoc
class __$CalendarDayResponseDtoCopyWithImpl<$Res>
    implements _$CalendarDayResponseDtoCopyWith<$Res> {
  __$CalendarDayResponseDtoCopyWithImpl(this._self, this._then);

  final _CalendarDayResponseDto _self;
  final $Res Function(_CalendarDayResponseDto) _then;

/// Create a copy of CalendarDayResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? questions = null,}) {
  return _then(_CalendarDayResponseDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<CalendarQuestionPreviewResponseDto>,
  ));
}


}

// dart format on
