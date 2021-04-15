// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    message: json['message'] as String? ?? '',
    senderId: json['senderId'] as String? ?? '',
    createdAt: toDateTime(json['createdAt'] as Timestamp?),
    updatedAt: toDateTime(json['updatedAt'] as Timestamp?),
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'message': instance.message,
      'senderId': instance.senderId,
      'createdAt': toTimestamp(instance.createdAt),
      'updatedAt': toTimestamp(instance.updatedAt),
    };
