import 'package:flutter/material.dart';
import 'package:turkce_sozluk/product/widgets/container/network_container.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox.shrink(),
        ),
        const NoNetworkContainer()
      ],
    );
  }
}
