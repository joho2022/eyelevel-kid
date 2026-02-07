// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_record_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionRecordDto {

 int get id; String get title; String get answer; String get style; String get createdAt; bool get isBookmarked;
/// Create a copy of QuestionRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionRecordDtoCopyWith<QuestionRecordDto> get copyWith => _$QuestionRecordDtoCopyWithImpl<QuestionRecordDto>(this as QuestionRecordDto, _$identity);

  /// Serializes this QuestionRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,answer,style,createdAt,isBookmarked);

@override
String toString() {
  return 'QuestionRecordDto(id: $id, title: $title, answer: $answer, style: $style, createdAt: $createdAt, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class $QuestionRecordDtoCopyWith<$Res>  {
  factory $QuestionRecordDtoCopyWith(QuestionRecordDto value, $Res Function(QuestionRecordDto) _then) = _$QuestionRecordDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String answer, String style, String createdAt, bool isBookmarked
});




}
/// @nodoc
class _$QuestionRecordDtoCopyWithImpl<$Res>
    implements $QuestionRecordDtoCopyWith<$Res> {
  _$QuestionRecordDtoCopyWithImpl(this._self, this._then);

  final QuestionRecordDto _self;
  final $Res Function(QuestionRecordDto) _then;

/// Create a copy of QuestionRecordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? answer = null,Object? style = null,Object? createdAt = null,Object? isBookmarked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionRecordDto].
extension QuestionRecordDtoPatterns on QuestionRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _QuestionRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String answer,  String style,  String createdAt,  bool isBookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionRecordDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String answer,  String style,  String createdAt,  bool isBookmarked)  $default,) {final _that = this;
switch (_that) {
case _QuestionRecordDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String answer,  String style,  String createdAt,  bool isBookmarked)?  $default,) {final _that = this;
switch (_that) {
case _QuestionRecordDto() when $default != null:
return $default(_that.id,_that.title,_that.answer,_that.style,_that.createdAt,_that.isBookmarked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionRecordDto implements QuestionRecordDto {
  const _QuestionRecordDto({required this.id, required this.title, required this.answer, required this.style, required this.createdAt, required this.isBookmarked});
  factory _QuestionRecordDto.fromJson(Map<String, dynamic> json) => _$QuestionRecordDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String answer;
@override final  String style;
@override final  String createdAt;
@override final  bool isBookmarked;

/// Create a copy of QuestionRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionRecordDtoCopyWith<_QuestionRecordDto> get copyWith => __$QuestionRecordDtoCopyWithImpl<_QuestionRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,answer,style,createdAt,isBookmarked);

@override
String toString() {
  return 'QuestionRecordDto(id: $id, title: $title, answer: $answer, style: $style, createdAt: $createdAt, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class _$QuestionRecordDtoCopyWith<$Res> implements $QuestionRecordDtoCopyWith<$Res> {
  factory _$QuestionRecordDtoCopyWith(_QuestionRecordDto value, $Res Function(_QuestionRecordDto) _then) = __$QuestionRecordDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String answer, String style, String createdAt, bool isBookmarked
});




}
/// @nodoc
class __$QuestionRecordDtoCopyWithImpl<$Res>
    implements _$QuestionRecordDtoCopyWith<$Res> {
  __$QuestionRecordDtoCopyWithImpl(this._self, this._then);

  final _QuestionRecordDto _self;
  final $Res Function(_QuestionRecordDto) _then;

/// Create a copy of QuestionRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? answer = null,Object? style = null,Object? createdAt = null,Object? isBookmarked = null,}) {
  return _then(_QuestionRecordDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
