import 'dart:async';

import 'package:charcoalchat/entities/user/user.dart' as model;
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:charcoalchat/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserStream = StreamProvider<model.User?>((ref) {
  final app = ref.watch(firebaseAppProvider);
  if (app == null) return Stream.value(null);
  final repository = ref.watch(userRepository);
  final transformer = StreamTransformer<User?, model.User?>.fromHandlers(
      handleData: (User? authUser, sink) {
    if (authUser != null) {
      repository.stream(authUser.uid)?.listen((model.User? user) {
        sink.add(user);
      });
    } else {
      sink.add(null);
    }
  });
  return FirebaseAuth.instanceFor(app: app)
      .authStateChanges()
      .transform(transformer);
});

final currentUser = StateNotifierProvider<CurrentUser, model.User?>(
    (ref) => CurrentUser(ref.watch(currentUserStream).data));

class CurrentUser extends StateNotifier<model.User?> {
  CurrentUser(AsyncData<model.User?>? user) : super(null) {
    state =
        user?.when(data: (u) => u, loading: () => null, error: (_, __) => null);
  }
}
