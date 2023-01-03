import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//
// void pickUploadImage() async {
//   final image = await ImagePicker().pickImage(
//     source: ImageSource.gallery,
//     maxHeight: 512,
//     maxWidth: 512,
//     imageQuality: 75,
//   );
//
//   Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');
//
//   await ref.putFile(File(image!.path));
//   ref.getDownloadURL
// }

File? image;

Future pickImage() async {
  try {
    final imagep = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagep == null) return;
    final imageTemporary = File(imagep.path);
    image = imageTemporary;
  } on PlatformException catch (e) {
    debugPrint('Failed to pick image: $e');
  }
}

PlatformFile? pickedFile;

showImage() {
  if (image != null) {
    return Container(
      child: Image.file(
        image!,
        width: 160,
        height: 160,
        fit: BoxFit.cover,
      ),
    );
  } else {
    return Container();
  }
}
