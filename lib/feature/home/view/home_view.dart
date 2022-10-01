import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/service/project_network_manager.dart';
import '../../../product/widgets/button/icon_button.dart';
import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/card/home_info_card.dart';
import '../../../product/widgets/card/intrinsic_height_card.dart';
import '../../../product/widgets/card/search_card.dart';
import '../../../product/widgets/modal/bottom_modal_sheet.dart';
import '../../../product/widgets/shimmer/home_card_shimmer.dart';
import '../../../product/widgets/string/info_card_text.dart';
import '../../../product/widgets/svg.dart';
import '../service/content_service.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TurkceSozlukModalSheet {
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

  SafeArea _body(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.dynamicHeight(0.2),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: _HomeViewHeightEnum.twentyFive.value,
                  child: _bodyHeader(context),
                ),
                Positioned(
                  bottom: _HomeViewHeightEnum.zero.value,
                  child: const SearchCard(),
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

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(0), child: AppBar(backgroundColor: context.colorScheme.surface));
  }

  ColoredBox _bodyHeader(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.onError,
      child: Align(
        alignment: Alignment.topRight,
        child: TurkceSozlukIconButton(
            child: SvgWidget(
              icon: IconNameEnum.more.value,
              color: context.colorScheme.onPrimary,
            ),
            onPressed: () => _openModalSheet(context)),
      ),
    );
  }

  Future<dynamic> _openModalSheet(BuildContext context) {
    return showTurkceSozlukModalSheet(
      height: 0.2,
      context,
      Padding(
        padding: context.onlyTopPaddingMedium,
        child: TurkceSozlukIconTextButton(
          fixedSizeWidth: context.dynamicWidth(.9),
          text: 'text',
          textStyle: TextStyle(
            color: context.colorScheme.background,
          ),
          icon: SvgWidget(
            icon: context.read<ThemeNotifier>().themeIcon ? IconNameEnum.sun.value : IconNameEnum.moon.value,
            color: context.colorScheme.onBackground,
          ),
          onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
            context.read<ThemeNotifier>().changeIcon();
            context.pop();
          },
        ),
      ),
    );
  }

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
          IntrinsicHeightCard(
            child: _syydCard(context),
          ),
        ],
      ),
    );
  }

  HomeInfoCard _wordCard(BuildContext context) {
    return HomeInfoCard(
      title: context.watch<HomeViewModel>().word?[0].word ?? LocaleKeys.not_found.tr(),
      subtitle: context.watch<HomeViewModel>().word?[0].meaning ?? LocaleKeys.not_found.tr(),
    );
  }

  HomeInfoCard _proverbCard(BuildContext context) {
    return HomeInfoCard(
      title: context.watch<HomeViewModel>().proverb?[0].word ?? LocaleKeys.not_found.tr(),
      subtitle: context.watch<HomeViewModel>().proverb?[0].meaning ?? LocaleKeys.not_found.tr(),
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

  _syydCard(BuildContext context) {
    return context.watch<HomeViewModel>().isLoading
        ? const HomeCardShimmer(
            isLine: false,
          )
        : SizedBox(
            height: context.dynamicHeight(0.10),
            child: Scrollbar(
              controller: HomeViewModel.pageController,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              child: PageView.builder(
                controller: HomeViewModel.pageController,
                scrollDirection: Axis.horizontal,
                itemCount: context.watch<HomeViewModel>().syyd?.length ?? 0,
                itemBuilder: (context, index) {
                  return HomeInfoColumnCard(
                    title: context.watch<HomeViewModel>().syyd?[index].wrongWord ?? LocaleKeys.not_found.tr(),
                    subtitle: context.watch<HomeViewModel>().syyd?[index].correctWord ?? LocaleKeys.not_found.tr(),
                  );
                },
              ),
            ),
          );
  }
}

enum _HomeViewHeightEnum {
  zero(0),
  twentyFive(25);

  final double value;
  const _HomeViewHeightEnum(this.value);
}
