import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double radius;

  ProfilePicture({Key key, @required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url = 'https://lorempixel.com/400/400/people';
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
