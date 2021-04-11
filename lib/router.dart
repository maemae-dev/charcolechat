import 'package:charcoalchat/entities/channel/channel.dart';
import 'package:charcoalchat/entities/team/team.dart';
import 'package:charcoalchat/screens/channel/channel_screen.dart';
import 'package:charcoalchat/screens/home/home.dart';
import 'package:charcoalchat/screens/login/login_screen.dart';
import 'package:charcoalchat/screens/registration/registration_screen.dart';
import 'package:charcoalchat/screens/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoutePath {
  final Channel? currentChannel;
  final Team? currentTeam;
  final bool isUnknown;

  ChatRoutePath.teams()
      : currentTeam = null,
        currentChannel = null,
        isUnknown = false;

  ChatRoutePath.channels(String currentChannelId)
      : currentChannel = Channel(
          id: currentChannelId,
        ),
        currentTeam = null,
        isUnknown = false;

  ChatRoutePath.unknown()
      : currentTeam = null,
        currentChannel = null,
        isUnknown = true;

  bool get isHomePage => currentTeam == null;

  bool get isChannelDetailsPage =>
      currentTeam != null && currentChannel != null;
}

class MyRouteInformationParser extends RouteInformationParser<ChatRoutePath> {
  @override
  Future<ChatRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    // '/'
    if (uri.pathSegments.length == 0) {
      return ChatRoutePath.teams();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return ChatRoutePath.unknown();
      final id = uri.pathSegments[1];
      if (id == null) return ChatRoutePath.unknown();
      return ChatRoutePath.channels(id);
    }

    return ChatRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(ChatRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isChannelDetailsPage) {
      return RouteInformation(location: '/book/${path.currentChannel?.id}');
    }
    return RouteInformation(location: '/');
  }
}

final routerProvider = ChangeNotifierProvider((ref) => MyRouterDelegate());

class MyRouterDelegate extends RouterDelegate<ChatRoutePath>
    with ChangeNotifier {
  bool secondPage = false;
  bool addTeamPage = false;
  bool authPage = false;
  bool login = false;
  String? signupFor;

  void toDetailPage() {
    secondPage = true;
    notifyListeners();
  }

  void addTeam() {
    addTeamPage = true;
    notifyListeners();
  }

  void toSignup(String projectId) {
    authPage = true;
    login = false;
    signupFor = projectId;
    notifyListeners();
  }

  void toLogin() {
    authPage = true;
    login = true;
    notifyListeners();
  }

  void loginComplete() {
    authPage = false;
    login = false;
    addTeamPage = false;
    notifyListeners();
  }

  @override
  ChatRoutePath? get currentConfiguration {
    return secondPage ? ChatRoutePath.channels('aaaa') : ChatRoutePath.teams();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: HomeScreen(),
        ),
        if (secondPage) MaterialPage(child: ChannelScreen()),
        if (addTeamPage) RegistrationPage(),
        if (authPage) login ? LoginPage() : SignupPage(signupFor ?? '')
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (authPage) {
          secondPage = false;
          addTeamPage = true;
          authPage = false;
          signupFor = null;
          notifyListeners();
          return true;
        }
        secondPage = false;
        addTeamPage = false;
        authPage = false;
        signupFor = null;
        login = false;
        notifyListeners();
        return true;
      },
      // onPopPage: (context, route) {},
    );
  }

  @override
  Future<bool> popRoute() async {
    // TODO: implement popRoute
    //

    return true;
  }

  @override
  Future<void> setNewRoutePath(ChatRoutePath configuration) async {}
}
