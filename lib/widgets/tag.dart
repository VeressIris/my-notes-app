import 'package:flutter/cupertino.dart';

class Tag extends StatefulWidget {
  const Tag({super.key, required this.name});

  final String name;

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  Color backgroundColor = CupertinoColors.darkBackgroundGray;
  Color textColor = CupertinoColors.systemGrey;
  bool isSelected = false;
  int transitionDuration = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          backgroundColor = isSelected
              ? CupertinoColors.activeBlue
              : CupertinoColors.darkBackgroundGray;
          textColor =
              isSelected ? CupertinoColors.white : CupertinoColors.systemGrey;
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 85,
          maxWidth: isSelected ? double.infinity : 120,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: transitionDuration),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: Duration(
                    milliseconds:
                        transitionDuration),
                child: Icon(
                  isSelected
                      ? CupertinoIcons.clear_circled
                      : CupertinoIcons.tag,
                  key: ValueKey<bool>(isSelected), // Unique key for transition
                  size: 16,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: transitionDuration),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.systemGrey,
                        fontSize: 16,
                      ),
                      key: ValueKey<bool>(isSelected),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
