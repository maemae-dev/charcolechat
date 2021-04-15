import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final channelRepository =
    Provider((ref) => ChannelRepository(ref.watch(firebaseAppProvider)));

class ChannelRepository {
  ChannelRepository(FirebaseApp? _app)
      : _db = _app != null ? FirebaseFirestore.instanceFor(app: _app) : null;
  final FirebaseFirestore? _db;
  CollectionReference? get _ref => _db?.collection('channels');

  Future<List<Channel>?> joinedChannels(User user) async {
    // final belongs = await FirebaseFirestore.instanceFor(app: app)
    //     .collectionGroup('members')
    //     .where('uid', isEqualTo: user.id)
    //     .get();
    // print(belongs);

    // final belongChannelIds =
    //     belongs.docs.map((doc) => doc.reference.parent.parent?.id).toList();
    // final snap = await FirebaseFirestore.instanceFor(app: app)
    //     .collection('channels')
    //     .where('id', whereIn: belongChannelIds)
    //     .get();
    //
    final snap = await _ref?.get();

    return snap?.docs.map((doc) => Channel.fromJson(doc.data())).toList();
  }

  Future create(Channel channel) async {
    return _ref?.doc(channel.id).set(channel.toJson());
  }

  String? newId() {
    return _ref?.doc().id;
  }
}
