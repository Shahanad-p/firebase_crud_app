import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_app/model/student_model.dart';
import 'package:firebase_crud_app/service/firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  FirebaseService firebaseService = FirebaseService();
  String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadurl = '';

  Stream<QuerySnapshot<StudentModel>> getData() {
    return firebaseService.studentref.snapshots();
  }

  addStudent(StudentModel student) async {
    await firebaseService.studentref.add(student);
    notifyListeners();
  }

  deleteStudent(id) async {
    await firebaseService.studentref.doc(id).delete();
    notifyListeners();
  }

  updateStudent(id, StudentModel student) async {
    await firebaseService.studentref.doc(id).update(student.toJson());
    notifyListeners();
  }

  imageAdder(image) async {
    //for the image saving path  .ref().child('images'); refrence and the folder name image
    Reference folder = firebaseService.storage.ref().child('images');
    Reference images = folder.child("$uniquename.jpg");
    try {
      await images.putFile(image);
      downloadurl = await images.getDownloadURL();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  updateImage(imageurl, File? newimage) async {
    try {
      if (newimage != null && newimage.existsSync()) {
        Reference storedimage = FirebaseStorage.instance.refFromURL(imageurl);
        await storedimage.putFile(newimage);
        downloadurl = await storedimage.getDownloadURL();
        // print("Image uploaded successfully. Download URL: $downloadurl");
        notifyListeners();
      } else {
        // If no new image or new image is null or doesn't exist, keep the existing URL
        downloadurl = imageurl;
      }
      notifyListeners();
    } catch (e) {
      // print("Error updating image: $e");
    }
  }

  deleteImage(imageurl) async {
    Reference storedimage = FirebaseStorage.instance.refFromURL(imageurl);
    await storedimage.delete();
  }
}
