import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './navbar.dart';
import './body.dart';
import './elements.dart' as Elements;
import './styles.dart' as Styles;
import './routes/home_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(App());
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            debugPrint('test');
            Navigator.pushNamed(context, 'Second');
          },
        ),
      ),
    );
  }
}

class SlowPageRoute extends MaterialPageRoute {
  SlowPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState: true,
    bool fullscreenDialog: false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);
}

class App extends StatelessWidget {
  WidgetBuilder buildRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'First':
        return (BuildContext _) => FirstRoute();
      case 'Second':
        return (BuildContext _) => HomePage();
      default:
        throw Exception('Invalid Route: ${settings.name}');
    }
  }

  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return SlowPageRoute(
      builder: buildRoute(settings),
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Elements.Scaffold(
      child: Navigator(
        initialRoute: 'First',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
