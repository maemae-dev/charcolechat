import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/entities/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final channelRepository = Provider((ref) => ChannelRepository());

class ChannelRepository {
  Future<List<Channel>> joinedChannels(FirebaseApp app, User user) async {
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
    final snap = await FirebaseFirestore.instanceFor(app: app)
        .collection('channels')
        .get();

    return snap.docs.map((doc) => Channel.fromJson(doc.data())).toList();
  }

  Future create(FirebaseApp app, Channel channel) async {
    return FirebaseFirestore.instanceFor(app: app)
        .collection('channels')
        .doc(channel.id)
        .set(channel.toJson());
  }

  String newId(FirebaseApp app) {
    return FirebaseFirestore.instanceFor(app: app)
        .collection('channels')
        .doc()
        .id;
  }
}
