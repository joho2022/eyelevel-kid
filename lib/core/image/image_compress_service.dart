import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageCompressService {
  Future<File> compress(File file) async {
    final dir = await getTemporaryDirectory();

    final targetPath = "${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";

    final compressed = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 60,
      minWidth: 256,
      minHeight: 256,
    );

    return File(compressed!.path);
  }
}
