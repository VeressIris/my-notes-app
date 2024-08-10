import 'package:flutter/cupertino.dart';

class Tag extends StatefulWidget {
  const Tag({super.key, required this.name});

  final String name;
  final Color backgroundColor = CupertinoColors.darkBackgroundGray;

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 85, maxWidth: 120),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize:
              MainAxisSize.min, // Ensure the row takes only necessary width
          children: [
            Container(
              margin: const EdgeInsets.only(right: 6),
              child: const Icon(
                CupertinoIcons.tag,
                size: 16,
                color: CupertinoColors.systemGrey,
              ),
            ),
            Flexible(
              // Use Flexible to adapt to the available space
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
