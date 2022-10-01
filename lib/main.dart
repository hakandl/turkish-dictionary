import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/constants/app/app_constants.dart';
import 'package:turkce_sozluk/product/init/product_init.dart';

import 'core/init/notifier/theme_notifier.dart';
import 'feature/home/view/home_view.dart';

Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();
  runApp(
    EasyLocalization(
      supportedLocales: productInit.localizationInit.supportedLocales,
      path: productInit.localizationInit.path,
      child: MultiProvider(
        providers: productInit.providers,
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      home: const HomeView(),
    );
  }
}
