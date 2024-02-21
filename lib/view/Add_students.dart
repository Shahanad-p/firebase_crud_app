// ignore_for_file: use_build_context_synchronously, file_names, non_constant_identifier_names
import 'package:firebase_crud_app/service/database.dart';
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
                                msg: "Students details uploaded successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                          Navigator.pop(context);
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
