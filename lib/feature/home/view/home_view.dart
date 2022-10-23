import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/home/view/subview/a_rule_webview.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import '../../../product/constants/enums/string/string_constants.dart';
import '../../../product/init/language/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/constants/enums/size_enum.dart';
import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/service/project_network_manager.dart';
import '../../../product/widgets/card/intrinsic_height_card.dart';
import '../../../product/widgets/container/open_container.dart';
import '../../../product/widgets/shimmer/home_card_shimmer.dart';
import '../../../product/widgets/string/info_card_text.dart';
import '../../../product/widgets/svg.dart';
import '../../detail/viewmodel/detail_viewmodel.dart';
import '../../search/view/search_view.dart';
import '../service/content_service.dart';
import '../viewmodel/home_viewmodel.dart';
import '../../../product/extensions/string_extension.dart';

part '../module/widgets/search_card.dart';
part '../module/widgets/syyd_card.dart';
part '../module/widgets/home_info_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(ContentService(ProjectNetworkManager.instance.service)),
      onPageBuilder: (context, HomeViewModel model) {
        return Scaffold(
          appBar: _appBar(context, model),
          body: _body(context, model),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context, HomeViewModel model) {
    return AppBar(
      backgroundColor: context.colorScheme.onError,
      actions: [_themeChangeButton(model)],
    );
  }

  PopupMenuButton<dynamic> _themeChangeButton(HomeViewModel model) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              textStyle: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.background),
              onTap: () async {
                model.themeChangeBox.put(TurkceSozlukStringConstants.settingsDarkMode,
                    !model.themeChangeBox.get(TurkceSozlukStringConstants.settingsDarkMode, defaultValue: false));
                context.read<ThemeNotifier>().changeTheme();
              },
              child: Text(
                LocaleKeys.button_changeTheme.tr(),
              )),
        ];
      },
    );
  }

  ColoredBox _bodyHeader(BuildContext context) {
    return ColoredBox(color: context.colorScheme.onError, child: const SizedBox.shrink());
  }

  SafeArea _body(BuildContext context, HomeViewModel model) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.dynamicHeight(SizeEnum.zFifTeen.value),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: SizeEnum.twentyFive.value,
                  child: _bodyHeader(context),
                ),
                Positioned(
                  bottom: SizeEnum.zero.value,
                  child: const _SearchCard(),
                ),
              ],
            ),
          ),
          Expanded(
            child: _bodyScrollView(context, model),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _bodyScrollView(BuildContext context, HomeViewModel model) {
    return SingleChildScrollView(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCardText(title: LocaleKeys.home_aWord.tr()),
          _wordCard(context, model),
          InfoCardText(title: LocaleKeys.home_aProverb.tr()),
          _proverbCard(context, model),
          InfoCardText(title: LocaleKeys.home_aRule.tr()),
          _aRuleCard(context, model),
          InfoCardText(title: LocaleKeys.home_syyd.tr()),
          const _SyydCard(),
        ],
      ),
    );
  }

  _HomeInfoCard _wordCard(BuildContext context, HomeViewModel model) {
    return _HomeInfoCard(
      title: model.word?[0].word ?? LocaleKeys.info_notFound.tr(),
      subtitle: model.word?[0].meaning ?? LocaleKeys.info_notFound.tr(),
      onTap: () {
        DetailViewModel.word = model.word?[0].word;
        context.router.navigate(const DetailTabBarRoute());
      },
    );
  }

  _HomeInfoCard _proverbCard(BuildContext context, HomeViewModel model) {
    return _HomeInfoCard(
      title: model.proverb?[0].word ?? LocaleKeys.info_notFound.tr(),
      subtitle: model.proverb?[0].meaning ?? LocaleKeys.info_notFound.tr(),
      onTap: () {
        DetailViewModel.word = model.proverb?[0].word;
        context.router.navigate(const DetailTabBarRoute());
      },
    );
  }

  _HomeInfoCard _aRuleCard(BuildContext context, HomeViewModel model) {
    return _HomeInfoCard(
        isLink: true,
        title: context.watch<HomeViewModel>().rule?[0].name ?? LocaleKeys.info_notFound.tr(),
        onTap: () => context.navigateToPage(ARuleWebView(
            title: model.rule?[0].name ?? LocaleKeys.info_notFound.tr(),
            url: model.rule?[0].url ?? TurkceSozlukStringConstants.empty)));
  }
}
