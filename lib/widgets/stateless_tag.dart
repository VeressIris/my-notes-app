import 'package:flutter/cupertino.dart';

class StatelessTag extends StatelessWidget {
  const StatelessTag({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final bool showTag = name != "No tags";

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: Container(
        padding: _getPadding(showTag),
        decoration: _getDecoration(showTag),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTag) _buildTagIcon(),
            if (showTag) const SizedBox(width: 6),
            Flexible(child: _buildTagName()),
          ],
        ),
      ),
    );
  }

  EdgeInsets _getPadding(bool showTag) {
    return showTag
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 2)
        : const EdgeInsets.all(0);
  }

  BoxDecoration _getDecoration(bool showTag) {
    return showTag
        ? BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: CupertinoColors.systemGrey,
              width: 1,
            ),
          )
        : const BoxDecoration();
  }

  Widget _buildTagIcon() {
    return const Icon(
      CupertinoIcons.tag,
      size: 16,
      color: CupertinoColors.systemGrey,
    );
  }

  Widget _buildTagName() {
    return Text(
      name,
      style: const TextStyle(
        color: CupertinoColors.systemGrey,
        fontSize: 16,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
