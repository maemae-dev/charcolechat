import 'package:charcoalchat/entities/user/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepository = Provider<UserRepository>((ref) => UserRepository());

class UserRepository {
  Stream<model.User?> stream(FirebaseApp app, String id) {
    return FirebaseFirestore.instanceFor(app: app)
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => snap.exists ? model.User.fromJson(snap.data()!) : null);
  }
}
