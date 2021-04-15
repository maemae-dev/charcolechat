import 'package:charcoalchat/entities/json_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    @Default('') String message,
    @Default('') String senderId,
    @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? createdAt,
    @JsonKey(toJson: toTimestamp, fromJson: toDateTime) DateTime? updatedAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
