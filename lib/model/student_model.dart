// class StudentModel {
//   String? name;
//   String? age;
//   String? studentClass;
//   String? address;
//   String? image;
//   // int? id;

//   StudentModel({
//     this.name,
//     this.age,
//     this.studentClass,
//     this.address,
//     required this.image,
//     // this.id,
//   });
//   factory StudentModel.fromJson(Map<String, dynamic> json) {
//     return StudentModel(
//       image: json['image'],
//       name: json['name'] as String?,
//       age: json['age'] as String?,
//       studentClass: json['class'] as String?,
//       address: json['address'] as String?,
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'Image': image,
//       'name': name,
//       'age': age,
//       'class': studentClass,
//       'address': address,
//     };
//   }
// }
class StudentModel {
  String? name;
  String? rollno;
  String? classs;

  String? image;

  StudentModel({this.name, this.rollno, this.classs, required this.image});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      image: json['image'],
      name: json['name'] as String?,
      rollno: json['rollno'] as String?,
      classs: json['class'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'rollno': rollno,
      'class': classs,
    };
  }
}
