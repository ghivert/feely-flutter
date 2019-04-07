import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  SearchBar({
    Key key,
    this.onSubmitted,
  });

  @override
  _SearchBarState createState() => _SearchBarState(onSubmitted: onSubmitted);
}

class _SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.search,
        color: Color.fromARGB(255, 171, 160, 246),
      ),
      padding: EdgeInsets.only(right: 12, left: 12),
    );
  }
}

class _TextInput extends StatefulWidget {
  final controller;
  final onSubmitted;
  final placeholder;

  _TextInput({
    Key key,
    @required this.controller,
    this.onSubmitted,
    this.placeholder,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState(placeholder: placeholder);
}

class _TextInputState extends State<_TextInput> {
  String placeholder;
  String _placeholder;

  _TextInputState({placeholder}) {
    this.placeholder = placeholder == null ? '' : placeholder;
    this._placeholder = this.placeholder;
  }

  void updatePlaceholder(value) {
    setState(() {
      if (widget.controller.text == '') {
        _placeholder = placeholder;
      } else {
        _placeholder = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Stack(
        children: [
          Text(
            _placeholder,
            style: TextStyle(
              color: Color.fromARGB(255, 211, 211, 211)
            ),
          ),
          EditableText(
            backgroundCursorColor: Colors.black,
            style: TextStyle(color: Colors.black87),
            controller: widget.controller,
            focusNode: FocusNode(),
            cursorColor: Colors.black38,
            onSubmitted: widget.onSubmitted,
            onChanged: updatePlaceholder,
          ),
        ],
      ),
    );
  }
}

class _SearchBarState extends State<SearchBar> {
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller = TextEditingController();

  _SearchBarState({this.onSubmitted});

  final BoxDecoration _searchBarStyle = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Color.fromARGB(255, 240, 240, 242)),
    borderRadius: BorderRadius.all(Radius.circular(2)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Container(
        decoration: _searchBarStyle,
        child: Row(
          children: [
            _SearchIcon(),
            Expanded(
              child: _TextInput(
                controller: controller,
                onSubmitted: onSubmitted,
                placeholder: 'Search conversations…',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
