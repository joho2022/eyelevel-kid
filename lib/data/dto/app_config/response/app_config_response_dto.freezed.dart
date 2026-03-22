// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfigMessageResponseDto {

 bool get show; String? get title; String? get body; bool get blocking;
/// Create a copy of AppConfigMessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigMessageResponseDtoCopyWith<AppConfigMessageResponseDto> get copyWith => _$AppConfigMessageResponseDtoCopyWithImpl<AppConfigMessageResponseDto>(this as AppConfigMessageResponseDto, _$identity);

  /// Serializes this AppConfigMessageResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigMessageResponseDto&&(identical(other.show, show) || other.show == show)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.blocking, blocking) || other.blocking == blocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,show,title,body,blocking);

@override
String toString() {
  return 'AppConfigMessageResponseDto(show: $show, title: $title, body: $body, blocking: $blocking)';
}


}

/// @nodoc
abstract mixin class $AppConfigMessageResponseDtoCopyWith<$Res>  {
  factory $AppConfigMessageResponseDtoCopyWith(AppConfigMessageResponseDto value, $Res Function(AppConfigMessageResponseDto) _then) = _$AppConfigMessageResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool show, String? title, String? body, bool blocking
});




}
/// @nodoc
class _$AppConfigMessageResponseDtoCopyWithImpl<$Res>
    implements $AppConfigMessageResponseDtoCopyWith<$Res> {
  _$AppConfigMessageResponseDtoCopyWithImpl(this._self, this._then);

  final AppConfigMessageResponseDto _self;
  final $Res Function(AppConfigMessageResponseDto) _then;

/// Create a copy of AppConfigMessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? show = null,Object? title = freezed,Object? body = freezed,Object? blocking = null,}) {
  return _then(_self.copyWith(
show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,blocking: null == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfigMessageResponseDto].
extension AppConfigMessageResponseDtoPatterns on AppConfigMessageResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigMessageResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigMessageResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigMessageResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool show,  String? title,  String? body,  bool blocking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto() when $default != null:
return $default(_that.show,_that.title,_that.body,_that.blocking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool show,  String? title,  String? body,  bool blocking)  $default,) {final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto():
return $default(_that.show,_that.title,_that.body,_that.blocking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool show,  String? title,  String? body,  bool blocking)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigMessageResponseDto() when $default != null:
return $default(_that.show,_that.title,_that.body,_that.blocking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigMessageResponseDto implements AppConfigMessageResponseDto {
  const _AppConfigMessageResponseDto({this.show = false, this.title, this.body, this.blocking = false});
  factory _AppConfigMessageResponseDto.fromJson(Map<String, dynamic> json) => _$AppConfigMessageResponseDtoFromJson(json);

@override@JsonKey() final  bool show;
@override final  String? title;
@override final  String? body;
@override@JsonKey() final  bool blocking;

/// Create a copy of AppConfigMessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigMessageResponseDtoCopyWith<_AppConfigMessageResponseDto> get copyWith => __$AppConfigMessageResponseDtoCopyWithImpl<_AppConfigMessageResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigMessageResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigMessageResponseDto&&(identical(other.show, show) || other.show == show)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.blocking, blocking) || other.blocking == blocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,show,title,body,blocking);

@override
String toString() {
  return 'AppConfigMessageResponseDto(show: $show, title: $title, body: $body, blocking: $blocking)';
}


}

/// @nodoc
abstract mixin class _$AppConfigMessageResponseDtoCopyWith<$Res> implements $AppConfigMessageResponseDtoCopyWith<$Res> {
  factory _$AppConfigMessageResponseDtoCopyWith(_AppConfigMessageResponseDto value, $Res Function(_AppConfigMessageResponseDto) _then) = __$AppConfigMessageResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool show, String? title, String? body, bool blocking
});




}
/// @nodoc
class __$AppConfigMessageResponseDtoCopyWithImpl<$Res>
    implements _$AppConfigMessageResponseDtoCopyWith<$Res> {
  __$AppConfigMessageResponseDtoCopyWithImpl(this._self, this._then);

  final _AppConfigMessageResponseDto _self;
  final $Res Function(_AppConfigMessageResponseDto) _then;

/// Create a copy of AppConfigMessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? show = null,Object? title = freezed,Object? body = freezed,Object? blocking = null,}) {
  return _then(_AppConfigMessageResponseDto(
show: null == show ? _self.show : show // ignore: cast_nullable_to_non_nullable
as bool,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,blocking: null == blocking ? _self.blocking : blocking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AppConfigResponseDto {

 String get minimumVersion; String get latestVersion; AppConfigMessageResponseDto get message;
/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigResponseDtoCopyWith<AppConfigResponseDto> get copyWith => _$AppConfigResponseDtoCopyWithImpl<AppConfigResponseDto>(this as AppConfigResponseDto, _$identity);

  /// Serializes this AppConfigResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigResponseDto&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,latestVersion,message);

@override
String toString() {
  return 'AppConfigResponseDto(minimumVersion: $minimumVersion, latestVersion: $latestVersion, message: $message)';
}


}

/// @nodoc
abstract mixin class $AppConfigResponseDtoCopyWith<$Res>  {
  factory $AppConfigResponseDtoCopyWith(AppConfigResponseDto value, $Res Function(AppConfigResponseDto) _then) = _$AppConfigResponseDtoCopyWithImpl;
@useResult
$Res call({
 String minimumVersion, String latestVersion, AppConfigMessageResponseDto message
});


$AppConfigMessageResponseDtoCopyWith<$Res> get message;

}
/// @nodoc
class _$AppConfigResponseDtoCopyWithImpl<$Res>
    implements $AppConfigResponseDtoCopyWith<$Res> {
  _$AppConfigResponseDtoCopyWithImpl(this._self, this._then);

  final AppConfigResponseDto _self;
  final $Res Function(AppConfigResponseDto) _then;

/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? message = null,}) {
  return _then(_self.copyWith(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AppConfigMessageResponseDto,
  ));
}
/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigMessageResponseDtoCopyWith<$Res> get message {
  
  return $AppConfigMessageResponseDtoCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfigResponseDto].
extension AppConfigResponseDtoPatterns on AppConfigResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String minimumVersion,  String latestVersion,  AppConfigMessageResponseDto message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigResponseDto() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String minimumVersion,  String latestVersion,  AppConfigMessageResponseDto message)  $default,) {final _that = this;
switch (_that) {
case _AppConfigResponseDto():
return $default(_that.minimumVersion,_that.latestVersion,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String minimumVersion,  String latestVersion,  AppConfigMessageResponseDto message)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigResponseDto() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigResponseDto implements AppConfigResponseDto {
  const _AppConfigResponseDto({this.minimumVersion = '1.0.0', this.latestVersion = '1.0.0', this.message = const AppConfigMessageResponseDto()});
  factory _AppConfigResponseDto.fromJson(Map<String, dynamic> json) => _$AppConfigResponseDtoFromJson(json);

@override@JsonKey() final  String minimumVersion;
@override@JsonKey() final  String latestVersion;
@override@JsonKey() final  AppConfigMessageResponseDto message;

/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigResponseDtoCopyWith<_AppConfigResponseDto> get copyWith => __$AppConfigResponseDtoCopyWithImpl<_AppConfigResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigResponseDto&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,latestVersion,message);

@override
String toString() {
  return 'AppConfigResponseDto(minimumVersion: $minimumVersion, latestVersion: $latestVersion, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AppConfigResponseDtoCopyWith<$Res> implements $AppConfigResponseDtoCopyWith<$Res> {
  factory _$AppConfigResponseDtoCopyWith(_AppConfigResponseDto value, $Res Function(_AppConfigResponseDto) _then) = __$AppConfigResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String minimumVersion, String latestVersion, AppConfigMessageResponseDto message
});


@override $AppConfigMessageResponseDtoCopyWith<$Res> get message;

}
/// @nodoc
class __$AppConfigResponseDtoCopyWithImpl<$Res>
    implements _$AppConfigResponseDtoCopyWith<$Res> {
  __$AppConfigResponseDtoCopyWithImpl(this._self, this._then);

  final _AppConfigResponseDto _self;
  final $Res Function(_AppConfigResponseDto) _then;

/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? message = null,}) {
  return _then(_AppConfigResponseDto(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AppConfigMessageResponseDto,
  ));
}

/// Create a copy of AppConfigResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigMessageResponseDtoCopyWith<$Res> get message {
  
  return $AppConfigMessageResponseDtoCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
