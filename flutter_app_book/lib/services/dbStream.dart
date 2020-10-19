
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_book/model/userModel.dart';

class DBStream {
  Firestore _firestore = Firestore.instance;

  Stream<UserModel> getCurrentUser(String uid) {
    return _firestore
        .collection('users')
        .document(uid)
        .snapshots()
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(doc: docSnapshot));
  }


}
