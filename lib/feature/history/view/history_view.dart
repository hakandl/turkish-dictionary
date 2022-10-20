import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import 'package:turkce_sozluk/product/widgets/dialog/show_dialog.dart';

import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/init/navigator/app_router.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/dismissible_card.dart';
import '../../../product/widgets/container/empty_value_view.dart';
import '../../../product/widgets/svg.dart';
import '../../detail/viewmodel/detail_viewmodel.dart';
import '../viewmodel/history_viewmodel.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> with TurkceSozlukShowDialog {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('history').listenable(),
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.history_history.tr()),
              actions: [
                TurkceSozlukCircleElevatedButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: context.read<HistoryViewModel>().historyWordBox.isNotEmpty
                        ? () {
                            showTurkceSozlukShowDialog(context,
                                title: LocaleKeys.info_deleteAll.tr(),
                                content: LocaleKeys.history_deleteAllHistory.tr(), yesButton: () {
                              context.read<HistoryViewModel>().historyWordBox.clear();
                              context.pop();
                            });
                          }
                        : null,
                    child: context.read<HistoryViewModel>().historyWordBox.isNotEmpty
                        ? Padding(
                            padding: context.paddingLow,
                            child: SvgWidget(icon: SvgNameEnum.trash.icon, color: context.colorScheme.background),
                          )
                        : const SizedBox.shrink()),
              ],
            ),
            body: context.watch<HistoryViewModel>().historyWordBox.length >= 1
                ? ListView.builder(
                    padding: context.paddingLow,
                    itemCount: context.watch<HistoryViewModel>().historyWordBox.length,
                    itemBuilder: (context, index) {
                      return DismissibleWidget(
                        dismissibleKey: context.watch<HistoryViewModel>().historyWordBox.getAt(index),
                        title: context.watch<HistoryViewModel>().historyWordBox.getAt(index) ?? '',
                        onDismissed: (direction) => context.read<HistoryViewModel>().historyWordBox.deleteAt(index),
                        onTap: () {
                          DetailViewModel.word = context.read<HistoryViewModel>().historyWordBox.getAt(index);
                          context.router.navigate(const DetailTabBarRoute());
                        },
                      );
                    },
                  )
                : EmptyValueView(
                    text: LocaleKeys.history_historyInfo.tr(),
                    icon: false,
                  ));
      },
    );
  }
}
