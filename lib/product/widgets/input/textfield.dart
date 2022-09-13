import 'package:flutter/material.dart';

class NormalTextField extends TextField {
  NormalTextField(
      {Key? key,
      String? title,
      TextStyle? style,
      TextEditingController? controller,
      Widget? icon,
      Widget? suffixIcon,
      double? radius,
      void Function()? onTap,
      void Function(String)? onChanged,
      bool autofocus = true})
      : super(
          key: key,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          autofocus: autofocus,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: title,
            hintStyle: style,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0), borderSide: BorderSide.none),
          ),
        );
}
