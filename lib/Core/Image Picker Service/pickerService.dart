import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the gallery and returns it as an XFile
  Future<XFile?> pickImageFromGallery() async {
    // Open the gallery
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    return pickedImage;
  }

  /// Picks an image using the camera
  Future<File?> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}