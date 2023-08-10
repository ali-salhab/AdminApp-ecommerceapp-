import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageuploadcamera() async {
  final ImagePicker _picker = ImagePicker();
  XFile? file = await _picker.pickImage(source: ImageSource.camera);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileuploadgalllery({bool issvg = false}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          issvg ? ['SVG', 'svg'] : ["jpg", "jpeg", 'png', 'Gif']);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
