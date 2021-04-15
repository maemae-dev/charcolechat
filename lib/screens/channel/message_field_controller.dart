import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/providers/current_user.dart';
import 'package:charcoalchat/repositories/message_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageFieldController =
    StateNotifierProvider<MessageFieldController, Message>((ref) =>
        MessageFieldController(
            ref.watch(currentUser), ref.watch(messageRepository)));

class MessageFieldController extends StateNotifier<Message> {
  MessageFieldController(User? user, this._repository)
      : super(Message(
          senderId: user?.id ?? '',
        ));
  final MessageRepository _repository;

  void onChange(String value) {
    state = state.copyWith(message: value);
  }

  Future send() async {
    return await _repository.create(state.copyWith(createdAt: DateTime.now()));
  }
}
