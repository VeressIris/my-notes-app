import 'package:flutter/cupertino.dart';

class StatelessTag extends StatelessWidget {
  const StatelessTag({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 120,
        ),
        child: Container(
          padding: name != "No tags" ? const EdgeInsets.symmetric(horizontal: 8, vertical: 2) : const EdgeInsets.all(0),
          decoration: name != "No tags" ? BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: CupertinoColors.systemGrey,
              width: 1,
            ),
          ) : const BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              name != "No tags"
                  ? const Icon(
                      CupertinoIcons.tag,
                      size: 16,
                      color: CupertinoColors.systemGrey,
                    )
                  : const SizedBox(),
              name != "No tags" ? const SizedBox(width: 6) : const SizedBox(),
              Flexible(
                  child: Text(
                name,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
            ],
          ),
        ));
  }
}
