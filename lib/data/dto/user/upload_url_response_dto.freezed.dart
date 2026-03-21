// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_url_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadUrlResponseDto {

 String get uploadUrl; String get key;
/// Create a copy of UploadUrlResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadUrlResponseDtoCopyWith<UploadUrlResponseDto> get copyWith => _$UploadUrlResponseDtoCopyWithImpl<UploadUrlResponseDto>(this as UploadUrlResponseDto, _$identity);

  /// Serializes this UploadUrlResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadUrlResponseDto&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,key);

@override
String toString() {
  return 'UploadUrlResponseDto(uploadUrl: $uploadUrl, key: $key)';
}


}

/// @nodoc
abstract mixin class $UploadUrlResponseDtoCopyWith<$Res>  {
  factory $UploadUrlResponseDtoCopyWith(UploadUrlResponseDto value, $Res Function(UploadUrlResponseDto) _then) = _$UploadUrlResponseDtoCopyWithImpl;
@useResult
$Res call({
 String uploadUrl, String key
});




}
/// @nodoc
class _$UploadUrlResponseDtoCopyWithImpl<$Res>
    implements $UploadUrlResponseDtoCopyWith<$Res> {
  _$UploadUrlResponseDtoCopyWithImpl(this._self, this._then);

  final UploadUrlResponseDto _self;
  final $Res Function(UploadUrlResponseDto) _then;

/// Create a copy of UploadUrlResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = null,Object? key = null,}) {
  return _then(_self.copyWith(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadUrlResponseDto].
extension UploadUrlResponseDtoPatterns on UploadUrlResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadUrlResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadUrlResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadUrlResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _UploadUrlResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadUrlResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _UploadUrlResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uploadUrl,  String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadUrlResponseDto() when $default != null:
return $default(_that.uploadUrl,_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uploadUrl,  String key)  $default,) {final _that = this;
switch (_that) {
case _UploadUrlResponseDto():
return $default(_that.uploadUrl,_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uploadUrl,  String key)?  $default,) {final _that = this;
switch (_that) {
case _UploadUrlResponseDto() when $default != null:
return $default(_that.uploadUrl,_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadUrlResponseDto implements UploadUrlResponseDto {
  const _UploadUrlResponseDto({required this.uploadUrl, required this.key});
  factory _UploadUrlResponseDto.fromJson(Map<String, dynamic> json) => _$UploadUrlResponseDtoFromJson(json);

@override final  String uploadUrl;
@override final  String key;

/// Create a copy of UploadUrlResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadUrlResponseDtoCopyWith<_UploadUrlResponseDto> get copyWith => __$UploadUrlResponseDtoCopyWithImpl<_UploadUrlResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadUrlResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadUrlResponseDto&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,key);

@override
String toString() {
  return 'UploadUrlResponseDto(uploadUrl: $uploadUrl, key: $key)';
}


}

/// @nodoc
abstract mixin class _$UploadUrlResponseDtoCopyWith<$Res> implements $UploadUrlResponseDtoCopyWith<$Res> {
  factory _$UploadUrlResponseDtoCopyWith(_UploadUrlResponseDto value, $Res Function(_UploadUrlResponseDto) _then) = __$UploadUrlResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String uploadUrl, String key
});




}
/// @nodoc
class __$UploadUrlResponseDtoCopyWithImpl<$Res>
    implements _$UploadUrlResponseDtoCopyWith<$Res> {
  __$UploadUrlResponseDtoCopyWithImpl(this._self, this._then);

  final _UploadUrlResponseDto _self;
  final $Res Function(_UploadUrlResponseDto) _then;

/// Create a copy of UploadUrlResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = null,Object? key = null,}) {
  return _then(_UploadUrlResponseDto(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
