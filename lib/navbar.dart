import 'package:flutter/material.dart';
import './elements.dart' as Elements;
import './styles.dart' as Styles;

class Navbar extends StatelessWidget {
  Widget _layout({ Widget child }) {
    return Elements.FullWidth(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [ Styles.shadow ],
      ),
      child: Elements.safeArea(child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _layout(
      child: Text(
        'Test',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
