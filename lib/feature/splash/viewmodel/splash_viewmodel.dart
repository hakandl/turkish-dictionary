import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../product/init/navigator/app_router.dart';

class SplashViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextView(context!.durationNormal);
    });
  }

  bool isFirstInit = true;

  Future<void> startAnimationOnView() async {
    if (context == null) return;
    await Future.delayed(context!.durationLow);
    _changeFirstInit();
  }

  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
    notifyListeners();
  }

  Future<void> _nextView(Duration duration) async {
    await Future.delayed(duration);
    context!.router.replace(const HomeRoute());
  }
}
