import 'package:flutter/material.dart';
import 'package:turkce_sozluk/product/widgets/container/network_container.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    /* ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Container(
        color: context.colorScheme.primary,
        child: Center(
            child: Text(
          'Bir sorun oluştu',
          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
        )),
      );
    }; */
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
