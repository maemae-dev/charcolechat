import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyRouteInformationParser extends RouteInformationParser<ChatRoutePath> {
  @override
  Future<ChatRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    // '/'
    if (uri.pathSegments.length == 0) {
      return ChatRoutePath.home();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return ChatRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return ChatRoutePath.unknown();
      return ChatRoutePath.details(id);
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
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return RouteInformation(location: '/');
  }
}

class MyRouterDelegate extends RouterDelegate<ChatRoutePath>
    with ChangeNotifier {
  bool secondPage = false;

  @override
  ChatRoutePath? get currentConfiguration {
    return secondPage ? ChatRoutePath.details(1) : ChatRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: MyHomePage(
            title: 'Flutter Demo Home Page',
            onTapButton: () {
              secondPage = true;
              notifyListeners();
            },
          ),
        ),
        if (secondPage) MaterialPage(child: SecondPage())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        secondPage = false;
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
  Future<void> setNewRoutePath(ChatRoutePath configuration) async {
    print(configuration.id);
  }
}

class ChatRoutePath {
  final int? id;
  final bool isUnknown;

  ChatRoutePath.home()
      : id = null,
        isUnknown = false;

  ChatRoutePath.details(this.id) : isUnknown = false;

  ChatRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title, this.onTapButton}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;
  final Function()? onTapButton;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  widget.onTapButton!();
                },
                child: Text('To Second Page')),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('second page'),
      ),
    );
  }
}
