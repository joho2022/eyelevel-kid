import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_url_response_dto.freezed.dart';

part 'upload_url_response_dto.g.dart';

@freezed
abstract class UploadUrlResponseDto with _$UploadUrlResponseDto {
  const factory UploadUrlResponseDto({
    required String uploadUrl,
    required String key,
  }) = _UploadUrlResponseDto;

  factory UploadUrlResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UploadUrlResponseDtoFromJson(json);
}
