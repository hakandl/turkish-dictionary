import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:turkce_sozluk/product/init/localization_init.dart';

import '../../core/init/notifier/theme_notifier.dart';
import '../../feature/detail/service/detail_service.dart';
import '../../feature/detail/viewmodel/detail_viewmodel.dart';
import '../../feature/home/service/content_service.dart';
import '../../feature/home/viewmodel/home_viewmodel.dart';
import '../service/project_network_manager.dart';

class ProductInit {
  final localizationInit = LocalizationInit();

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        ContentService(ProjectNetworkManager.instance.service),
      ),
    ),
    ChangeNotifierProvider<DetailViewModel>(
      create: (context) => DetailViewModel(
        DetailService(ProjectNetworkManager.instance.service),
      ),
    ),
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}