import 'package:flutter/cupertino.dart';

class MyDialog extends StatefulWidget {
  const MyDialog(
      {super.key,
      required this.context,
      required this.onPressed,
      required this.title,
      required this.description,
      required this.confirmText});

  final String title;
  final String description;
  final String confirmText;
  final BuildContext context;
  final Function onPressed;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        title: Text(widget.title, style: TextStyle(fontSize: 18)),
        content: Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(widget.description, style: TextStyle(fontSize: 16)),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: Text(
              widget.confirmText,
              style: const TextStyle(color: CupertinoColors.destructiveRed),
            ),
            onPressed: () {
              widget.onPressed();
            },
          ),
        ]);
  }
}
