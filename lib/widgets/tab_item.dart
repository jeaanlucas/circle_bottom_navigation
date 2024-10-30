import 'package:flutter/material.dart';

const double iconOff = -3;
const double iconOn = 0;
const double textOff = 3;
const double textOn = 1;
const double alphaOff = 0;
const double alphaOn = 1;
const int animationDuration = 300;

class TabItem extends StatelessWidget {
  final UniqueKey uniqueKey;
  final bool selected;
  final IconData icon;
  final String? title;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;

  final double iconYAlign = iconOn;
  final double textYAlign = textOff;
  final double iconAlpha = alphaOn;

  const TabItem({
    required this.uniqueKey,
    required this.selected,
    required this.icon,
    required this.callbackFunction,
    required this.textColor,
    required this.iconColor,
    super.key,
    this.title,
    this.iconSize = 30,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          title == null
              ? Container()
              : SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: animationDuration,
                    ),
                    opacity: selected ? alphaOn : alphaOff,
                    child: AnimatedAlign(
                      duration: const Duration(
                        milliseconds: animationDuration,
                      ),
                      alignment: Alignment(
                        0,
                        selected ? textOn : textOff,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: fontWeight,
                            fontSize: fontSize,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: const Duration(
                milliseconds: animationDuration,
              ),
              curve: Curves.easeIn,
              alignment: Alignment(
                0,
                selected ? iconOff : iconOn,
              ),
              child: AnimatedOpacity(
                duration: const Duration(
                  milliseconds: animationDuration,
                ),
                opacity: selected ? alphaOff : alphaOn,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  alignment: const Alignment(
                    0,
                    0,
                  ),
                  icon: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                  onPressed: () => callbackFunction(uniqueKey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
