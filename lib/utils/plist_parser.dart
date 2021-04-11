import 'dart:io';

import 'package:flutter/services.dart';

class PlistParser {
  static final channel = MethodChannel('plistparser.maemae.dev/plistparser');

  static Future<Map<dynamic, dynamic>?> parseFromPath(String path) async {
    if (!Platform.isIOS) {
      throw UnimplementedError();
    }
    final result =
        await channel.invokeMapMethod('parse', <String, dynamic>{'path': path});
    return result;
  }
}
