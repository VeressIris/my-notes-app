import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MyQuillToolbar extends StatelessWidget {
  MyQuillToolbar({super.key, required this.controller});

  final QuillController controller;
  QuillIconTheme iconTheme = const QuillIconTheme(
      iconButtonSelectedData: IconButtonData(color: CupertinoColors.black));

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      configurations: const QuillToolbarConfigurations(
        buttonOptions: QuillSimpleToolbarButtonOptions(
          base: QuillToolbarBaseButtonOptions(
            iconSize: 20,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            QuillToolbarToggleStyleButton(
              options:
                  QuillToolbarToggleStyleButtonOptions(iconTheme: iconTheme),
              controller: controller,
              attribute: Attribute.bold,
            ),
            QuillToolbarToggleStyleButton(
              options:
                  QuillToolbarToggleStyleButtonOptions(iconTheme: iconTheme),
              controller: controller,
              attribute: Attribute.italic,
            ),
            QuillToolbarToggleStyleButton(
              options:
                  QuillToolbarToggleStyleButtonOptions(iconTheme: iconTheme),
              controller: controller,
              attribute: Attribute.underline,
            ),
            QuillToolbarColorButton(
              controller: controller,
              isBackground: true,
            ),
            QuillToolbarClearFormatButton(
              options:
                  QuillToolbarClearFormatButtonOptions(iconTheme: iconTheme),
              controller: controller,
            ),
            QuillToolbarToggleCheckListButton(
              controller: controller,
              options: QuillToolbarToggleCheckListButtonOptions(
                  iconData: CupertinoIcons.check_mark_circled,
                  iconTheme: iconTheme),
            ),
            QuillToolbarToggleStyleButton(
              options:
                  QuillToolbarToggleStyleButtonOptions(iconTheme: iconTheme),
              controller: controller,
              attribute: Attribute.ol,
            ),
            QuillToolbarToggleStyleButton(
              options:
                  QuillToolbarToggleStyleButtonOptions(iconTheme: iconTheme),
              controller: controller,
              attribute: Attribute.ul,
            ),
            QuillToolbarIndentButton(
              controller: controller,
              isIncrease: true,
            ),
            QuillToolbarIndentButton(
              controller: controller,
              isIncrease: false,
            ),
          ],
        ),
      ),
    );
  }
}
