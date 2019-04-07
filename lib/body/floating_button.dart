import 'package:flutter/material.dart';
import '../styles.dart' as Styles;

class FloatingButton extends StatelessWidget {
  void onPressed() {
    debugPrint('Pushed.');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(right: Styles.bodyPadding),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 131, 128, 252),
            onPressed: onPressed,
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
