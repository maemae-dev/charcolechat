import 'dart:convert';
import 'dart:io';

import 'package:charcoalchat/router.dart';
import 'package:charcoalchat/utils/plist_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends Page {
  RegistrationPage();

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (context) => RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      if (Platform.isIOS) {
                        final pikedFiles = await FilePicker.platform
                            .pickFiles(type: FileType.any);
                        final files =
                            pikedFiles?.files.map((file) => File(file.path!));
                        if (files?.length != 1) return;
                        final file = files!.first;
                        final data = await PlistParser.parseFromPath(file.path);
                        if (data == null) return;
                        final shared = await SharedPreferences.getInstance();
                        final projectIds =
                            shared.getStringList('projectIds') ?? [];
                        final projectId = data["PROJECT_ID"] as String;
                        final projects = projectIds.contains(projectId)
                            ? projectIds
                            : [...projectIds, projectId];
                        shared.setStringList('projectIds', projects);

                        // TODO: Add team

                        // final webCredentials = {
                        //   "apiKey": "",
                        //   "authDomain": "",
                        //   "projectId": "",
                        //   "storageBucket": "",
                        //   "messagingSenderId": "",
                        //   "appId": "",
                        // };
                        //

                        final iosCredentials = {
                          "apiKey": data['API_KEY'],
                          "projectId": data["PROJECT_ID"],
                          "storageBucket": data["STORAGE_BUCKET"],
                          "messagingSenderId": data["GCM_SENDER_ID"],
                          "appId": data["GOOGLE_APP_ID"],
                          "iosBundleId": data["BUNDLE_ID"],
                          "iosClientId": data["CLIENT_ID"]
                        };

                        shared.setString(
                            projectId, json.encode(iosCredentials));
                        if (!Firebase.apps
                            .any((app) => app.name != projectId)) {
                          final firebaseOption =
                              FirebaseOptions.fromMap(iosCredentials);
                          await Firebase.initializeApp(
                              name: projectId, options: firebaseOption);
                          print(Firebase.apps);
                        }
                        context.read(routerProvider).toSignup(projectId);
                      }
                    },
                    child: Text('Pick GoogleInfo-Service.plist')),
                // ElevatedButton(
                //   onPressed: context.read(routerProvider).toSignup,
                //   child: Text('Signup'),
                // ),
                ElevatedButton(
                  onPressed: context.read(routerProvider).toLogin,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
