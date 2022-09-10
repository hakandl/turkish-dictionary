import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, this.child, this.height, this.width, this.radius}) : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    const bg = 'assets/images/bg.jpg';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 0), topRight: Radius.circular(radius ?? 0)),
        image: const DecorationImage(image: AssetImage(bg), fit: BoxFit.cover),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
