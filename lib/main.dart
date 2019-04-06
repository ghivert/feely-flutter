import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './navbar.dart';
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
      child: Elements.FullHeight(
        decoration: BoxDecoration(color: Styles.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),
            MessageList(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('test', style: TextStyle(color: Colors.black))
    );
  }
}

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: false,
          children: List(10).map((_) => SearchBar()).toList(),
        ),
      ),
    );
  }
}
