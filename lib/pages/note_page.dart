import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_notes_app/widgets/my_dialog.dart';
import 'package:my_notes_app/widgets/my_quill_toolbar.dart';
import 'package:my_notes_app/widgets/note_data.dart';

class NotePage extends StatefulWidget {
  const NotePage(
      {super.key,
      required this.title,
      required this.content,
      required this.dateCreated,
      required this.tags});

  final String title;
  final String content;
  final String dateCreated;
  final String tags;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late final QuillController _controller;

  @override
  void initState() {
    super.initState();

    // Convert the plain text content into a Quill Document
    final doc = Document()..insert(0, widget.content);

    _controller = QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        middle: QuillToolbar(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuillToolbarHistoryButton(
                isUndo: true,
                controller: _controller,
              ),
              QuillToolbarHistoryButton(
                isUndo: false,
                controller: _controller,
              ),
            ],
          ),
        ),
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.trash,
            color: CupertinoColors.destructiveRed,
            size: 24,
          ),
          onPressed: () => showCupertinoDialog(
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
        ),
        backgroundColor: CupertinoColors.black,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  NoteData(
                      dateCreated: widget.dateCreated,
                      tags: widget.tags,
                      showAdd: true,
                      showBorder: false),
                  CupertinoTextField(
                    controller: TextEditingController(text: widget.title),
                    placeholder: 'Title',
                    placeholderStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemGrey3,
                    ),
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
                  QuillEditor.basic(
                    controller: _controller,
                    configurations: QuillEditorConfigurations(
                      autoFocus: widget.content.isEmpty ? true : false,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      onTapOutside: (event, focusNode) =>
                          FocusScope.of(context).unfocus(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyQuillToolbar(controller: _controller),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
