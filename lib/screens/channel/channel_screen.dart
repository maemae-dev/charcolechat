import 'package:flutter/material.dart';

class ChannelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => ListTile(
              leading: SizedBox(
                height: 40,
                width: 40,
                child: Placeholder(),
              ),
              title: Text('name'),
              subtitle: Text(
                'some comment aofjeiajwfoewiajfoaij afeioawjfeoiajfwjeo jfewoi',
                softWrap: true,
              ),
            ),
            itemCount: 10,
          )),
          Divider(),
          SafeArea(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'title',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0)),
              minLines: 1,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
