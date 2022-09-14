import 'package:flutter/material.dart';

class TurkceSozlukMaterialButton extends StatelessWidget {
  const TurkceSozlukMaterialButton(
      {super.key, this.width = 48, this.height = 48, this.color, required this.child, this.onPressed});
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 4,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: IconButton(
          icon: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
