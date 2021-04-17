import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/providers/current_user.dart';
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:charcoalchat/repositories/channel_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final channelList = StateNotifierProvider<ChannelList, List<Channel>>((ref) =>
    ChannelList(ref.watch(firebaseAppProvider), ref.watch(currentUser),
        ref.watch(channelRepository)));

class ChannelList extends StateNotifier<List<Channel>> {
  ChannelList(this._app, this._user, this._repository) : super([]) {
    if (_app == null || _user == null) return;
    _repository.joinedChannels(_user!).then((list) {
      if (mounted) {
        state = list ?? [];
      }
    });
  }
  final User? _user;
  final FirebaseApp? _app;
  final ChannelRepository _repository;
}
