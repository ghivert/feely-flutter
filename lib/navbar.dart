import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import './elements.dart' as Elements;
import './styles.dart' as Styles;

const Faker faker = Faker();

const double radius = 40;

const String CONVERSATIONS = 'Conversations';

const TitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.3,
);

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url = 'https://lorempixel.com/400/400/people';
    return Container(
      child: ClipOval(
        child: Image.network(url,
          fit: BoxFit.cover,
          height: radius,
          width: radius,
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      child: Center(
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final value;

  Title({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(this.value, style: TitleStyle),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  Widget _layout({Widget child}) {
    return Elements.FullWidth(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [Styles.shadow],
      ),
      child: Elements.safeArea(
        Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 9),
          child: child,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _layout(
      child: Row(
        children: [
          ProfilePicture(),
          Title(value: CONVERSATIONS),
          HomeButton(),
        ],
      ),
    );
  }
}
