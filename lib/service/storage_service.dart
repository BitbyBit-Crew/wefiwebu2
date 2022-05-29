import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:image_picker/image_picker.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(XFile filename) async {
    try {
      await storage.ref('lostnfound/$filename').putFile(File(filename.path));
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }

    Future<String> getDownload(String imageName) async {
      String dowloadURL =
          await storage.ref("lostnfound/$imageName").getDownloadURL();
      return dowloadURL;
    }
  }
}
