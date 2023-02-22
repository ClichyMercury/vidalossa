import 'package:flutter/material.dart';

import '../auth/landing_page.dart';

Future resetPasswordCustumAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.warning,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            content,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          actions: [
            if (cancelActionText != null)
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelActionText),
              ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => LandingPage())),
              child: Text(defaultActionText),
            ),
          ],
        );
      });
}
