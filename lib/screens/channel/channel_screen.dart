import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/providers/message_list.dart';
import 'package:charcoalchat/providers/user_list.dart';
import 'package:charcoalchat/screens/channel/message_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChannelScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final messages = useProvider(messageList);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => MessageBox(messages[index]),
            itemCount: messages.length,
          )),
          Divider(),
          MessageField(),
        ],
      ),
    );
  }
}

class MessageBox extends HookWidget {
  MessageBox(this.message);
  final Message message;

  @override
  Widget build(BuildContext context) {
    final users = useProvider(userList);
    final sender = users.singleWhere((user) => user.id == message.senderId,
        orElse: () => User());
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: Placeholder(),
      ),
      title: Text(sender.name),
      subtitle: Text(
        message.message,
        softWrap: true,
      ),
    );
  }
}

class MessageField extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    useProvider(messageFieldController);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: textController,
            onChanged: context.read(messageFieldController.notifier).onChange,
            decoration: InputDecoration(
                hintText: 'Message',
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0)),
            minLines: 1,
            maxLines: 5,
          ),
          TextButton(
              onPressed: () {
                context.read(messageFieldController.notifier).send();
                textController.clear();
              },
              child: Icon(Icons.send))
        ],
      ),
    );
  }
}
