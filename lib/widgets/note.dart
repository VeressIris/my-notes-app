import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/pages/note_page.dart';

class Note extends StatefulWidget {
  const Note(
      {super.key,
      required this.title,
      required this.content,
      required this.dateCreated});

  final String title;
  final String content;
  final String dateCreated;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
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
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) =>
                    NotePage(title: widget.title, content: widget.content)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            constraints: const BoxConstraints(
              minWidth: 395,
              maxWidth: 395,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: CupertinoColors.darkBackgroundGray,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title.isNotEmpty)
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(
                  widget.content,
                  style: TextStyle(
                      color: widget.title.isEmpty
                          ? CupertinoColors.white
                          : CupertinoColors.systemGrey,
                      fontSize: widget.title.isEmpty ? 18 : 16,
                      fontWeight: widget.title.isEmpty
                          ? FontWeight.bold
                          : FontWeight.normal,
                      height: 1.5,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  widget.dateCreated,
                  style: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 16,
                      height: 1.35),
                ),
              ],
            ),
          )),
    );
  }
}
