import 'package:charcoalchat/entities/team/team.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final teamList =
    StateNotifierProvider<TeamList, List<Team>>((ref) => TeamList());

class TeamList extends StateNotifier<List<Team>> {
  TeamList() : super([]) {
    SharedPreferences.getInstance().then((shared) {
      final projects = shared.getStringList('projectIds');
      if (mounted)
        state = projects
                ?.map((project) => Team(id: project, name: project))
                .toList() ??
            [];
    });
  }
}
