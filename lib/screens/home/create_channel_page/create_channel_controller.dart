import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/repositories/channel_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createChannelController =
    StateNotifierProvider.autoDispose<CreateChannelController, Channel>((ref) {
  return CreateChannelController(ref.watch(channelRepository));
});

class CreateChannelController extends StateNotifier<Channel> {
  CreateChannelController(this._repository)
      : super(Channel(id: _repository.newId() ?? ''));
  final ChannelRepository _repository;

  void onChangeName(String value) {
    state = state.copyWith(name: value);
  }

  Future create() {
    return _repository.create(state);
  }
}
