class TeacherModel {
  final String uid;
  final String teacherId;
  final String fullName;
  final String subject;
  final String className;
  final String imageUrl;

  TeacherModel({
    required this.uid,
    required this.teacherId,
    required this.fullName,
    required this.subject,
    required this.className,
    required this.imageUrl,
  });

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      uid: map['uid'] ?? '',
      teacherId: map['teacherId'] ?? '',
      fullName: map['fullName'] ?? '',
      subject: map['subject'] ?? '',
      className: map['className'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'teacherId': teacherId,
      'fullName': fullName,
      'subject': subject,
      'className': className,
      'imageUrl': imageUrl,
    };
  }
}
