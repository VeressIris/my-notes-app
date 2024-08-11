import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/widgets/note.dart';
import 'package:my_notes_app/widgets/tag.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  List<String> tags = ['tag1', 'tag2', 'tag3 haha long', 'physics', 'quotes'];

  final List<Map<String, String>> notes = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Tags'),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              Wrap(
                  spacing: 5,
                  direction: Axis.horizontal,
                  children: tags.map((tag) => Tag(name: tag)).toList()),
              Column(
                children: notes.map((note) {
                  return Note(
                    title: note['title']!,
                    content: note['content']!,
                    dateCreated: note['dateCreated']!,
                    tags: note['tags'] ?? 'No tags',
                  );
                }).toList(),
              ),
            ],
          ),
        ))));
  }
}
