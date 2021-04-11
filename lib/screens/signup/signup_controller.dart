import 'package:charcoalchat/entities/user/user.dart' as model;
import 'package:charcoalchat/screens/signup/signup_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signupController = StateNotifierProvider.family
    .autoDispose<SignupController, SignupState, String>(
        (ref, projectId) => SignupController(projectId));

class SignupController extends StateNotifier<SignupState> {
  SignupController(this.projectId) : super(SignupState());
  final String projectId;

  void onChangeEmail(String value) {
    state = state.copyWith(email: value);
  }

  void onChangePassword(String value) {
    state = state.copyWith(password: value);
  }

  void onChangeName(String value) {
    state = state.copyWith(name: value);
  }

  void onSubmit() async {
    final app = Firebase.apps.singleWhere((app) => app.name == projectId);

    final credential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(
            email: state.email, password: state.password)
        .catchError((error) {
      print(error);
    });
    if (credential.user == null) {
      print('no user');
      return;
    }
    print(credential);
    final user = model.User(id: credential.user?.uid ?? '', name: state.name);

    print(user);
    await FirebaseFirestore.instanceFor(app: app)
        .collection('users')
        .doc(user.id)
        .set(user.toJson());
  }
}
