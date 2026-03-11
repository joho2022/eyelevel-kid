// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_summary_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarSummaryResponseDto {

 int get year; int get month; List<String> get questionDates;
/// Create a copy of CalendarSummaryResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarSummaryResponseDtoCopyWith<CalendarSummaryResponseDto> get copyWith => _$CalendarSummaryResponseDtoCopyWithImpl<CalendarSummaryResponseDto>(this as CalendarSummaryResponseDto, _$identity);

  /// Serializes this CalendarSummaryResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarSummaryResponseDto&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other.questionDates, questionDates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,const DeepCollectionEquality().hash(questionDates));

@override
String toString() {
  return 'CalendarSummaryResponseDto(year: $year, month: $month, questionDates: $questionDates)';
}


}

/// @nodoc
abstract mixin class $CalendarSummaryResponseDtoCopyWith<$Res>  {
  factory $CalendarSummaryResponseDtoCopyWith(CalendarSummaryResponseDto value, $Res Function(CalendarSummaryResponseDto) _then) = _$CalendarSummaryResponseDtoCopyWithImpl;
@useResult
$Res call({
 int year, int month, List<String> questionDates
});




}
/// @nodoc
class _$CalendarSummaryResponseDtoCopyWithImpl<$Res>
    implements $CalendarSummaryResponseDtoCopyWith<$Res> {
  _$CalendarSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final CalendarSummaryResponseDto _self;
  final $Res Function(CalendarSummaryResponseDto) _then;

/// Create a copy of CalendarSummaryResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? month = null,Object? questionDates = null,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,questionDates: null == questionDates ? _self.questionDates : questionDates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarSummaryResponseDto].
extension CalendarSummaryResponseDtoPatterns on CalendarSummaryResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarSummaryResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarSummaryResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarSummaryResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int month,  List<String> questionDates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto() when $default != null:
return $default(_that.year,_that.month,_that.questionDates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int month,  List<String> questionDates)  $default,) {final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto():
return $default(_that.year,_that.month,_that.questionDates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int month,  List<String> questionDates)?  $default,) {final _that = this;
switch (_that) {
case _CalendarSummaryResponseDto() when $default != null:
return $default(_that.year,_that.month,_that.questionDates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarSummaryResponseDto implements CalendarSummaryResponseDto {
  const _CalendarSummaryResponseDto({required this.year, required this.month, required final  List<String> questionDates}): _questionDates = questionDates;
  factory _CalendarSummaryResponseDto.fromJson(Map<String, dynamic> json) => _$CalendarSummaryResponseDtoFromJson(json);

@override final  int year;
@override final  int month;
 final  List<String> _questionDates;
@override List<String> get questionDates {
  if (_questionDates is EqualUnmodifiableListView) return _questionDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questionDates);
}


/// Create a copy of CalendarSummaryResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarSummaryResponseDtoCopyWith<_CalendarSummaryResponseDto> get copyWith => __$CalendarSummaryResponseDtoCopyWithImpl<_CalendarSummaryResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarSummaryResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarSummaryResponseDto&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other._questionDates, _questionDates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,const DeepCollectionEquality().hash(_questionDates));

@override
String toString() {
  return 'CalendarSummaryResponseDto(year: $year, month: $month, questionDates: $questionDates)';
}


}

/// @nodoc
abstract mixin class _$CalendarSummaryResponseDtoCopyWith<$Res> implements $CalendarSummaryResponseDtoCopyWith<$Res> {
  factory _$CalendarSummaryResponseDtoCopyWith(_CalendarSummaryResponseDto value, $Res Function(_CalendarSummaryResponseDto) _then) = __$CalendarSummaryResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int year, int month, List<String> questionDates
});




}
/// @nodoc
class __$CalendarSummaryResponseDtoCopyWithImpl<$Res>
    implements _$CalendarSummaryResponseDtoCopyWith<$Res> {
  __$CalendarSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final _CalendarSummaryResponseDto _self;
  final $Res Function(_CalendarSummaryResponseDto) _then;

/// Create a copy of CalendarSummaryResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,Object? questionDates = null,}) {
  return _then(_CalendarSummaryResponseDto(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,questionDates: null == questionDates ? _self._questionDates : questionDates // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
