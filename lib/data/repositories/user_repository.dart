import '../../core/services/firestore_service.dart';
import '../models/app_user_model.dart';

class UserRepository {
  final FirestoreService _firestore;

  UserRepository(this._firestore);

  Future<AppUserModel?> getUserByUid(String uid) async {
    final data = await _firestore.getUser(uid);

    if (data == null) return null;

    return AppUserModel.fromMap(data);
  }

  Future<void> saveUser(AppUserModel user) async {
    await _firestore.saveUser(user.uid, user.toMap());
  }
}
