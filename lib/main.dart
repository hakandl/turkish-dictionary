import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'feature/splash/viewmodel/splash_viewmodel.dart';
import 'product/constants/enums/string/string_constants.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/theme/dark/app_theme_dark.dart';
import 'core/init/theme/light/app_theme_light.dart';
import 'product/init/navigator/app_router.dart';
import 'product/init/product/product_init.dart';

import 'product/init/build/main_build.dart';

Future<void> main() async {
  await SplashViewModel().hiveInit();
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
      valueListenable: Hive.box(TurkishDictionaryStringConstants.settings).listenable(),
      builder: (context, box, child) {
        return MaterialApp.router(
          builder: MainBuild.build,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: box.get(TurkishDictionaryStringConstants.settingsDarkMode, defaultValue: false)
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
