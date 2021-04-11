import 'package:flutter/material.dart';

class ChannelListScreen extends StatelessWidget {
  ChannelListScreen({Key? key, this.title, this.onTapButton}) : super(key: key);

  final String? title;
  final void Function()? onTapButton;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('# channel name'),
                  onTap: onTapButton,
                );
              },
              itemCount: 10,
            )),
          ],
        ),
      ),
    );
  }
}
