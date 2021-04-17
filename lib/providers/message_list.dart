import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/repositories/message_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageList =
    StateNotifierProvider.autoDispose<MessageList, List<Message>>((ref) {
  return MessageList(ref.watch(messageRepository));
});

class MessageList extends StateNotifier<List<Message>> {
  MessageList(this._repository) : super([]) {
    _repository.stream()?.listen((messages) {
      if (mounted) state = messages ?? [];
    });
  }

  final MessageRepository _repository;
}
