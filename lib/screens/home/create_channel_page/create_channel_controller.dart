import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:charcoalchat/repositories/channel_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createChannelController =
    StateNotifierProvider.autoDispose<CreateChannelController, Channel>((ref) {
  return CreateChannelController(
      ref.watch(firebaseAppProvider)!, ref.watch(channelRepository));
});

class CreateChannelController extends StateNotifier<Channel> {
  CreateChannelController(this._app, this._repository)
      : super(Channel(id: _repository.newId(_app), teamId: _app.name));
  final FirebaseApp _app;
  final ChannelRepository _repository;

  void onChangeName(String value) {
    state = state.copyWith(name: value);
  }

  Future create() {
    return _repository.create(_app, state);
  }
}
