import 'package:charcoalchat/entities/user/user.dart' as model;
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepository = Provider<UserRepository>(
    (ref) => UserRepository(ref.watch(firebaseAppProvider)));

class UserRepository {
  UserRepository(FirebaseApp? _app)
      : _db = _app != null ? FirebaseFirestore.instanceFor(app: _app) : null;
  final FirebaseFirestore? _db;
  CollectionReference? get _ref => _db?.collection('users');

  Stream<List<model.User>?>? list() {
    return _ref?.snapshots().map((snap) =>
        snap.docs.map((doc) => model.User.fromJson(doc.data())).toList());
  }

  Stream<model.User?>? stream(String id) {
    return _ref
        ?.doc(id)
        .snapshots()
        .map((snap) => snap.exists ? model.User.fromJson(snap.data()!) : null);
  }
}
