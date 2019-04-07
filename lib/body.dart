import 'package:flutter/material.dart';
import './components/search_bar.dart';

class Message extends StatelessWidget {
  final index;

  Message({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'test $index',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String content = '';

  void _searchBarSubmitted(value) {
    debugPrint(value);
    setState(() {
      content = value;
    });
  }

  Widget _itemBuilder(context, index) {
    return index == 0
      ? SearchBar(onSubmitted: _searchBarSubmitted)
      : Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
