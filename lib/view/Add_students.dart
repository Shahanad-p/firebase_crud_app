// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:firebase_crud_app/controller/image_provider.dart';
import 'package:firebase_crud_app/controller/student_provider.dart';
import 'package:firebase_crud_app/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final imagepro = Provider.of<ImagesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      imagepro.setImage(ImageSource.camera);
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
                  ElevatedButton.icon(
                    onPressed: () {
                      imagepro.setImage(ImageSource.gallery);
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
              if (imagepro.selectImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      imagepro.selectImage!,
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter the name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  hintText: 'Enter the age',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.classController,
                decoration: InputDecoration(
                  labelText: 'Class',
                  hintText: 'Enter the class',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.rollController,
                decoration: InputDecoration(
                  labelText: 'Roll No',
                  hintText: 'Enter the roll no',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: widget.addressController,
                decoration: InputDecoration(
                  labelText: 'Adrees',
                  hintText: 'Enter the address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (_validateFields()) {
                    addStudent(context);
                  } else {
                    _showAlert(context, 'Please fill in all fields and Image.');
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateFields() {
    return widget.nameController.text.isNotEmpty &&
        widget.classController.text.isNotEmpty &&
        widget.rollController.text.isNotEmpty &&
        widget.ageController.text.isNotEmpty &&
        widget.ageController.text.isNotEmpty;
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void addStudent(
    BuildContext context,
  ) async {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    final imagepro = Provider.of<ImagesProvider>(context, listen: false);
    final name = widget.nameController.text;
    final age = widget.ageController.text;
    final roll = widget.rollController.text;
    final classs = widget.classController.text;
    final address = widget.addressController.text;

    await provider.imageAdder(File(imagepro.selectImage!.path));
    final student = StudentModel(
        name: name,
        rollno: roll,
        age: age,
        classs: classs,
        address: address,
        image: provider.downloadurl);

    provider.addStudent(student);
  }
}
