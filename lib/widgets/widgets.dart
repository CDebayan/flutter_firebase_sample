import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


button(title, onPressed) {
  return RaisedButton(
    child: Text(title),
    onPressed: onPressed,
  );
}

inputTextField(hint, controller) {
  return TextField(
    decoration: InputDecoration(hintText: hint),
    controller: controller,
  );
}

showToast(message){
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

