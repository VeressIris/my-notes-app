import 'package:flutter/cupertino.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key, required this.title});

  final String title;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: CupertinoColors.black,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                CupertinoTextField(
                  placeholder: 'Title',
                  placeholderStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemGrey3),
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const BoxDecoration(border: null),
                  textInputAction:
                      TextInputAction.done, // Prevent new lines on Enter
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
                CupertinoTextField(
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  autofocus: true,
                  decoration: const BoxDecoration(border: null),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                )
              ],
            )));
  }
}
