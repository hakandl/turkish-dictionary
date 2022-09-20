import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/home/service/content_service.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/widgets/button/icon_button.dart';
import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/card/home_info_card.dart';
import '../../../product/widgets/modal/bottom_modal_sheet.dart';
import '../../../product/widgets/svg.dart';
import '../../search/view/search_view.dart';
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
        return ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(ContentService(ProjectNetworkManager.instance.service)),
          builder: (context, child) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: AppBar(
                    backgroundColor: context.colorScheme.surface,
                    elevation: 0,
                    systemOverlayStyle: context.appTheme.appBarTheme.systemOverlayStyle),
              ),
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.dynamicHeight(0.3),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            bottom: 26,
                            child: ColoredBox(
                              color: context.colorScheme.onError,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: TurkceSozlukIconButton(
                                      child: SvgWidget(
                                        icon: IconNameEnum.more.value,
                                        color: context.colorScheme.onPrimary,
                                      ),
                                      onPressed: () {
                                        showTurkceSozlukModalSheet(
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
                                                icon: IconNameEnum.sun.value,
                                                color: context.colorScheme.onBackground,
                                              ),
                                              onPressed: () {
                                                context.read<ThemeNotifier>().changeTheme();
                                                context.pop();
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SvgWidget(
                                    icon: IconNameEnum.logo.value,
                                    height: 40,
                                    width: 85,
                                    color: context.colorScheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: OpenContainer(
                              closedElevation: 5,
                              openColor: context.colorScheme.primary,
                              closedColor: context.colorScheme.primary,
                              closedShape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
                              transitionDuration: context.durationLow,
                              transitionType: ContainerTransitionType.fade,
                              closedBuilder: (context, VoidCallback action) {
                                return Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: context.dynamicWidth(.9),
                                    height: 50,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: context.paddingNormal,
                                          child: SvgWidget(
                                            icon: IconNameEnum.search.value,
                                            color: context.colorScheme.background,
                                          ),
                                        ),
                                        Text(
                                          'Türkçe Sözlükte Ara',
                                          style: context.textTheme.titleMedium?.copyWith(
                                            color: context.colorScheme.background,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              openBuilder: (context, action) {
                                return const SearchView();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: wordAndProverb(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container wordAndProverb(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.onlyTopPaddingNormal.top,
      ),
      padding: context.horizontalPaddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeInfoCardTitle(context, 'data'),
          Center(
              child: HomeInfoCard(
            title: context.watch<HomeViewModel>().kelime?[0].madde ?? 'shimmer',
            subtitle: context.watch<HomeViewModel>().kelime?[0].anlam ?? 'shimmer',
          )),
          homeInfoCardTitle(context, 'data'),
          Center(
            child: HomeInfoCard(
              title: context.watch<HomeViewModel>().atasoz?[0].madde ?? 'shimmer',
              subtitle: context.watch<HomeViewModel>().atasoz?[0].anlam ?? 'shimmer',
            ),
          ),
        ],
      ),
    );
  }

  Container homeInfoCardTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(
        top: context.onlyTopPaddingMedium.top,
        bottom: context.onlyBottomPaddingLow.bottom,
        left: context.onlyLeftPaddingLow.left,
      ),
      child: Text(
        title,
        style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.background),
      ),
    );
  }
}
