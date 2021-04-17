import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './channel_list/channel_list_screen.dart';
import './team_list/team_list_screen.dart';

class HomeScreen extends HookWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChannelListScreen(),
      drawer: TeamListScreen(),
    );

    // Column(
    //   children: [
    //     Expanded(
    //         child: PageView(
    //       controller: controller,
    //       children: pages,
    //       onPageChanged: (index) {
    //         context.read(pageIndexProvider).state = index;
    //       },
    //     )),
    //     _PageIndicator(pages.length),
    //   ],
    // ),
  }
}
