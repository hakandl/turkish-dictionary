import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/svg.dart';

class ARuleWebView extends StatelessWidget {
  const ARuleWebView({super.key, required this.title, required this.url});
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: WebView(
        initialUrl: url,
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: _backButton(context),
      title: Text(title),
    );
  }

  TurkishDictionaryIconButton _backButton(BuildContext context) {
    return TurkishDictionaryIconButton(
      onPressed: () => context.pop(),
      child: SvgWidget(icon: SvgNameEnum.left.icon),
    );
  }
}
