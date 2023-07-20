import 'package:flutter/material.dart';

class PopupMessage extends StatelessWidget {
  final String message;
  final VoidCallback onSubmit;
  PopupMessage({required this.message, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: EdgeInsets.all(0.0),
      title: Text(
        message,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      content: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              child: Text('OK'), textColor: Colors.black, onPressed: onSubmit),
        ],
      ),
    );
  }
}
