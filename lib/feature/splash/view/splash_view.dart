import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future goToHomeView() async {
    await Future.delayed(const Duration(seconds: 1));
    context.router.replace(const HomeRoute());
  }

  @override
  void initState() {
    goToHomeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onError,
      body: Center(
        child: Text(
          'Türkçe Sözlük',
          style: context.textTheme.headline3?.copyWith(color: context.colorScheme.primary),
        ),
      ),
    );
  }
}
