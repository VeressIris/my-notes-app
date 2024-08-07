import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/widgets/note.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final List<Map<String, String>> notes = [
    {
      'title': 'My first note',
      'content': 'This is the content of my first note',
      'dateCreated': '2022-01-01'
    },
    {
      'title': 'My second note',
      'content': 'This is the content of my second note',
      'dateCreated': '2022-01-02'
    },
    {
      'title': 'My third note',
      'content': 'This is the content of my third note',
      'dateCreated': '2022-01-03'
    },
    {
      'title': 'My whatever note',
      'content': 'This is the content of a note',
      'dateCreated': '2022-01-04'
    },
    {
      'title': '',
      'content': 'This is the content of my second whatever note',
      'dateCreated': '2022-01-04'
    },
    {
      'title': 'My second whatever note',
      'content': 'This is the content of my second whatever note blah blah',
      'dateCreated': '2022-01-04'
    },
    {
      'title': 'My second whatever note',
      'content':
          'This is the content of my second whatever note BLAH BLAH BLAH BLAH',
      'dateCreated': '2022-01-04'
    },
    {
      'title': 'My note',
      'content': 'This is the content of this note ahahahahaha',
      'dateCreated': '2022-01-04'
    },
    {
      'title': 'My second whatever note',
      'content': 'This is the content of my second whatever note',
      'dateCreated': '2022-01-04'
    },
    {
      'title': 'My second whatever note',
      'content': 'This is the content of my second whatever note',
      'dateCreated': '2022-01-04'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.bars),
        middle: Text('My Notes'),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: notes.map((note) {
                  return Note(
                    title: note['title']!,
                    content: note['content']!,
                    dateCreated: note['dateCreated']!,
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 32.0,
              right: 32.0,
              child: CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  // Action when button is pressed
                },
                color: CupertinoColors.activeOrange,
                borderRadius: BorderRadius.circular(30.0),
                child: const Icon(
                  CupertinoIcons.add,
                  size: 28.0,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
