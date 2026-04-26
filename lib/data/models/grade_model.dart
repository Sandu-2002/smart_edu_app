class GradeModel {
  final String gradeId;
  final String studentName;
  final String studentId;
  final double marks;
  final String term;

  GradeModel({
    required this.gradeId,
    required this.studentName,
    required this.studentId,
    required this.marks,
    required this.term,
  });

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      gradeId: map['gradeId'] ?? '',
      studentName: map['studentName'] ?? '',
      studentId: map['studentId'] ?? '',
      marks: (map['marks'] ?? 0).toDouble(),
      term: map['term'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gradeId': gradeId,
      'studentName': studentName,
      'studentId': studentId,
      'marks': marks,
      'term': term,
    };
  }
}
