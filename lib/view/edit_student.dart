// import 'dart:js';
// import 'package:firebase_crud_app/controller/edit_controller.dart';
// import 'package:firebase_crud_app/service/database.dart';
// import 'package:firebase_crud_app/widgets/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';

// Future editStudentDetails(String id) async {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       content: Container(
//         width: double.infinity,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Consumer<AllProvider>(
//             builder: (context, value, child) => Column(
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.cancel,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   'Edit Details',
//                   style: TextStyle(fontSize: 20, color: Colors.black),
//                 ),
//                 SizedBox(height: 10),
//                 Center(
//                   child: Text(
//                     'Image',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                         color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ImagePickerFrom(),
//                 SizedBox(height: 20),
//                 Text(
//                   'Name',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: value.nameController,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     hintText: 'Enter the name',
//                     hintStyle: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Age',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: value.ageController,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
//                       hintText: 'Enter the age',
//                       hintStyle: TextStyle(color: Colors.black)),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Class',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: value.classController,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
//                       hintText: 'Enter the class',
//                       hintStyle: TextStyle(color: Colors.black)),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Mobile No',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: value.numberController,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
//                       hintText: 'Enter the mobile number',
//                       hintStyle: TextStyle(color: Colors.black)),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Address',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: value.addressController,
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     hintText: 'Enter the address',
//                     hintStyle: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                     onPressed: () async {
//                       Map<String, dynamic> updateInfo = {
//                         'Name': value.nameController.text,
//                         'Age': value.ageController.text,
//                         'Class': value.classController.text,
//                         'Mobile no': value.numberController.text,
//                         'Address':value. addressController.text,
//                         'Id': id
//                       };
//                       await DatabaseMethod()
//                           .updateStudentDetails(id, updateInfo)
//                           .then((value) => {
//                                 Fluttertoast.showToast(
//                                     msg: "Students details edited successfully",
//                                     toastLength: Toast.LENGTH_SHORT,
//                                     gravity: ToastGravity.CENTER,
//                                     timeInSecForIosWeb: 1,
//                                     backgroundColor: Colors.red,
//                                     textColor: Colors.green,
//                                     fontSize: 16.0),
//                                 Navigator.pop(context),
//                               });
//                     },
//                     style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all(
//                             Size(double.infinity, 40)),
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.green)),
//                     child: Text('Update')),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:firebase_crud_app/controller/base_provider.dart';
// import 'package:firebase_crud_app/controller/student_provider.dart';
// import 'package:firebase_crud_app/model/student_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';


// class EditPage extends StatefulWidget {
//   StudentModel student;
//   String id;
//   EditPage({
//     Key? key,
//     required this.student,
//     required this.id,
//   }) : super(key: key);

//   @override
//   State<EditPage> createState() => _EditPageState();
// }

// class _EditPageState extends State<EditPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController rollController = TextEditingController();
//   TextEditingController classController = TextEditingController();
//   File? selectedImage; // Use File for image selection
//   bool clicked = true;

//   ImagePicker imagePicker = ImagePicker();



//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.student.name);
//     rollController = TextEditingController(text: widget.student.age);
//     classController = TextEditingController(text: widget.student.studentClass);
//     Provider.of<BaseProvider>(context, listen: false).selectedImage =
//         File(widget.student.image!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Consumer<BaseProvider>(
//             builder: (context, value, child) => Column(
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: classController,
//                   decoration: InputDecoration(labelText: 'Class'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: rollController,
//                   decoration: InputDecoration(labelText: 'Roll no'),
//                 ),
//                 SizedBox(height: 16.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // setImage(ImageSource.camera);
//                         value.setImage(ImageSource.camera);
//                       },
//                       icon: const Icon(Icons.camera_alt),
//                       label: const Text('Take Photo'),
//                     ),
//                     const SizedBox(
//                       width: 16.0,
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // setImage(ImageSource.gallery);
//                         value.setImage(ImageSource.gallery);
//                       },
//                       icon: const Icon(Icons.photo),
//                       label: const Text('Choose from Gallery'),
//                     ),
//                   ],
//                 ),
//                 if (value.selectedImage != null)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: Image.network(value.selectedImage!.path)
//                     ),
//                   ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     editStudent(context, value.selectedImage!.path);
//                     //addStudent(context);
//                   },
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//  editStudent(BuildContext context, String imageurl) async {
//   final provider = Provider.of<StudentProvider>(context, listen: false);
//   final pro = Provider.of<BaseProvider>(context, listen: false);

//   try {
//     final editedname = nameController.text;
//     final editedage = rollController.text;
//     final editclass = classController.text;

//     // Update image URL in Firestore
//     await provider.updateImage(imageurl, pro.selectedImage);

//     final updatedstudent = StudentModel(
//       image: imageurl,
//       name: editedname,
//       age: editedage,
//       studentClass: editclass,
//     );

//     // Update student information in Firestore
//     provider.updateStudent(widget.id, updatedstudent);

//     Navigator.pop(context);
//   } catch (e) {
//     // Handle exceptions appropriately (e.g., show an error message)
//     print("Error updating student: $e");
//   }
// }
// }
