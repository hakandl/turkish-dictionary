import 'package:flutter/material.dart';

class NormalTextField extends TextField {
  NormalTextField(
      {Key? key,
      String? title,
      TextEditingController? controller,
      Widget? icon,
      Widget? suffixIcon,
      double? radius,
      void Function(String)? onChanged,
      bool autofocus = true})
      : super(
          key: key,
          controller: controller,
          onChanged: onChanged,
          autofocus: autofocus,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: title,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0), borderSide: BorderSide.none),
          ),
        );
}
