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
      padding: const EdgeInsets.all(8),
      child: Container(
          constraints: const BoxConstraints(
            minWidth: 380,
            maxWidth: 380,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CupertinoColors.activeGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
