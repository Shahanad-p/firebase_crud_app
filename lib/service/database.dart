import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addStudentDetails(
      Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('student')
        .doc(id)
        .set(studentInfoMap);
  }
}
