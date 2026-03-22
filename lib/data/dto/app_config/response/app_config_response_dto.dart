import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/app_config.dart';

part 'app_config_response_dto.freezed.dart';
part 'app_config_response_dto.g.dart';

@freezed
abstract class AppConfigMessageResponseDto with _$AppConfigMessageResponseDto {
  const factory AppConfigMessageResponseDto({
    @Default(false) bool show,
    String? title,
    String? body,
    @Default(false) bool blocking,
  }) = _AppConfigMessageResponseDto;

  factory AppConfigMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AppConfigMessageResponseDtoFromJson(json);
}

@freezed
abstract class AppConfigResponseDto with _$AppConfigResponseDto {
  const factory AppConfigResponseDto({
    @Default('1.0.0') String minimumVersion,
    @Default('1.0.0') String latestVersion,
    @Default(AppConfigMessageResponseDto()) AppConfigMessageResponseDto message,
  }) = _AppConfigResponseDto;

  factory AppConfigResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AppConfigResponseDtoFromJson(json);
}

extension AppConfigResponseDtoMapper on AppConfigResponseDto {
  AppConfig toDomain() {
    return AppConfig(
      minimumVersion: minimumVersion,
      latestVersion: latestVersion,
      message: AppConfigMessage(
        show: message.show,
        title: message.title,
        body: message.body,
        blocking: message.blocking,
      ),
    );
  }
}