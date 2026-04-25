class GuideBookModel {
  final String bookId;
  final String subjectName;
  final String fileUrl;

  GuideBookModel({
    required this.bookId,
    required this.subjectName,
    required this.fileUrl,
  });

  factory GuideBookModel.fromMap(Map<String, dynamic> map) => GuideBookModel(
    bookId: map['bookId'] ?? '',
    subjectName: map['subjectName'] ?? '',
    fileUrl: map['fileUrl'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'bookId': bookId,
    'subjectName': subjectName,
    'fileUrl': fileUrl,
  };
}
