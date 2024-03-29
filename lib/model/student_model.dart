class StudentModel {
  String? name;
  String? rollno;
  String? classs;
  String? age;
  String? address;
  String? image;

  StudentModel(
      {this.name,
      this.rollno,
      this.classs,
      this.age,
      this.address,
      required this.image});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      image: json['image'],
      name: json['name'] as String?,
      rollno: json['rollno'] as String?,
      classs: json['class'] as String?,
      age: json['age'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'rollno': rollno,
      'class': classs,
      'age': age,
      'address': address
    };
  }
}
