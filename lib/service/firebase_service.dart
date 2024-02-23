import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  //Create
  Future addStudentDetails(
      Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('student')
        .doc(id)
        .set(studentInfoMap);
  }

  //Read
  Future<Stream<QuerySnapshot>> getStudentsDetails() async {
    return FirebaseFirestore.instance.collection('student').snapshots();
  }

  //Upadte
  Future updateStudentDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection('student')
        .doc(id)
        .update(updateInfo);
  }

  //Delete
  Future deleteStudentDetails(String id) async {
    return FirebaseFirestore.instance.collection('student').doc(id);
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_crud_app/model/student_model.dart';

// class FirebaseService {
//   String collectionref = 'Donor';
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   FirebaseFirestore storage = FirebaseFirestore.instance;
//   late final CollectionReference<StudentModel> studentref;
//   FirebaseService() {
//     studentref = firestore
//         .collection(collectionref)
//         .withConverter<StudentModel>(
//             fromFirestore: ((snapshot, options) =>
//                 StudentModel.fromJson(snapshot.data()!)),
//             toFirestore: ((value, options) => value.toJson()));
//   }
// }
