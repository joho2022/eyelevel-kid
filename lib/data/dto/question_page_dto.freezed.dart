// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionPageDto {

 List<QuestionRecordDto> get items; String? get nextCursor; bool get hasNext;
/// Create a copy of QuestionPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionPageDtoCopyWith<QuestionPageDto> get copyWith => _$QuestionPageDtoCopyWithImpl<QuestionPageDto>(this as QuestionPageDto, _$identity);

  /// Serializes this QuestionPageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionPageDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,hasNext);

@override
String toString() {
  return 'QuestionPageDto(items: $items, nextCursor: $nextCursor, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $QuestionPageDtoCopyWith<$Res>  {
  factory $QuestionPageDtoCopyWith(QuestionPageDto value, $Res Function(QuestionPageDto) _then) = _$QuestionPageDtoCopyWithImpl;
@useResult
$Res call({
 List<QuestionRecordDto> items, String? nextCursor, bool hasNext
});




}
/// @nodoc
class _$QuestionPageDtoCopyWithImpl<$Res>
    implements $QuestionPageDtoCopyWith<$Res> {
  _$QuestionPageDtoCopyWithImpl(this._self, this._then);

  final QuestionPageDto _self;
  final $Res Function(QuestionPageDto) _then;

/// Create a copy of QuestionPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasNext = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QuestionRecordDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionPageDto].
extension QuestionPageDtoPatterns on QuestionPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionPageDto value)  $default,){
final _that = this;
switch (_that) {
case _QuestionPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuestionRecordDto> items,  String? nextCursor,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionPageDto() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuestionRecordDto> items,  String? nextCursor,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _QuestionPageDto():
return $default(_that.items,_that.nextCursor,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuestionRecordDto> items,  String? nextCursor,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _QuestionPageDto() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionPageDto implements QuestionPageDto {
  const _QuestionPageDto({required final  List<QuestionRecordDto> items, this.nextCursor, required this.hasNext}): _items = items;
  factory _QuestionPageDto.fromJson(Map<String, dynamic> json) => _$QuestionPageDtoFromJson(json);

 final  List<QuestionRecordDto> _items;
@override List<QuestionRecordDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextCursor;
@override final  bool hasNext;

/// Create a copy of QuestionPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionPageDtoCopyWith<_QuestionPageDto> get copyWith => __$QuestionPageDtoCopyWithImpl<_QuestionPageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionPageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionPageDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,hasNext);

@override
String toString() {
  return 'QuestionPageDto(items: $items, nextCursor: $nextCursor, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$QuestionPageDtoCopyWith<$Res> implements $QuestionPageDtoCopyWith<$Res> {
  factory _$QuestionPageDtoCopyWith(_QuestionPageDto value, $Res Function(_QuestionPageDto) _then) = __$QuestionPageDtoCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionRecordDto> items, String? nextCursor, bool hasNext
});




}
/// @nodoc
class __$QuestionPageDtoCopyWithImpl<$Res>
    implements _$QuestionPageDtoCopyWith<$Res> {
  __$QuestionPageDtoCopyWithImpl(this._self, this._then);

  final _QuestionPageDto _self;
  final $Res Function(_QuestionPageDto) _then;

/// Create a copy of QuestionPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasNext = null,}) {
  return _then(_QuestionPageDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QuestionRecordDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
