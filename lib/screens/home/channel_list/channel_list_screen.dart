import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/providers/channel_list.dart';
import 'package:charcoalchat/providers/current_channel.dart';
import 'package:charcoalchat/providers/current_team.dart';
import 'package:charcoalchat/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChannelListScreen extends HookWidget {
  ChannelListScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  Widget build(BuildContext context) {
    final team = useProvider(currentTeam);
    final channels = useProvider(channelList);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => ChannelItem(channels[index]),
            itemCount: channels.length,
          )),
        ],
      ),
    );

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
              itemBuilder: (context, index) => ChannelItem(channels[index]),
              itemCount: channels.length,
            )),
          ],
        ),
      ),
    );
  }
}

class ChannelItem extends HookWidget {
  ChannelItem(this.channel);
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("# " + channel.name),
      onTap: () {
        context.read(currentChannel.notifier).selectChannel(channel);
        context.read(routerProvider.notifier).toDetailPage();
      },
    );
  }
}
