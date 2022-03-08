import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;
  const ButtonWidget({Key? key, required this.text, required this.onClicked, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
      shape: StadiumBorder(),
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      textColor: Colors.white,
      onPressed: onClicked,
    );
  }
}