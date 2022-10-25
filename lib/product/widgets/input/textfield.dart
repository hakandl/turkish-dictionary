import 'package:flutter/material.dart';
import '../../constants/enums/size_enum.dart';

class NormalTextField extends TextField {
  NormalTextField(
      {Key? key,
      String? title,
      TextStyle? style,
      TextEditingController? controller,
      Widget? icon,
      Widget? suffixIcon,
      double? radius,
      Color? fillColor,
      void Function(String)? onChanged,
      bool autofocus = true})
      : super(
          key: key,
          controller: controller,
          onChanged: onChanged,
          autofocus: autofocus,
          style: style,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: title,
            prefixIcon: icon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? SizeEnum.zero.value), borderSide: BorderSide.none),
          ),
        );
}
