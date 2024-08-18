import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/pages/note_page.dart';
import 'package:my_notes_app/widgets/my_dialog.dart';
import 'package:my_notes_app/widgets/note_data.dart';

class Note extends StatefulWidget {
  const Note(
      {super.key,
      required this.title,
      required this.content,
      required this.dateCreated,
      required this.tags});

  final String title;
  final String content;
  final String dateCreated;
  final String tags; // TODO: change this to a list of strings

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showCupertinoDialog(
          context: context,
          builder: (context) => MyDialog(
                title: 'Delete Note',
                description: 'Are you sure you want to delete this note?',
                confirmText: 'Delete',
                context: context,
                onPressed: () {
                  Navigator.pop(context); // get out of dialog
                  Navigator.pop(context); // go back to previous page
                  setState(() {
                    // Delete the note
                  });
                },
              )),
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => NotePage(
                    title: widget.title,
                    content: widget.content,
                    dateCreated: widget.dateCreated,
                    tags: widget.tags)));
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
                NoteData(
                  dateCreated: widget.dateCreated,
                  tags: widget.tags,
                  showAdd: false,
                  showBorder: true,
                )
              ],
            ),
          )),
    );
  }
}
