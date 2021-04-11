// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    message: json['message'] as String? ?? '',
    senderId: json['senderId'] as String? ?? '',
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'message': instance.message,
      'senderId': instance.senderId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
