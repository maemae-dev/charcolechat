import 'dart:convert';
import 'dart:io';

import 'package:charcoalchat/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    await Firebase.initializeApp();
  }
  final shared = await SharedPreferences.getInstance();
  final projectIds = shared.getStringList('projectIds');
  final options = projectIds
      ?.map((id) => shared.getString(id))
      .where((encoded) => encoded != null)
      .map((encoded) => json.decode(encoded!) as Map<String, dynamic>);
  if (options != null)
    Future.forEach(
      options,
      (Map<String, dynamic> option) async => await Firebase.initializeApp(
        name: option['projectId'],
        options: FirebaseOptions.fromMap(option),
      ),
    );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final router = useProvider(routerProvider);
    return MaterialApp.router(
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: router,
      title: 'Charcole Chat',
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData.dark(),
    );
  }
}
