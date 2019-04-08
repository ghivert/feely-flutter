import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../components/profile_picture.dart';
import '../styles.dart' as Styles;

const Faker faker = Faker();

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        faker.person.name(),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LastMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        faker.randomGenerator.string(50),
        style: TextStyle(
          color: Styles.lightGrey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class Date extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      faker.randomGenerator.boolean().toString(),
      style: TextStyle(
        color: Styles.lighterGrey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Styles.padding,
        right: Styles.padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Name(),
          Padding(padding: EdgeInsets.all(3)),
          LastMessage(),
        ],
      ),
    );
  }
}

final itemPadding = EdgeInsets.fromLTRB(
  Styles.bodyPadding,
  Styles.smallPadding,
  Styles.bodyPadding,
  Styles.smallPadding,
);

class Conversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: itemPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: ConversationPictureAndDetails()),
          Date(),
        ],
      ),
    );
  }
}

class ConversationPictureAndDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfilePicture(radius: Styles.messagesPictureRadius),
        Expanded(child: Details()),
      ],
    );
  }
}

class ConversationDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: itemPadding,
      child: Divider(),
    );
  }
}
