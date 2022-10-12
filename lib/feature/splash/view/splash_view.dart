import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/base/view/base_view.dart';
import 'package:turkce_sozluk/feature/splash/viewmodel/splash_viewmodel.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/svg_enum.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        viewModel: SplashViewModel(),
        onPageBuilder: (context, value) {
          return ChangeNotifierProvider(
              create: (context) => value,
              builder: (context, child) {
                return Scaffold(
                  backgroundColor: context.colorScheme.error,
                  body: Center(
                    child: AnimatedScale(
                        scale: context.watch<SplashViewModel>().isFirstInit ? 0 : 1.5,
                        duration: context.durationLow,
                        child: SvgWidget(icon: SvgNameEnum.splash.icon, height: SizeEnum.oneHundredTwentyEight.value)),
                  ),
                );
              });
        });
  }
}
