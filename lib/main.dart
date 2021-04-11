import 'dart:io';

import 'package:charcoalchat/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    await Firebase.initializeApp();
  }

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
