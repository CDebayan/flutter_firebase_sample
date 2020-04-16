import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  static const String routeName = "UploadImageScreen";
  @override
  _UploadImageScreenState createState() =>
      _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            button("Select Image", () async{
              var image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _selectedImage = image;
              });
            }),

            Expanded(
              child: Center(
                child: _selectedImage == null
                    ? Text('No image selected.')
                    : Image.file(_selectedImage),
              ),
            ),
            button("Upload Image", (){
                StorageUploadTask task = FirebaseStorage.instance.ref().child('myImage.jpg').putFile(_selectedImage);
            }),
          ],
        ),
      ),
    );
  }
}