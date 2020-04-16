import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';

class UpdateNoteScreen {
  final BuildContext _context;
  final DocumentSnapshot _data;
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  UpdateNoteScreen(this._context,this._data);


  updateNoteDialog() {
    _noteController.text = _data.data['note'];
    _dateController.text = _data.data['date'];
    return showDialog(
      context: _context,
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
                _updateAddNote();
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

  _updateAddNote() {
    var noteData = {
      'note': _noteController.text.toString().trim(),
      'date': _dateController.text.toString().trim()
    };
    Firestore.instance
        .collection('notes').document(_data.documentID)
        .updateData(noteData)
        .then((result) {
      Navigator.of(_context).pop();
    })
        .catchError((error) {
          showToast("something went wrong");
    });
  }
}
