import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../product/widgets/container/network_container.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Container(
        color: context.colorScheme.primary,
        width: context.width,
        child: Padding(
          padding: context.verticalPaddingHigh,
          child: Text(
            'Bir sorun oluştu',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
          ),
        ),
      );
    };
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
