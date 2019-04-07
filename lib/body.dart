import 'package:flutter/material.dart';
import './components/search_bar.dart';
import './body/conversation.dart';
import './styles.dart' as Styles;

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
    if (index == 0) {
      return SearchBar(
        onSubmitted: _searchBarSubmitted,
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
            SafeArea(
              bottom: true,
              top: false,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: Styles.bodyPadding),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 131, 128, 252),
                    onPressed: () {
                      debugPrint('Pushed');
                    },
                    child: Icon(
                      Icons.add,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
