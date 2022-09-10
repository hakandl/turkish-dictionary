import 'package:flutter/material.dart';

class NormalTextField extends TextField {
  NormalTextField({
    Key? key,
    String? title,
    Widget? icon,
    double? radius,
  }) : super(
          key: key,
          decoration: InputDecoration(
            hintText: title,
            prefixIcon: icon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0), borderSide: BorderSide.none),
          ),
        );
}
