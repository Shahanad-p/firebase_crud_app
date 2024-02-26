// import 'package:flutter/material.dart';

// class AllProvider extends ChangeNotifier {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController classController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
// }
// // import 'dart:io';
// // import 'package:flutter/foundation.dart';
// // import 'package:image_picker/image_picker.dart';

// // class BaseProvider extends ChangeNotifier {
// //   File? selectedImage;
// //   ImagePicker imagePicker = ImagePicker();
// //   void setImage(ImageSource source) async {
// //     final pickedImage = await imagePicker.pickImage(source: source);

// //     selectedImage = pickedImage != null ? File(pickedImage.path) : null;
// //     notifyListeners();
// //   }
// // }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesProvider extends ChangeNotifier {
  File? selectImage;
  ImagePicker imagepicker = ImagePicker();
  void setImage(ImageSource source) async {
    final pickedImage = await imagepicker.pickImage(source: source);
    selectImage = pickedImage != null ? File(pickedImage.path) : null;
    notifyListeners();
  }
}
