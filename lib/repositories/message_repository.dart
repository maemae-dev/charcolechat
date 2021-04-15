import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/entities/message/message.dart';
import 'package:charcoalchat/providers/current_channel.dart';
import 'package:charcoalchat/providers/firebase_app_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageRepository = Provider((ref) => MessageRepository(
    ref.watch(firebaseAppProvider), ref.watch(currentChannel)));

class MessageRepository {
  MessageRepository(FirebaseApp? _app, this._channel)
      : _db = _app != null ? FirebaseFirestore.instanceFor(app: _app) : null;
  final FirebaseFirestore? _db;
  final Channel? _channel;

  CollectionReference? get _ref =>
      _db?.collection('channels').doc(_channel?.id).collection('messages');

  Future<List<Message>?> list() async {
    return (await _ref?.get())
        ?.docs
        .map((doc) => Message.fromJson(doc.data()))
        .toList();
  }

  Future<DocumentReference>? create(Message message) {
    return _ref?.add(message.toJson());
  }
}
