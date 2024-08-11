import 'package:flutter/cupertino.dart';

class StatelessTag extends StatelessWidget {
  const StatelessTag({super.key, required this.name, required this.showBorder});

  final String name;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final bool showTagIcon = name != "No tags";

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: Container(
        padding: _getPadding(showTagIcon),
        decoration: _getDecoration(showTagIcon),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTagIcon) _buildTagIcon(),
            if (showTagIcon) const SizedBox(width: 6),
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
    if (!showBorder) {
      return BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(20),
      );
    }
    if (showTag) {
      return BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CupertinoColors.systemGrey,
          width: 1,
        ),
      );
    }
    return const BoxDecoration();
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
