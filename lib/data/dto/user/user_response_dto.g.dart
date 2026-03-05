// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) =>
    _UserResponseDto(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImagePath: json['profileImagePath'] as String?,
    );

Map<String, dynamic> _$UserResponseDtoToJson(_UserResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'profileImagePath': instance.profileImagePath,
    };
