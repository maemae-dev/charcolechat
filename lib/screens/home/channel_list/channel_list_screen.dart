import 'package:charcoalchat/providers/channel_list.dart';
import 'package:charcoalchat/providers/current_team.dart';
import 'package:charcoalchat/providers/current_user.dart';
import 'package:charcoalchat/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChannelListScreen extends HookWidget {
  ChannelListScreen({Key? key, this.title, this.onTapButton}) : super(key: key);

  final String? title;
  final void Function()? onTapButton;

  Widget build(BuildContext context) {
    final team = useProvider(currentTeam);
    final channels = useProvider(channelList);
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(team?.name ?? ''),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: team != null
                ? context.read(routerProvider.notifier).createChannel
                : null,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("# " + channels[index].name),
                  onTap: onTapButton,
                );
              },
              itemCount: channels.length,
            )),
          ],
        ),
      ),
    );
  }
}
