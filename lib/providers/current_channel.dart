import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentChannel =
    StateNotifierProvider<CurrentChannel, Channel?>((ref) => CurrentChannel());

class CurrentChannel extends StateNotifier<Channel?> {
  CurrentChannel() : super(null) {
    // TODO: set team that watched last from shared_preference.
  }

  void selectChannel(Channel channel) {
    state = channel;
  }
}
