import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'channel.freezed.dart';
part 'channel.g.dart';

@freezed
abstract class Channel with _$Channel {
  const factory Channel({
    @Default('') String id,
   @Default('') String teamId,
    @Default('') String name,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}
