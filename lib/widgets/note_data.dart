import 'package:flutter/cupertino.dart';
import 'package:my_notes_app/widgets/stateless_tag.dart';

class NoteData extends StatelessWidget {
  const NoteData(
      {super.key,
      required this.dateCreated,
      required this.tags,
      required this.showAdd,
      required this.showBorder});
  final String dateCreated;
  final String tags;
  final bool showAdd;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dateCreated,
          style: const TextStyle(
              color: CupertinoColors.systemGrey, fontSize: 16, height: 1.35),
        ),
        const Text(
          ' | ',
          style: TextStyle(
              color: CupertinoColors.systemGrey, fontSize: 20, height: 1.35),
        ),
        StatelessTag(
            name: tags.toString(),
            showBorder:
                showBorder), // TODO: change tags.toString() to something adequate
        showAdd
            ? CupertinoButton(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 2.7, bottom: 4, left: 4, right: 4),
                  decoration: BoxDecoration(
                    color: CupertinoColors.darkBackgroundGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(CupertinoIcons.add_circled,
                      color: CupertinoColors.systemGrey, size: 20),
                ),
                onPressed: () {
                  // add tag to note
                },
              )
            : const SizedBox(),
      ],
    );
  }
}
