import 'package:charcoalchat/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './channel_list/channel_list_screen.dart';
import './team_list/team_list_screen.dart';

final pageIndexProvider = StateProvider<int>((ref) => 1);

class HomeScreen extends HookWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    final controller = usePageController(initialPage: 1);
    final pages = [
      TeamListScreen(
        onTapTeam: () {
          controller.animateToPage(1,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
      ),
      ChannelListScreen(
        onTapButton: context.read(routerProvider.notifier).toDetailPage,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: controller,
            children: pages,
            onPageChanged: (index) {
              context.read(pageIndexProvider).state = index;
            },
          )),
          _PageIndicator(pages.length),
        ],
      ),
    );
  }
}

class _PageIndicator extends HookWidget {
  _PageIndicator(this.length);
  final int length;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useProvider(pageIndexProvider).state;
    return Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Wrap(
          spacing: 8.0,
          children: List.generate(
            length,
            (index) => Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: currentIndex == index ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ));
  }
}
