import 'package:flutter/cupertino.dart';
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
          onPressed: () {},
        ),
        backgroundColor: CupertinoColors.black,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // Wrap the scrollable content
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to start
                children: [
                  CupertinoTextField(
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
                      autoFocus: true,
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
}
