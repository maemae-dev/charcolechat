import 'package:charcoalchat/providers/current_team.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAppProvider = Provider<FirebaseApp?>((ref) {
  final team = ref.watch(currentTeam);
  return team == null
      ? null
      : Firebase.apps.singleWhere((app) => app.name == team.id);
});
