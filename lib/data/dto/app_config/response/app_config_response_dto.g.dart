// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfigMessageResponseDto _$AppConfigMessageResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AppConfigMessageResponseDto(
  show: json['show'] as bool? ?? false,
  title: json['title'] as String?,
  body: json['body'] as String?,
  blocking: json['blocking'] as bool? ?? false,
);

Map<String, dynamic> _$AppConfigMessageResponseDtoToJson(
  _AppConfigMessageResponseDto instance,
) => <String, dynamic>{
  'show': instance.show,
  'title': instance.title,
  'body': instance.body,
  'blocking': instance.blocking,
};

_AppConfigResponseDto _$AppConfigResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AppConfigResponseDto(
  minimumVersion: json['minimumVersion'] as String? ?? '1.0.0',
  latestVersion: json['latestVersion'] as String? ?? '1.0.0',
  message: json['message'] == null
      ? const AppConfigMessageResponseDto()
      : AppConfigMessageResponseDto.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppConfigResponseDtoToJson(
  _AppConfigResponseDto instance,
) => <String, dynamic>{
  'minimumVersion': instance.minimumVersion,
  'latestVersion': instance.latestVersion,
  'message': instance.message,
};
