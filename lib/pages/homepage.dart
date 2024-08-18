import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:my_notes_app/pages/note_page.dart';
import 'package:my_notes_app/pages/tags_page.dart';
import 'package:my_notes_app/widgets/my_dialog.dart';
import 'package:my_notes_app/widgets/note.dart';
import 'package:my_notes_app/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_notes_app/pages/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateTime now = DateTime.now();

  final List<Map<String, String>> notes = [
    {
      'title': 'My first note',
      'content': 'This is the content of my first note',
      'dateCreated': '2022-01-01',
      'tags': 'tag1, tag2'
    },
    {
      'title': 'My second note',
      'content': 'This is the content of my second note',
      'dateCreated': '2022-01-02',
      'tags': 'tag1, tag2'
    },
    {
      'title': 'My third note',
      'content': 'This is the content of my third note',
      'dateCreated': '2022-01-03',
      'tags': 'tag1, tag2, tag3'
    },
    {
      'title': 'My whatever note',
      'content': 'This is the content of a note',
      'dateCreated': '2022-01-04',
      'tags': 'tag1'
    },
    {
      'title': '',
      'content': 'This is the content of my second whatever note',
      'dateCreated': '2022-01-04',
      'tags': 'tag1, tag2'
    },
    {
      'title': 'My second whatever note',
      'content': 'This is the content of my second whatever note blah blah',
      'dateCreated': '2022-01-04',
    },
    {'title': '', 'content': 'BLAH BLAH BLAH', 'dateCreated': '2022-01-04'},
    {
      'title': 'My THIRD whatever note',
      'content':
          'This is the content of my third whatever note ahaha blah blah',
      'dateCreated': '2022-01-09',
      'tags': 'tag1, tag2'
    },
  ];

  void logout() {
    final auth = AuthService(client: Supabase.instance.client);
    auth.logout();

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      key: _scaffoldKey,
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: const Icon(CupertinoIcons.bars),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        middle: Text(widget.title),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: notes.map((note) {
                  return Note(
                    title: note['title']!,
                    content: note['content']!,
                    dateCreated: note['dateCreated']!,
                    tags: note['tags'] ?? 'No tags',
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 32,
              right: 32,
              child: CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  // open new empty note
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => NotePage(
                          title: "",
                          content: "",
                          tags: "",
                          dateCreated:
                              DateTime(now.year, now.month, now.day).toString(),
                        ),
                      ));
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
      drawer: Drawer(
        child: CupertinoListSection(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                alignment: Alignment.topCenter,
                height: 85,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(CupertinoIcons.person, size: 48),
                    ),
                    Text('John Doe',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                )),
            CupertinoListTile(
              title: const Text('Public notes'),
              leading: const Icon(CupertinoIcons.lock_open_fill),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Homepage(title: "My notes"),
                  ),
                );
              },
            ),
            CupertinoListTile(
                title: const Text('Private notes'),
                leading: const Icon(CupertinoIcons.lock_fill),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const Homepage(title: "My private notes"),
                    ),
                  );
                }),
            CupertinoListTile(
                title: const Text('Tags'),
                leading: const Icon(CupertinoIcons.tag_fill),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const TagsPage(),
                    ),
                  );
                }),
            CupertinoListTile(
                title: const Text('Settings'),
                leading: const Icon(CupertinoIcons.settings),
                trailing: const CupertinoListTileChevron(),
                onTap: () {}),
            CupertinoListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => MyDialog(
                            title: 'Logout',
                            description: 'Are you sure you want to logout?',
                            confirmText: 'Logout',
                            context: context,
                            onPressed: () {
                              logout();
                            },
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
