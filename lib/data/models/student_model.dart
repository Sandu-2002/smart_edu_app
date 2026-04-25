class StudentModel {
  final String uid;
  final String studentId;
  final String fullName;
  final String className;
  final String section;
  final int attendanceRate;
  final double gpa;
  final int rank;
  final String parentId;
  final String imageUrl;

  StudentModel({
    required this.uid,
    required this.studentId,
    required this.fullName,
    required this.className,
    required this.section,
    required this.attendanceRate,
    required this.gpa,
    required this.rank,
    required this.parentId,
    required this.imageUrl,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      uid: map['uid'] ?? '',
      studentId: map['studentId'] ?? '',
      fullName: map['fullName'] ?? '',
      className: map['className'] ?? '',
      section: map['section'] ?? '',
      attendanceRate: map['attendanceRate'] ?? 0,
      gpa: (map['gpa'] ?? 0).toDouble(),
      rank: map['rank'] ?? 0,
      parentId: map['parentId'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'studentId': studentId,
      'fullName': fullName,
      'className': className,
      'section': section,
      'attendanceRate': attendanceRate,
      'gpa': gpa,
      'rank': rank,
      'parentId': parentId,
      'imageUrl': imageUrl,
    };
  }
}
