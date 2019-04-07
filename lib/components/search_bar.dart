import 'package:flutter/material.dart';
import '../styles.dart' as Styles;

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSubmitted;
  final String initValue;

  SearchBar({
    Key key,
    this.onSubmitted,
    this.initValue,
  });

  @override
  _SearchBarState createState() {
    return _SearchBarState(
      onSubmitted: onSubmitted,
      initValue: initValue,
    );
  }
}

class _SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.search,
        color: Color.fromARGB(255, 171, 160, 246),
      ),
      padding: EdgeInsets.only(right: Styles.padding, left: Styles.padding),
    );
  }
}

class _TextInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final String placeholder;
  final String initValue;

  _TextInput({
    Key key,
    @required this.controller,
    this.onSubmitted,
    this.placeholder,
    this.initValue,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState(
        placeholder: placeholder,
        initValue: initValue,
      );
}

class _TextInputState extends State<_TextInput> {
  final String initValue;
  String placeholder;
  String _placeholder;

  bool _isInitialized() {
    return initValue != null && initValue != '';
  }

  String _computeFinalPlaceholder(String placeholder) {
    final bool isNull = placeholder == null;
    if (isNull || _isInitialized()) {
      return '';
    } else {
      return placeholder;
    }
  }

  _TextInputState({placeholder, this.initValue}) {
    final String finalPlaceholder = _computeFinalPlaceholder(placeholder);
    this.placeholder = finalPlaceholder;
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
      padding: EdgeInsets.all(Styles.padding),
      child: Stack(
        children: [
          Text(
            _placeholder,
            style: TextStyle(
              color: Styles.lighterGrey,
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
  final String initValue;
  TextEditingController controller;

  _SearchBarState({this.onSubmitted, @required this.initValue}) {
    controller = TextEditingController(text: initValue);
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
          children: [
            _SearchIcon(),
            Expanded(
              child: _TextInput(
                initValue: initValue,
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
