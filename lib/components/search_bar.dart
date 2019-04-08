import 'package:flutter/material.dart';
import '../styles.dart' as Styles;

class _SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.search,
        color: Color.fromARGB(255, 171, 160, 246),
      ),
      padding: EdgeInsets.only(
        right: Styles.padding,
        left: Styles.padding,
      ),
    );
  }
}

class _TextInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final FocusNode focusNode = FocusNode();
  final String placeholder;
  final String initValue;

  _TextInput({
    Key key,
    @required this.controller,
    this.onSubmitted,
    this.placeholder,
    @required this.initValue,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
  String placeholder;

  bool _isInitialized() {
    final initValueNotNull = widget.initValue != null;
    final initValueNotEmpty = widget.initValue != '';
    return initValueNotNull && initValueNotEmpty;
  }

  String _computeFinalPlaceholder() {
    final bool isNull = widget.placeholder == null;
    if (isNull || _isInitialized()) {
      return '';
    } else {
      return widget.placeholder;
    }
  }

  @override
  void initState() {
    super.initState();
    placeholder = _computeFinalPlaceholder();
  }

  void updatePlaceholder(value) {
    setState(() {
      if (widget.controller.text == '') {
        placeholder = widget.placeholder;
      } else {
        placeholder = '';
      }
    });
  }

  void onSubmitted(value) {
    widget.focusNode.unfocus();
    widget.onSubmitted(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Styles.padding),
      child: Stack(
        children: <Widget>[
          Text(
            placeholder,
            style: TextStyle(
              color: Styles.lighterGrey,
            ),
          ),
          EditableText(
            backgroundCursorColor: Colors.black,
            style: TextStyle(color: Colors.black87),
            controller: widget.controller,
            focusNode: widget.focusNode,
            cursorColor: Colors.black38,
            onSubmitted: onSubmitted,
            onChanged: updatePlaceholder,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSubmitted;
  final String initValue;

  SearchBar({
    Key key,
    this.onSubmitted,
    this.initValue,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initValue);
  }

  final BoxDecoration _searchBarStyle = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Color.fromARGB(255, 240, 240, 242)),
    borderRadius: BorderRadius.all(Radius.circular(2)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Styles.bodyPadding),
      child: Container(
        decoration: _searchBarStyle,
        child: Row(
          children: <Widget>[
            _SearchIcon(),
            Expanded(
              child: _TextInput(
                initValue: widget.initValue,
                controller: controller,
                onSubmitted: widget.onSubmitted,
                placeholder: 'Search conversations…',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
