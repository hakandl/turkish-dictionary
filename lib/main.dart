import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/constants/app/app_constants.dart';

import 'core/init/notifier/theme_notifier.dart';
import 'feature/home/view/home_view.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        )
      ],
      builder: (context, child) => const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeNotifier>().currentTheme,
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      home: const HomeView(),
    );
  }
}
