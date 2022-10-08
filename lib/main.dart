import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/constants/app/app_constants.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import 'package:turkce_sozluk/product/init/product_init.dart';

import 'core/init/main_build.dart';
import 'core/init/theme/dark/app_theme_dark.dart';
import 'core/init/theme/light/app_theme_light.dart';

Future<void> main() async {
  await _init();
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

Future<void> _init() async {
  await Hive.initFlutter();
  await Hive.openBox('theme');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('theme').listenable(keys: ['dark_mode']),
      builder: (context, box, child) {
        return MaterialApp.router(
          builder: MainBuild.build,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          // theme: context.watch<ThemeNotifier>().currentTheme,
          theme: Hive.box('theme').get('dark_mode', defaultValue: false)
              ? AppThemeDark.instance.theme
              : AppThemeLight.instance.theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: ApplicationConstants.APP_NAME,
        );
      },
    );
  }
}
