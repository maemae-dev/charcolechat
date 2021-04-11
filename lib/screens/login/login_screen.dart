import 'package:charcoalchat/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'email'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'password'),
          ),
          ElevatedButton(
              onPressed: () {
                final loggedin = true;
                if (loggedin) {
                  context.read(routerProvider).loginComplete();
                }
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
