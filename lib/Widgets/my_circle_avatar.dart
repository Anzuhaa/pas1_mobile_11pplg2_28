import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final AssetImage? assetImage;
  final Color? bgColor;
  final Icon? icon;
  final VoidCallback? onPressed;
  final double radius;

  const MyCircleAvatar({
    super.key,
    this.assetImage,
    this.onPressed,
    required this.radius,
    this.bgColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: assetImage,
        backgroundColor: bgColor,
        child: icon,
      ),
    );
  }
}
