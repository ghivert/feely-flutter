import 'package:flutter/material.dart';
import '../navbar.dart';
import '../body.dart';
import '../elements.dart' as Elements;
import '../styles.dart' as Styles;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Elements.Scaffold(
      child: Container(
        decoration: BoxDecoration(color: Styles.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
