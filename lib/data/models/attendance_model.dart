class AttendanceModel {
  final String attendanceId;
  final String studentName;
  final String studentId;
  final String status;
  final String date;

  AttendanceModel({
    required this.attendanceId,
    required this.studentName,
    required this.studentId,
    required this.status,
    required this.date,
  });

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      attendanceId: map['attendanceId'] ?? '',
      studentName: map['studentName'] ?? '',
      studentId: map['studentId'] ?? '',
      status: map['status'] ?? '',
      date: map['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'attendanceId': attendanceId,
      'studentName': studentName,
      'studentId': studentId,
      'status': status,
      'date': date,
    };
  }
}
