import 'package:charcoalchat/screens/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends Page {
  SignupPage(this.projectId);
  final String projectId;

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => SignupScreen(projectId),
    );
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen(this.projectId);
  final String projectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('signup for $projectId'),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onChanged: context
                      .read(signupController(projectId).notifier)
                      .onChangeEmail,
                  decoration: InputDecoration(hintText: 'email'),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: context
                      .read(signupController(projectId).notifier)
                      .onChangePassword,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  onChanged: context
                      .read(signupController(projectId).notifier)
                      .onChangeName,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                ElevatedButton(
                    onPressed: context
                        .read(signupController(projectId).notifier)
                        .onSubmit,
                    child: Text("Signup"))
              ],
            ),
          ),
        ));
  }
}
