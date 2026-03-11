import 'dart:io';
import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<void> uploadImage({
    required String uploadUrl,
    required File file,
  }) async {
    final stream = file.openRead();

    final length = await file.length();

    await dio.put(
      uploadUrl,
      data: stream,
      options: Options(
        headers: {
          "Content-Type": "image/jpeg",
          "Content-Length": length,
        },
      ),
    );
  }
}
