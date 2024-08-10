import 'package:flutter/cupertino.dart';

class DeleteNoteDialog extends StatefulWidget {
  const DeleteNoteDialog({super.key, required this.context});

  final BuildContext context;

  @override
  _DeleteNoteDialogState createState() => _DeleteNoteDialogState();
}

class _DeleteNoteDialogState extends State<DeleteNoteDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        title: const Text('Delete Note', style: TextStyle(fontSize: 18)),
        content: Container(
          margin: const EdgeInsets.only(top: 8),
          child: const Text('Are you sure you want to delete this note?',
              style: TextStyle(fontSize: 16)),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text(
              'Delete',
              style: TextStyle(color: CupertinoColors.destructiveRed),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                // Delete the note
              });
            },
          ),
        ]);
  }
}
