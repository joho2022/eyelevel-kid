// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 String get title; String get subtitle; bool get isInitialLoading; bool get isCalendarLoading; bool get isQuestionLoading; bool get isRecentLoading; DateTime get currentMonth; Set<DateTime> get questionDates; CalendarDaySummary? get selectedDay; List<QuestionRecord> get recentQuestions; String? get recentError; String? get calendarError; String? get dayQuestionError;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isCalendarLoading, isCalendarLoading) || other.isCalendarLoading == isCalendarLoading)&&(identical(other.isQuestionLoading, isQuestionLoading) || other.isQuestionLoading == isQuestionLoading)&&(identical(other.isRecentLoading, isRecentLoading) || other.isRecentLoading == isRecentLoading)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&const DeepCollectionEquality().equals(other.questionDates, questionDates)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other.recentQuestions, recentQuestions)&&(identical(other.recentError, recentError) || other.recentError == recentError)&&(identical(other.calendarError, calendarError) || other.calendarError == calendarError)&&(identical(other.dayQuestionError, dayQuestionError) || other.dayQuestionError == dayQuestionError));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,isInitialLoading,isCalendarLoading,isQuestionLoading,isRecentLoading,currentMonth,const DeepCollectionEquality().hash(questionDates),selectedDay,const DeepCollectionEquality().hash(recentQuestions),recentError,calendarError,dayQuestionError);

@override
String toString() {
  return 'HomeState(title: $title, subtitle: $subtitle, isInitialLoading: $isInitialLoading, isCalendarLoading: $isCalendarLoading, isQuestionLoading: $isQuestionLoading, isRecentLoading: $isRecentLoading, currentMonth: $currentMonth, questionDates: $questionDates, selectedDay: $selectedDay, recentQuestions: $recentQuestions, recentError: $recentError, calendarError: $calendarError, dayQuestionError: $dayQuestionError)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, bool isInitialLoading, bool isCalendarLoading, bool isQuestionLoading, bool isRecentLoading, DateTime currentMonth, Set<DateTime> questionDates, CalendarDaySummary? selectedDay, List<QuestionRecord> recentQuestions, String? recentError, String? calendarError, String? dayQuestionError
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? isInitialLoading = null,Object? isCalendarLoading = null,Object? isQuestionLoading = null,Object? isRecentLoading = null,Object? currentMonth = null,Object? questionDates = null,Object? selectedDay = freezed,Object? recentQuestions = null,Object? recentError = freezed,Object? calendarError = freezed,Object? dayQuestionError = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalendarLoading: null == isCalendarLoading ? _self.isCalendarLoading : isCalendarLoading // ignore: cast_nullable_to_non_nullable
as bool,isQuestionLoading: null == isQuestionLoading ? _self.isQuestionLoading : isQuestionLoading // ignore: cast_nullable_to_non_nullable
as bool,isRecentLoading: null == isRecentLoading ? _self.isRecentLoading : isRecentLoading // ignore: cast_nullable_to_non_nullable
as bool,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as DateTime,questionDates: null == questionDates ? _self.questionDates : questionDates // ignore: cast_nullable_to_non_nullable
as Set<DateTime>,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as CalendarDaySummary?,recentQuestions: null == recentQuestions ? _self.recentQuestions : recentQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionRecord>,recentError: freezed == recentError ? _self.recentError : recentError // ignore: cast_nullable_to_non_nullable
as String?,calendarError: freezed == calendarError ? _self.calendarError : calendarError // ignore: cast_nullable_to_non_nullable
as String?,dayQuestionError: freezed == dayQuestionError ? _self.dayQuestionError : dayQuestionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  bool isInitialLoading,  bool isCalendarLoading,  bool isQuestionLoading,  bool isRecentLoading,  DateTime currentMonth,  Set<DateTime> questionDates,  CalendarDaySummary? selectedDay,  List<QuestionRecord> recentQuestions,  String? recentError,  String? calendarError,  String? dayQuestionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.title,_that.subtitle,_that.isInitialLoading,_that.isCalendarLoading,_that.isQuestionLoading,_that.isRecentLoading,_that.currentMonth,_that.questionDates,_that.selectedDay,_that.recentQuestions,_that.recentError,_that.calendarError,_that.dayQuestionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  bool isInitialLoading,  bool isCalendarLoading,  bool isQuestionLoading,  bool isRecentLoading,  DateTime currentMonth,  Set<DateTime> questionDates,  CalendarDaySummary? selectedDay,  List<QuestionRecord> recentQuestions,  String? recentError,  String? calendarError,  String? dayQuestionError)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.title,_that.subtitle,_that.isInitialLoading,_that.isCalendarLoading,_that.isQuestionLoading,_that.isRecentLoading,_that.currentMonth,_that.questionDates,_that.selectedDay,_that.recentQuestions,_that.recentError,_that.calendarError,_that.dayQuestionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  bool isInitialLoading,  bool isCalendarLoading,  bool isQuestionLoading,  bool isRecentLoading,  DateTime currentMonth,  Set<DateTime> questionDates,  CalendarDaySummary? selectedDay,  List<QuestionRecord> recentQuestions,  String? recentError,  String? calendarError,  String? dayQuestionError)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.title,_that.subtitle,_that.isInitialLoading,_that.isCalendarLoading,_that.isQuestionLoading,_that.isRecentLoading,_that.currentMonth,_that.questionDates,_that.selectedDay,_that.recentQuestions,_that.recentError,_that.calendarError,_that.dayQuestionError);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.title = '오늘 아이는 어떤 세상을 봤을까요?', this.subtitle = '아이의 시선을 차곡차곡 기록해보세요', this.isInitialLoading = false, this.isCalendarLoading = false, this.isQuestionLoading = false, this.isRecentLoading = false, required this.currentMonth, final  Set<DateTime> questionDates = const <DateTime>{}, this.selectedDay, final  List<QuestionRecord> recentQuestions = const <QuestionRecord>[], this.recentError, this.calendarError, this.dayQuestionError}): _questionDates = questionDates,_recentQuestions = recentQuestions;
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String subtitle;
@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isCalendarLoading;
@override@JsonKey() final  bool isQuestionLoading;
@override@JsonKey() final  bool isRecentLoading;
@override final  DateTime currentMonth;
 final  Set<DateTime> _questionDates;
