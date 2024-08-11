import 'package:flutter/cupertino.dart';

class MyFormTextField extends StatefulWidget {
  const MyFormTextField({super.key, required this.text, required this.obscureText});

  final String text;
  final bool obscureText;
  
  @override
  _MyFormTextFieldState createState() => _MyFormTextFieldState();
}

class _MyFormTextFieldState extends State<MyFormTextField> {
  late FocusNode _focusNode;
  BoxDecoration border = BoxDecoration(
    border: Border.all(color: CupertinoColors.systemGrey2),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Add a listener to track focus changes
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          border = BoxDecoration(
            border: Border.all(color: CupertinoColors.activeOrange),
            borderRadius: BorderRadius.circular(8),
          );
        } else {
          border = BoxDecoration(
            border: Border.all(color: CupertinoColors.systemGrey2),
            borderRadius: BorderRadius.circular(8),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CupertinoTextField(
          focusNode: _focusNode,
          placeholder: widget.text,
          padding: const EdgeInsets.all(12),
          spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
          decoration: border,
          obscureText: widget.obscureText,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
