import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          trailing: CupertinoButton(
              child: const Icon(
                CupertinoIcons.trash,
                color: CupertinoColors.destructiveRed,
                size: 24,
              ),
              onPressed: () {}),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: CupertinoTextField(
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      autofocus: true,
                      decoration: const BoxDecoration(border: null),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.check_mark_circled),
                      onPressed: () {
                        // insert checkmark
                      },
                    ),
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.italic),
                      onPressed: () {
                        // cycle through styling options (italic->bold->underline->none)
                      },
                    ),
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.list_bullet),
                      onPressed: () {
                        // cycle through list types (bullet->numbered->none)
                      },
                    ),
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.increase_indent),
                      onPressed: () {
                        // cycle through indentation (middle->right->left)
                      },
                    ),
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.paintbrush),
                      onPressed: () {
                        // open color picker and highlight text with that color
                      },
                    )
                  ],
                )
              ],
            )));
  }
}
