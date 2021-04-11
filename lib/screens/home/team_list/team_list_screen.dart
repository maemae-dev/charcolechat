import 'package:charcoalchat/providers/team_list.dart';
import 'package:charcoalchat/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamListScreen extends HookWidget {
  TeamListScreen({this.onTapTeam});
  final Function()? onTapTeam;

  @override
  Widget build(BuildContext context) {
    final teams = useProvider(teamList);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: onTapTeam,
                  leading:
                      SizedBox(width: 40, height: 40, child: Placeholder()),
                  title: Text(
                    teams[index].name,
                  ),
                );
              },
              itemCount: teams.length,
            ),
          ),
          ElevatedButton(
              onPressed: context.read(routerProvider.notifier).addTeam,
              child: Text('Add Team'))
        ],
      ),
    );
  }
}
