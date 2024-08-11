import 'package:flutter/cupertino.dart';

class MyFormTextField extends StatefulWidget {
  const MyFormTextField(
      {super.key,
      required this.text,
      required this.controller,
      this.obscureText = false});

  final String text;
  final TextEditingController controller;
  final obscureText;

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
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: CupertinoTextFormFieldRow(
        controller: widget.controller,
        focusNode: _focusNode,
        placeholder: widget.text,
        padding: const EdgeInsets.all(8),
        decoration: border,
        obscureText: widget.obscureText,
        validator: (value) => value!.isEmpty ? 'Fields cannot be empty.' : null,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
