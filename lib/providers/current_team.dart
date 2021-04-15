import 'package:charcoalchat/entities/team/team.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentTeam =
    StateNotifierProvider<CurrentTeam, Team?>((ref) => CurrentTeam());

class CurrentTeam extends StateNotifier<Team?> {
  CurrentTeam() : super(null) {
    // TODO: set team that watched last from shared_preference.
  }

  void selectTeam(Team team) {
    state = team;
  }
}
