import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './navbar.dart';
import './body.dart';
import './elements.dart' as Elements;
import './styles.dart' as Styles;

void main() {
  debugPaintSizeEnabled = false;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Elements.scaffold(
      context: context,
      child: Container(
        decoration: BoxDecoration(color: Styles.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),
            Expanded(
              child: Body(),
            )
          ],
        ),
      ),
    );
  }
}
