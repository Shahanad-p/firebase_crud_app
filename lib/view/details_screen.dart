// import 'package:firebase_crud_app/model/student_model.dart';
// import 'package:flutter/material.dart';

// class Detail extends StatelessWidget {
//   final StudentModel student;

//   const Detail({required this.student, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(student.name ?? 'Student Detail'),
//         backgroundColor: Colors.deepPurple, // Set app bar color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display student details with improved styling
//             ListTile(
//               title: Text(
//                 "Name",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 student.name ?? '',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ListTile(
//               title: Text(
//                 "Age",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 student.age ?? '',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ListTile(
//               title: Text(
//                 "Class",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 student.studentClass ?? '',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             // Add more details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors

import 'package:firebase_crud_app/model/student_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final StudentModel student;

  const DetailScreen({required this.student, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Detail',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.name ?? '',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Age",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.age ?? '',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Class",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.classs ?? '',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "RollNo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.rollno ?? '',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                student.address ?? '',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
