// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print, invalid_return_type_for_catch_error, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImagePickerModelPage extends ChangeNotifier {
  bool _isShimmer = false;
  bool get isShimmer => _isShimmer;

  toggleshemmerShow() {
    _isShimmer = true;
    notifyListeners();
  }

  toggleshemmerdismis() {
    _isShimmer = false;
    notifyListeners();
  }

  // final ImagePicker _picker = ImagePicker();

  var file;
  var imageName;

  pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }
    // var file =
    //     await ImageCropper.cropImage(sourcePath: pickedFile.path, aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1)) ;

    file = await cropImage(pickedFile);
    if (file == null) {
      return;
    }
    file = await compressImage(file.path, 35);

    imageName = file.path.split('/').last;
    print('final image name $imageName');
    print('image file $file');
    print('image imageName $imageName');
  }

  static Future<File?> cropImage(XFile file) async {
    final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    return croppedImage;
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        "${DateTime.now()}.${p.extension(path)}");

    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);

    return result!;
  }

  resetimagepickervariable() {
    file = null;
    imageName = null;
    notifyListeners();
  }
}
