import 'package:flutter/material.dart';

import 'components/constatns.dart';



class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  IconContent({this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            label,
            style:kLabelTextStyle
            ),
        ],
      ),
    );
  }
}


class ReuseableCard extends StatelessWidget {
  Color color;
  final Widget cardChild;
  final Function onPress;

  ReuseableCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        height: 158,
      ),
    );
  }
}


