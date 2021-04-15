import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/providers/current_channel.dart';
import 'package:charcoalchat/providers/current_team.dart';
import 'package:charcoalchat/providers/current_user.dart';
import 'package:charcoalchat/repositories/message_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageList = StateNotifierProvider<MessageList, List<Message>>((ref)=> MessageList());

class MessageList extends StateNotifier<List<Message>> {
  MessageList(this._currentTeam, this._currentUser, this._currentChannel, this._repository): super([]);

  final  CurrentTeam _currentTeam;
  final CurrentUser _currentUser;
  final CurrentChannel _currentChannel;
  final MessageRepository _repository;


}