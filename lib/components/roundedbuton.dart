import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
  final Color color;

  roundedButton(
      {required this.icon, required this.onPress, required this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 15,
      ),
      onPressed: onPress,
      elevation: 0,
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
