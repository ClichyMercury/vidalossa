import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../coponents/alertDialog.dart';

Future<void> showExecptionALertDialog(
  BuildContext context, {
  required String title,
  required Exception exception,
}) =>
    showAlertDialog(context,
        title: title, content: _message(exception), defaultActionText: "OK");

String _message(Exception exception) {
  if (exception is FirebaseException) {
    return exception.message!;
  }
  return exception.toString();
}
