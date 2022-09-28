import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/constants/app/app_constants.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/feature/home/service/content_service.dart';
import 'package:turkce_sozluk/feature/home/viewmodel/home_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';

import 'core/init/notifier/theme_notifier.dart';
import 'feature/home/view/home_view.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel(ContentService(ProjectNetworkManager.instance.service))),
        ChangeNotifierProvider<DetailViewModel>(
            create: (context) => DetailViewModel(DetailService(ProjectNetworkManager.instance.service))),
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
