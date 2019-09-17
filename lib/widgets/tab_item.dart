import 'package:flutter/material.dart';

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;

class TabItem extends StatelessWidget {
  final UniqueKey uniqueKey;
  final bool selected;
  final IconData icon;
  final String title;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;

  final double iconYAlign = ICON_ON;
  final double textYAlign = TEXT_OFF;
  final double iconAlpha = ALPHA_ON;

  TabItem({
    @required this.uniqueKey,
    @required this.selected,
    @required this.icon,
    @required this.callbackFunction,
    @required this.textColor,
    @required this.iconColor,
    this.title,
    this.iconSize,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          title == null
          ?
            Container()
          :
            Container(
              height: double.infinity,
              width: double.infinity,
              child: AnimatedAlign(
                duration: Duration(
                  milliseconds: ANIM_DURATION,
                ),
                alignment: Alignment(
                  0,
                  (selected) ? TEXT_ON : TEXT_OFF,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    title,
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
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(
                milliseconds: ANIM_DURATION,
              ),
              curve: Curves.easeIn,
              alignment: Alignment(
                0,
                (selected) ? ICON_OFF : ICON_ON,
              ),
              child: AnimatedOpacity(
                duration: Duration(
                  milliseconds: ANIM_DURATION,
                ),
                opacity: (selected) ? ALPHA_OFF : ALPHA_ON,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(
                    0,
                  ),
                  alignment: Alignment(
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
