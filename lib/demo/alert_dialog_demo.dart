import 'package:flutter/material.dart';
import 'dart:async';

enum Actiton {
  Ok,
  Cancel,
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future _openAlert() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, Actiton.Cancel);
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context, Actiton.Ok);
              },
            ),
          ],
        );
      },
    );

    switch (action) {
      case Actiton.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Actiton.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is $_choice'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlert,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
