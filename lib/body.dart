import 'package:flutter/material.dart';
import './components/search_bar.dart';
import './body/conversation.dart';
import './body/floating_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String content = '';

  void _searchBarSubmitted(value) {
    setState(() {
      content = value;
    });
  }

  Widget _itemBuilder(context, index) {
    if (index == 0) {
      return SearchBar(
        onSubmitted: (value) {
          _searchBarSubmitted(value);
        },
        initValue: content,
      );
    } else if (index % 2 == 0) {
      return ConversationDivider();
    } else {
      return Conversation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.black87,
        ),
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: false,
              itemBuilder: _itemBuilder,
            ),
            FloatingButton(),
          ],
        ),
      ),
    );
  }
}
