import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/values/answer_style.dart';

part 'user_response_dto.freezed.dart';
part 'user_response_dto.g.dart';

@freezed
abstract class UserResponseDto with _$UserResponseDto {
  const factory UserResponseDto({
    required int id,
    required String nickname,
    String? profileImage,
  }) = _UserResponseDto;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);
}

extension UserResponseDtoMapper on UserResponseDto {
  User toDomain(AnswerStyle localStyle) {
    return User(
      id: id,
      nickname: nickname,
      profileImage: profileImage,
      answerStyle: localStyle,
    );
  }
}