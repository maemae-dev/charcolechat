import 'package:animations/animations.dart';
import 'package:charcoalchat/providers/current_team.dart';
import 'package:charcoalchat/providers/team_list.dart';
import 'package:charcoalchat/router.dart';
import 'package:charcoalchat/screens/home/create_channel_page/create_channel_page.dart';
import 'package:charcoalchat/screens/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamListScreen extends HookWidget {
  TeamListScreen();

  @override
  Widget build(BuildContext context) {
    final teams = useProvider(teamList);
    final team = useProvider(currentTeam);

    return Drawer(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return OpenContainer(
                closedColor: Theme.of(context).canvasColor,
                closedBuilder: (context, open) => ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add team'),
                      onTap:
                          open, //context.read(routerProvider.notifier).addTeam,
                    ),
                openBuilder: (context, value) => RegistrationScreen());
          }
          return ListTile(
            selected: team == teams[index - 1],
            onTap: () {
              context.read(currentTeam.notifier).selectTeam(teams[index - 1]);
              Navigator.of(context).pop();
            },
            leading: SizedBox(width: 40, height: 40, child: Placeholder()),
            title: Text(teams[index - 1].name),
          );
        },
        itemCount: teams.length + 1,
      ),
    );
  }
}