@override@JsonKey() Set<DateTime> get questionDates {
  if (_questionDates is EqualUnmodifiableSetView) return _questionDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_questionDates);
}

@override final  CalendarDaySummary? selectedDay;
 final  List<QuestionRecord> _recentQuestions;
@override@JsonKey() List<QuestionRecord> get recentQuestions {
  if (_recentQuestions is EqualUnmodifiableListView) return _recentQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentQuestions);
}

@override final  String? recentError;
@override final  String? calendarError;
@override final  String? dayQuestionError;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isCalendarLoading, isCalendarLoading) || other.isCalendarLoading == isCalendarLoading)&&(identical(other.isQuestionLoading, isQuestionLoading) || other.isQuestionLoading == isQuestionLoading)&&(identical(other.isRecentLoading, isRecentLoading) || other.isRecentLoading == isRecentLoading)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&const DeepCollectionEquality().equals(other._questionDates, _questionDates)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other._recentQuestions, _recentQuestions)&&(identical(other.recentError, recentError) || other.recentError == recentError)&&(identical(other.calendarError, calendarError) || other.calendarError == calendarError)&&(identical(other.dayQuestionError, dayQuestionError) || other.dayQuestionError == dayQuestionError));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,isInitialLoading,isCalendarLoading,isQuestionLoading,isRecentLoading,currentMonth,const DeepCollectionEquality().hash(_questionDates),selectedDay,const DeepCollectionEquality().hash(_recentQuestions),recentError,calendarError,dayQuestionError);

@override
String toString() {
  return 'HomeState(title: $title, subtitle: $subtitle, isInitialLoading: $isInitialLoading, isCalendarLoading: $isCalendarLoading, isQuestionLoading: $isQuestionLoading, isRecentLoading: $isRecentLoading, currentMonth: $currentMonth, questionDates: $questionDates, selectedDay: $selectedDay, recentQuestions: $recentQuestions, recentError: $recentError, calendarError: $calendarError, dayQuestionError: $dayQuestionError)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, bool isInitialLoading, bool isCalendarLoading, bool isQuestionLoading, bool isRecentLoading, DateTime currentMonth, Set<DateTime> questionDates, CalendarDaySummary? selectedDay, List<QuestionRecord> recentQuestions, String? recentError, String? calendarError, String? dayQuestionError
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? isInitialLoading = null,Object? isCalendarLoading = null,Object? isQuestionLoading = null,Object? isRecentLoading = null,Object? currentMonth = null,Object? questionDates = null,Object? selectedDay = freezed,Object? recentQuestions = null,Object? recentError = freezed,Object? calendarError = freezed,Object? dayQuestionError = freezed,}) {
  return _then(_HomeState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalendarLoading: null == isCalendarLoading ? _self.isCalendarLoading : isCalendarLoading // ignore: cast_nullable_to_non_nullable
as bool,isQuestionLoading: null == isQuestionLoading ? _self.isQuestionLoading : isQuestionLoading // ignore: cast_nullable_to_non_nullable
as bool,isRecentLoading: null == isRecentLoading ? _self.isRecentLoading : isRecentLoading // ignore: cast_nullable_to_non_nullable
as bool,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as DateTime,questionDates: null == questionDates ? _self._questionDates : questionDates // ignore: cast_nullable_to_non_nullable
as Set<DateTime>,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as CalendarDaySummary?,recentQuestions: null == recentQuestions ? _self._recentQuestions : recentQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionRecord>,recentError: freezed == recentError ? _self.recentError : recentError // ignore: cast_nullable_to_non_nullable
as String?,calendarError: freezed == calendarError ? _self.calendarError : calendarError // ignore: cast_nullable_to_non_nullable
as String?,dayQuestionError: freezed == dayQuestionError ? _self.dayQuestionError : dayQuestionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
