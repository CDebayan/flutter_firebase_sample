import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/crud/update_note_screen.dart';
import 'add_note_screen.dart';


class NoteListScreen extends StatelessWidget {
  static const String routeName = "NoteList";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          AddNoteScreen(context).addNoteDialog();
        },
      ),
      body: SafeArea(child: initNoteList()),
    );
  }

  ///For fetching list when triggered
//  initNoteList() {
//    return FutureBuilder(
//      future: Firestore.instance.collection('notes').getDocuments(),
//      builder: (BuildContext context, AsyncSnapshot snapshot) {
//        if (snapshot.data != null) {
//          return _childNoteItem(snapshot.data);
//        } else {
//          return Container();
//        }
//      },
//    );
//  }

  ///For Live Updates
  initNoteList() {
    return StreamBuilder(
      stream: Firestore.instance.collection('notes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return _childNoteItem(snapshot.data);
        } else {
          return Container();
        }
      },
    );
  }

  _childNoteItem(QuerySnapshot querySnapshot) {
    return ListView.builder(
        itemCount: querySnapshot.documents.length,
        itemBuilder: (context, index) {
          var data = querySnapshot.documents[index];
          return InkWell(
            onTap: () {
              UpdateNoteScreen(context, data).updateNoteDialog();
            },
            onLongPress: () {
              _initDeleteNote(data.documentID);
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Note : ${data.data['note']}"),
                    Text("Date : ${data.data['date']}"),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _initDeleteNote(documentId) {
    Firestore.instance.collection('notes').document(documentId).delete();
  }
}
