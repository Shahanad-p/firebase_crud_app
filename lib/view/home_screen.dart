// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_app/service/database.dart';
import 'package:firebase_crud_app/view/Add_students.dart';
import 'package:firebase_crud_app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Stream? studentStream;

  getOnTheLoad() async {
    studentStream = await DatabaseMethod().getStudentsDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Future editStudentDetails(String id) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          // decoration: BoxDecoration(
          //     color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Edit Details',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),
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
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> updateInfo = {
                        'Name': nameController.text,
                        'Age': ageController.text,
                        'Class': classController.text,
                        'Mobile no': numberController.text,
                        'Address': addressController.text,
                        'Id': id
                      };
                      await DatabaseMethod()
                          .updateStudentDetails(id, updateInfo)
                          .then((value) => {
                                Fluttertoast.showToast(
                                    msg: "Students details edited successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.green,
                                    fontSize: 16.0),
                                Navigator.pop(context),
                              });
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Text('Update')),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget allStudentDetails() {
    return StreamBuilder(
      stream: studentStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Material(
                    elevation: 5.0,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      height: 110,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.green,
                                ),
                                Column(
                                  children: [
                                    Text('Name : ' + ds['Name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('Age : ' + ds['Age'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('Class : ' + ds['Class'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('Mobile no : +' + ds['Mobile no'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text(
                                      'Address : ' + ds['Address'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        nameController.text = ds['Name'];
                                        ageController.text = ds['Age'];
                                        classController.text = ds['Class'];
                                        numberController.text = ds['Mobile no'];
                                        addressController.text = ds['Address'];
                                        editStudentDetails(ds['Id']);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: const Color.fromARGB(
                                            255, 22, 86, 24),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: const Color.fromARGB(
                                            255, 141, 42, 34),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddStudentsScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Firebase Crud',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 63, 62, 62),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Expanded(child: allStudentDetails()),
      ),
    );
  }
}
