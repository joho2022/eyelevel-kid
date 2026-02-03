// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarSummaryDto {

 int get year; int get month;@JsonKey(name: 'dates') List<String> get dateStrings;
/// Create a copy of CalendarSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarSummaryDtoCopyWith<CalendarSummaryDto> get copyWith => _$CalendarSummaryDtoCopyWithImpl<CalendarSummaryDto>(this as CalendarSummaryDto, _$identity);

  /// Serializes this CalendarSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarSummaryDto&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other.dateStrings, dateStrings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,const DeepCollectionEquality().hash(dateStrings));

@override
String toString() {
  return 'CalendarSummaryDto(year: $year, month: $month, dateStrings: $dateStrings)';
}


}

/// @nodoc
abstract mixin class $CalendarSummaryDtoCopyWith<$Res>  {
  factory $CalendarSummaryDtoCopyWith(CalendarSummaryDto value, $Res Function(CalendarSummaryDto) _then) = _$CalendarSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int year, int month,@JsonKey(name: 'dates') List<String> dateStrings
});




}
/// @nodoc
class _$CalendarSummaryDtoCopyWithImpl<$Res>
    implements $CalendarSummaryDtoCopyWith<$Res> {
  _$CalendarSummaryDtoCopyWithImpl(this._self, this._then);

  final CalendarSummaryDto _self;
  final $Res Function(CalendarSummaryDto) _then;

/// Create a copy of CalendarSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? month = null,Object? dateStrings = null,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,dateStrings: null == dateStrings ? _self.dateStrings : dateStrings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarSummaryDto].
extension CalendarSummaryDtoPatterns on CalendarSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _CalendarSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int month, @JsonKey(name: 'dates')  List<String> dateStrings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarSummaryDto() when $default != null:
return $default(_that.year,_that.month,_that.dateStrings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int month, @JsonKey(name: 'dates')  List<String> dateStrings)  $default,) {final _that = this;
switch (_that) {
case _CalendarSummaryDto():
return $default(_that.year,_that.month,_that.dateStrings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int month, @JsonKey(name: 'dates')  List<String> dateStrings)?  $default,) {final _that = this;
switch (_that) {
case _CalendarSummaryDto() when $default != null:
return $default(_that.year,_that.month,_that.dateStrings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarSummaryDto implements CalendarSummaryDto {
  const _CalendarSummaryDto({required this.year, required this.month, @JsonKey(name: 'dates') required final  List<String> dateStrings}): _dateStrings = dateStrings;
  factory _CalendarSummaryDto.fromJson(Map<String, dynamic> json) => _$CalendarSummaryDtoFromJson(json);

@override final  int year;
@override final  int month;
 final  List<String> _dateStrings;
@override@JsonKey(name: 'dates') List<String> get dateStrings {
  if (_dateStrings is EqualUnmodifiableListView) return _dateStrings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dateStrings);
}


/// Create a copy of CalendarSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarSummaryDtoCopyWith<_CalendarSummaryDto> get copyWith => __$CalendarSummaryDtoCopyWithImpl<_CalendarSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarSummaryDto&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other._dateStrings, _dateStrings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,const DeepCollectionEquality().hash(_dateStrings));

@override
String toString() {
  return 'CalendarSummaryDto(year: $year, month: $month, dateStrings: $dateStrings)';
}


}

/// @nodoc
abstract mixin class _$CalendarSummaryDtoCopyWith<$Res> implements $CalendarSummaryDtoCopyWith<$Res> {
  factory _$CalendarSummaryDtoCopyWith(_CalendarSummaryDto value, $Res Function(_CalendarSummaryDto) _then) = __$CalendarSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int year, int month,@JsonKey(name: 'dates') List<String> dateStrings
});




}
/// @nodoc
class __$CalendarSummaryDtoCopyWithImpl<$Res>
    implements _$CalendarSummaryDtoCopyWith<$Res> {
  __$CalendarSummaryDtoCopyWithImpl(this._self, this._then);

  final _CalendarSummaryDto _self;
  final $Res Function(_CalendarSummaryDto) _then;

/// Create a copy of CalendarSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,Object? dateStrings = null,}) {
  return _then(_CalendarSummaryDto(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,dateStrings: null == dateStrings ? _self._dateStrings : dateStrings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
