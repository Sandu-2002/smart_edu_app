class ShortNoteModel {
  final String noteId;
  final String subjectName;
  final String fileUrl;

  ShortNoteModel({
    required this.noteId,
    required this.subjectName,
    required this.fileUrl,
  });

  factory ShortNoteModel.fromMap(Map<String, dynamic> map) => ShortNoteModel(
    noteId: map['noteId'] ?? '',
    subjectName: map['subjectName'] ?? '',
    fileUrl: map['fileUrl'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'noteId': noteId,
    'subjectName': subjectName,
    'fileUrl': fileUrl,
  };
}
