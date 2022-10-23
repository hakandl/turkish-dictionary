import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import 'package:turkce_sozluk/product/widgets/dialog/show_dialog.dart';

import '../../../product/constants/enums/string/string_constants.dart';
import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/init/navigator/app_router.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/dismissible_card.dart';
import '../../../product/widgets/container/icon_text_info_widget.dart';
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
      valueListenable: Hive.box(TurkceSozlukStringConstants.history).listenable(),
      builder: (context, value, child) {
        return Scaffold(
          appBar: _appBar(context),
          body:
              context.watch<HistoryViewModel>().historyWordBox.length >= 1 ? const _HistoryList() : _emptyHistoryList(),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.history_history.tr()),
      actions: [
        _deleteButton(context),
      ],
    );
  }

  TurkceSozlukCircleElevatedButton _deleteButton(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
        backgroundColor: Colors.transparent,
        elevation: SizeEnum.zero.value,
        onPressed: () {
          showTurkceSozlukShowDialog(context,
              title: LocaleKeys.info_deleteAll.tr(), content: LocaleKeys.history_deleteAllHistory.tr(), yesButton: () {
            context.read<HistoryViewModel>().historyWordBox.clear();
            context.pop();
          });
        },
        child:
            context.read<HistoryViewModel>().historyWordBox.isNotEmpty ? _trashIcon(context) : const SizedBox.shrink());
  }

  Padding _trashIcon(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SvgWidget(icon: SvgNameEnum.trash.icon),
    );
  }

  Center _emptyHistoryList() {
    return Center(
      child: IconAndTextInfoWidget(
        text: LocaleKeys.history_historyInfo.tr(),
        icon: SvgNameEnum.history.icon,
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(TurkceSozlukStringConstants.history).listenable(),
      builder: (context, value, child) {
        return _list(context);
      },
    );
  }

  ListView _list(BuildContext context) {
    return ListView.builder(
      padding: context.paddingLow,
      itemCount: context.watch<HistoryViewModel>().historyWordBox.length,
      itemBuilder: (context, index) {
        return DismissibleWidget(
          dismissibleKey: context.watch<HistoryViewModel>().historyWordBox.getAt(index),
          title: context.watch<HistoryViewModel>().historyWordBox.getAt(index) ?? TurkceSozlukStringConstants.empty,
          onDismissed: (direction) => context.read<HistoryViewModel>().historyWordBox.deleteAt(index),
          onTap: () {
            DetailViewModel.word = context.read<HistoryViewModel>().historyWordBox.getAt(index);
            context.router.navigate(const DetailTabBarRoute());
          },
        );
      },
    );
  }
}
