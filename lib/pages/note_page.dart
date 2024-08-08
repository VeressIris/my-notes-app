import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_notes_app/widgets/my_quill_toolbar.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key, required this.title});

  final String title;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                child: const Icon(CupertinoIcons.arrow_uturn_left,
                    color: CupertinoColors.systemGrey),
                onPressed: () {
                  // undo changes
                },
              ),
              CupertinoButton(
                child: const Icon(CupertinoIcons.arrow_uturn_right,
                    color: CupertinoColors.systemGrey),
                onPressed: () {
                  // redo changes
                },
              )
            ],
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
                    child: QuillEditor.basic(
                  controller: _controller,
                  configurations: QuillEditorConfigurations(
                    autoFocus: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    onTapOutside: (event, focusNode) => FocusScope.of(context).unfocus(),
                  ),
                )),
                MyQuillToolbar(controller: _controller),
              ],
            )));
  }
}
