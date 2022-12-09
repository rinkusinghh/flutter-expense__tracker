import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  // const AdaptiveFlatButton({super.key});
  final String text;
  final Function handler;

  AdaptiveFlatButton(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.blue,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: null)
        : TextButton(
            onPressed: null,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          );
  }
}
