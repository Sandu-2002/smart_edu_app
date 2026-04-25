class ParentModel {
  final String uid;
  final String parentId;
  final String fullName;
  final String childName;
  final String childStudentId;
  final String className;
  final String imageUrl;

  ParentModel({
    required this.uid,
    required this.parentId,
    required this.fullName,
    required this.childName,
    required this.childStudentId,
    required this.className,
    required this.imageUrl,
  });

  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentModel(
      uid: map['uid'] ?? '',
      parentId: map['parentId'] ?? '',
      fullName: map['fullName'] ?? '',
      childName: map['childName'] ?? '',
      childStudentId: map['childStudentId'] ?? '',
      className: map['className'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'parentId': parentId,
      'fullName': fullName,
      'childName': childName,
      'childStudentId': childStudentId,
      'className': className,
      'imageUrl': imageUrl,
    };
  }
}
