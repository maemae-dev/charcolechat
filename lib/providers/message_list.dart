import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/entities/team/team.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/providers/current_channel.dart';
import 'package:charcoalchat/providers/current_team.dart';
import 'package:charcoalchat/providers/current_user.dart';
import 'package:charcoalchat/repositories/message_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageList = StateNotifierProvider<MessageList, List<Message>>((ref) {
  return MessageList(ref.watch(messageRepository));
});

class MessageList extends StateNotifier<List<Message>> {
  MessageList(this._repository) : super([]) {
    _repository.list().then((messages) {
      if (mounted) state = messages ?? [];
    });
  }

  final MessageRepository _repository;
}
