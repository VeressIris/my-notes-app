import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MyQuillToolbar extends StatelessWidget {
  const MyQuillToolbar({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      configurations: const QuillToolbarConfigurations(
        buttonOptions: QuillSimpleToolbarButtonOptions(
          base: QuillToolbarBaseButtonOptions(
            iconSize: 20,
            iconButtonFactor: 1.4,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            QuillToolbarToggleStyleButton(
              options: const QuillToolbarToggleStyleButtonOptions(),
              controller: controller,
              attribute: Attribute.bold,
            ),
            QuillToolbarToggleStyleButton(
              options: const QuillToolbarToggleStyleButtonOptions(),
              controller: controller,
              attribute: Attribute.italic,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.underline,
            ),
            QuillToolbarClearFormatButton(
              controller: controller,
            ),
            QuillToolbarColorButton(
              controller: controller,
              isBackground: true,
            ),
            QuillToolbarToggleCheckListButton(
              controller: controller,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.ol,
            ),
            QuillToolbarToggleStyleButton(
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
            QuillToolbarLinkStyleButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
