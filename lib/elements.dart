import 'package:flutter/material.dart';
import 'dart:ui' as ui;

abstract class ChildComponent extends StatelessWidget {
  final Widget child;
  ChildComponent({Key key, this.child}) : super(key: key);
}

class MediaQueries extends ChildComponent {
  MediaQueries({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(ui.window),
      child: child,
    );
  }
}

class TopSafeArea extends ChildComponent {
  TopSafeArea({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: child,
    );
  }
}

class LeftToRight extends ChildComponent {
  LeftToRight({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}

class WhiteBackground extends ChildComponent {
  WhiteBackground({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: child,
    );
  }
}

class Scaffold extends ChildComponent {
  Scaffold({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return WhiteBackground(
      child: MediaQueries(
        child: LeftToRight(
          child: child,
        ),
      ),
    );
  }
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
