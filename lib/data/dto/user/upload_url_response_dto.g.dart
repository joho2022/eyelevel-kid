// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_url_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadUrlResponseDto _$UploadUrlResponseDtoFromJson(
  Map<String, dynamic> json,
) => _UploadUrlResponseDto(
  uploadUrl: json['uploadUrl'] as String,
  token: json['token'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$UploadUrlResponseDtoToJson(
  _UploadUrlResponseDto instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'token': instance.token,
  'imageUrl': instance.imageUrl,
};
