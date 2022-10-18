import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/constants/enums/svg_enum.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../product/widgets/button/icon_button.dart';

class ARuleWebView extends StatelessWidget {
  const ARuleWebView({super.key, required this.title, required this.url});
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TurkceSozlukIconButton(
          onPressed: () => Navigator.pop(context),
          child: SvgWidget(
            icon: SvgNameEnum.left.icon,
            color: context.colorScheme.background,
          ),
        ),
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
