// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_app/controller/student_provider.dart';
import 'package:firebase_crud_app/model/student_model.dart';
import 'package:firebase_crud_app/view/add_students.dart';
import 'package:firebase_crud_app/view/details_screen.dart';
import 'package:firebase_crud_app/view/edit_student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<StudentProvider>(
          builder: (context, value, child) => Column(
            children: [
              StreamBuilder<QuerySnapshot<StudentModel>>(
                stream: value.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Snapshot has error'),
                    );
                  } else {
                    List<QueryDocumentSnapshot<StudentModel>> studentsDoc =
                        snapshot.data?.docs ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: studentsDoc.length,
                        itemBuilder: (context, index) {
                          final data = studentsDoc[index].data();
                          final id = studentsDoc[index].id;
                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 33, 20, 20),
                                  borderRadius: BorderRadius.circular(20.10)),
                              child: ListTile(
                                title: Text(
                                  data.name ?? 'No Name',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Age: ${data.age ?? 'no age'}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Roll No: ${data.rollno ?? 'no rollno'}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.deepPurple,
                                  backgroundImage: data.image != null
                                      ? NetworkImage(data.image!)
                                      : null,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Color.fromARGB(255, 40, 107, 42),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditPage(
                                              id: id,
                                              student: data,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        value.deleteStudent(id);
                                        value.deleteImage(data.image);
                                      },
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        studentInfo: data,
                                        imageUrl: data.image,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 17, 90, 20),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
