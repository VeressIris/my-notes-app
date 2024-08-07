import 'package:flutter/cupertino.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8), // Adjust padding as needed
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 70,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CupertinoListTile(
          title: Text(widget.title),
          subtitle: Text(widget.content),
          trailing: Text(widget.dateCreated),
          padding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
