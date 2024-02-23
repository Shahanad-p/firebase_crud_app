// ignore_for_file: use_build_context_synchronously, file_names, non_constant_identifier_names

import 'package:firebase_crud_app/service/firebase_service.dart';
import 'package:firebase_crud_app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class AddStudentsScreen extends StatefulWidget {
  const AddStudentsScreen({super.key});

  @override
  State<AddStudentsScreen> createState() => _AddStudentsScreenState();
}

class _AddStudentsScreenState extends State<AddStudentsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Students Data',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 63, 62, 62),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 209, 209),
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Image',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    ImagePickerFrom(),
                    SizedBox(height: 20),
                    Text(
                      'Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: 'Enter the name',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Age',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: ageController,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Enter the age',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Class',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: classController,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Enter the class',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mobile No',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: numberController,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Enter the mobile number',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: addressController,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Enter the address',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          String Id = randomAlpha(10);
                          Map<String, dynamic> studentInfoMap = {
                            'Name': nameController.text,
                            'Age': ageController.text,
                            'Class': classController.text,
                            'Mobile no': numberController.text,
                            'Address': addressController.text,
                            'Id': Id,
                          };
                          await DatabaseMethod()
                              .addStudentDetails(studentInfoMap, Id)
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Students details Added successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pop(context);
                          });
                        },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(double.infinity, 40)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';

// import 'package:firebase_crud_app/controller/base_provider.dart';
// import 'package:firebase_crud_app/controller/student_provider.dart';
// import 'package:firebase_crud_app/model/student_model.dart';
// import 'package:firebase_crud_app/view/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class AddPage extends StatefulWidget {
//   AddPage({Key? key}) : super(key: key);

//   TextEditingController nameController = TextEditingController();
//   TextEditingController rollController = TextEditingController();
//   TextEditingController classController = TextEditingController();

//   @override
//   _AddPageState createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   @override
//   Widget build(BuildContext context) {
//     final pro = Provider.of<BaseProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Student'),
//         backgroundColor: Colors.deepPurple, // Set app bar color
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: widget.nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: widget.classController,
//                 decoration: const InputDecoration(labelText: 'Class'),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: widget.rollController,
//                 decoration: const InputDecoration(labelText: 'Roll no'),
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pro.setImage(ImageSource.camera);
//                     },
//                     icon: const Icon(Icons.camera_alt),
//                     label: const Text('Take Photo'),
//                   ),
//                   const SizedBox(
//                     width: 16.0,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pro.setImage(ImageSource.gallery);
//                     },
//                     icon: const Icon(Icons.photo),
//                     label: const Text('Choose from Gallery'),
//                   ),
//                 ],
//               ),
//               if (pro.selectedImage != null)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.file(
//                       pro.selectedImage!,
//                       height: 100,
//                       width: 100,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_validateFields()) {
//                     addStudent(context);
//                   } else {
//                     _showAlert(context, 'Please fill in all fields.');
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: const Color.fromARGB(255, 248, 248, 248),
//                 ),
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool _validateFields() {
//     return widget.nameController.text.isNotEmpty &&
//         widget.classController.text.isNotEmpty &&
//         widget.rollController.text.isNotEmpty;
//   }

//   void _showAlert(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Alert'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void addStudent(BuildContext context) async {
//     final provider = Provider.of<StudentProvider>(context, listen: false);
//     final pro = Provider.of<BaseProvider>(context, listen: false);
//     final name = widget.nameController.text;
//     final roll = widget.rollController.text;
//     final classs = widget.classController.text;

//     await provider.imageAdder(File(pro.selectedImage!.path));

//     final student = StudentModel(
//       name: name,
//       age: roll,
//       studentClass: classs,
//       image: provider.downloadurl,
//     );

//     provider.addStudent(student);

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomePage(),
//       ),
//     );
//   }
// }
