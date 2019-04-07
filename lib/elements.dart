import 'package:flutter/material.dart';
import 'dart:ui' as ui;

Widget mediaQueries(Widget child) {
  return MediaQuery(
    data: MediaQueryData.fromWindow(ui.window),
    child: child,
  );
}

Widget safeArea(Widget child) {
  return SafeArea(
    bottom: false,
    child: child,
  );
}

Widget directionality(Widget child) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: child,
  );
}

Widget whiteBackground(Widget child) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: child,
  );
}

Widget scaffold({BuildContext context, Widget child}) {
  return whiteBackground(
    mediaQueries(
      directionality(
        whiteBackground(
          child,
        ),
      ),
    ),
  );
}

class FullWidth extends StatelessWidget {
  final child;
  final decoration;
  final height;

  FullWidth({
    @required this.child,
    this.decoration,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.height,
      decoration: this.decoration,
      child: this.child,
    );
  }
}
