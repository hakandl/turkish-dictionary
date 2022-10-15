import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widgets/container/open_container.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/constants/enums/size_enum.dart';
import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/service/project_network_manager.dart';
import '../../../product/widgets/card/home_info_card.dart';
import '../../../product/widgets/card/intrinsic_height_card.dart';
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
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: _appBar(context),
          body: _body(context),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.onError,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  textStyle: TextStyle(
                    color: context.colorScheme.background,
                  ),
                  onTap: context.read<ThemeNotifier>().themeChange,
                  child: Text(
                    LocaleKeys.button_changeTheme.tr(),
                  )
                  /* () => Hive.box('theme_change')
                    .put('dark_mode', !Hive.box('theme_change').get('dark_mode', defaultValue: false)), */
                  ),
            ];
          },
        )
      ],
    );
  }

  ColoredBox _bodyHeader(BuildContext context) {
    return ColoredBox(color: context.colorScheme.onError, child: const SizedBox.shrink());
  }

  SafeArea _body(BuildContext context) {
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
            child: _bodyScrollView(context),
          )
        ],
      ),
    );
  }

  /* Future<dynamic> _openModalSheet(BuildContext context) {
    return showTurkceSozlukModalSheet(
      height: 0.2,
      context,
      Padding(
        padding: context.onlyTopPaddingMedium,
        child: TurkceSozlukCircleElevatedButton(
          child: Text(
            LocaleKeys.button_changeTheme.tr(),
            style: TextStyle(
              color: context.colorScheme.background,
            ),
          ),
          onPressed: () {
            // context.read<ThemeNotifier>().changeTheme();
            // Box kutu = Hive.box('theme');
            Hive.box('theme').put('dark_mode', !Hive.box('theme').get('dark_mode', defaultValue: false));
            context.read<ThemeNotifier>().changeIcon();
            // context.pop();
          },
        ),
      ),
    );
  } */

  SingleChildScrollView _bodyScrollView(BuildContext context) {
    return SingleChildScrollView(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCardText(title: LocaleKeys.home_aWord.tr()),
          _wordCard(context),
          InfoCardText(title: LocaleKeys.home_aProverb.tr()),
          _proverbCard(context),
          InfoCardText(title: LocaleKeys.home_aRule.tr()),
          _aRuleCard(context),
          InfoCardText(title: LocaleKeys.home_syyd.tr()),
          const _SyydCard(),
        ],
      ),
    );
  }

  HomeInfoCard _wordCard(BuildContext context) {
    return HomeInfoCard(
      title: context.watch<HomeViewModel>().word?[0].word ?? LocaleKeys.not_found.tr(),
      subtitle: context.watch<HomeViewModel>().word?[0].meaning ?? LocaleKeys.not_found.tr(),
      onTap: () {
        DetailViewModel.word = context.read<HomeViewModel>().word?[0].word;
        context.router.navigate(const DetailTabBarRoute());
      },
    );
  }

  HomeInfoCard _proverbCard(BuildContext context) {
    return HomeInfoCard(
      title: context.watch<HomeViewModel>().proverb?[0].word ?? LocaleKeys.not_found.tr(),
      subtitle: context.watch<HomeViewModel>().proverb?[0].meaning ?? LocaleKeys.not_found.tr(),
      onTap: () {
        DetailViewModel.word = context.read<HomeViewModel>().proverb?[0].word;
        context.router.navigate(const DetailTabBarRoute());
      },
    );
  }

  HomeInfoCard _aRuleCard(BuildContext context) {
    return HomeInfoCard(
      isLink: true,
      title: context.watch<HomeViewModel>().rule?[0].name ?? LocaleKeys.not_found.tr(),
      subtitle: context.watch<HomeViewModel>().rule?[0].url ?? LocaleKeys.not_found.tr(),
      onTap: () => context.read<HomeViewModel>().openUrl(context.read<HomeViewModel>().rule?[0].url ?? ''),
    );
  }
}
