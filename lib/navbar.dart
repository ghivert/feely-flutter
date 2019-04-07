import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './components/profile_picture.dart';
import './elements.dart' as Elements;
import './styles.dart' as Styles;

const String CONVERSATIONS = 'Conversations';
const double iconSize = 40;

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize,
      width: iconSize,
      child: Center(
        child: Icon(Icons.notifications_none),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String value;

  Title({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(this.value, style: Styles.Title),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  Widget _layout({Widget child}) {
    return Elements.FullWidth(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [Styles.Shadow],
      ),
      child: Elements.safeArea(
        Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 9),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _layout(
      child: Row(
        children: [
          ProfilePicture(radius: iconSize),
          Title(value: CONVERSATIONS),
          NotificationButton(),
        ],
      ),
    );
  }
}
