
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';

class AddNoteScreen {
  final BuildContext context;
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  AddNoteScreen(this.context);

  addNoteDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                inputTextField('Note', _noteController),
                inputTextField('Date', _dateController),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Done'),
              onPressed: () {
                _initAddNote();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _initAddNote() {
    var noteData = {
      'note': _noteController.text.toString().trim(),
      'date': _dateController.text.toString().trim()
    };
    Firestore.instance
        .collection('notes')
        .add(noteData)
        .then((result) {
      Navigator.of(context).pop();
    })
        .catchError((error) {
          showToast("something went wrong");
    });
  }
}
