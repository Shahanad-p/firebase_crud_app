// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:firebase_crud_app/controller/image_provider.dart';
import 'package:firebase_crud_app/controller/student_provider.dart';
import 'package:firebase_crud_app/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  StudentModel student;
  String id;
  EditPage({required this.student, required this.id, Key? key})
      : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? selectedImage;
  bool clicked = true;

  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    rollController = TextEditingController(text: widget.student.rollno);
    classController = TextEditingController(text: widget.student.classs);
    ageController = TextEditingController(text: widget.student.age);
    addressController = TextEditingController(text: widget.student.address);
    Provider.of<ImagesProvider>(context, listen: false).selectImage =
        File(widget.student.image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<ImagesProvider>(
          builder: (context, value, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      value.setImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Camera'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement gallery functionality here
                      value.setImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.photo_library),
                    label: Text('Gallery'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              if (value.selectImage != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      value.selectImage!.path,
                      height: 150,
                    ),
                  ),
                ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Age'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: classController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Class'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: rollController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'RollNo'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Address'),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    editData(context, value.selectImage!.path);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }

  editData(BuildContext context, String imageurl) async {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    final imagepro = Provider.of<ImagesProvider>(context, listen: false);

    try {
      final newName = nameController.text;
      final newRollno = rollController.text;
      final newClass = classController.text;
      final newAge = ageController.text;
      final newAddress = addressController.text;

      await provider.updateImage(imageurl, imagepro.selectImage);

      final updatedStudent = StudentModel(
          image: imageurl,
          name: newName,
          rollno: newRollno,
          classs: newClass,
          age: newAge,
          address: newAddress);

      provider.updateStudent(widget.id, updatedStudent);
      Navigator.pop(context);
    } catch (e) {
      // print("Error on Updating :$e");
    }
  }
}
