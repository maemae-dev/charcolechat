import 'package:charcoalchat/screens/home/create_channel_page/create_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateChannelPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        fullscreenDialog: true,
        settings: this,
        builder: (context) => CreateChannelScreen());
  }
}

class CreateChannelScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final channel = useProvider(createChannelController);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new channel'),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: channel.name,
            onChanged:
                context.read(createChannelController.notifier).onChangeName,
          ),
          ElevatedButton(
            onPressed: () async {
              await context.read(createChannelController.notifier).create();
              Navigator.of(context).pop();
            },
            child: Text('Create'),
          )
        ],
      ),
    );
  }
}
