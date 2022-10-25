import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/constants/enums/size_enum.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widgets/dialog/show_dialog.dart';

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

class _HistoryViewState extends State<HistoryView> with TurkishDictionaryShowDialog {
  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryViewModel>(
      viewModel: HistoryViewModel(),
      onPageBuilder: (context, value) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(TurkishDictionaryStringConstants.history).listenable(),
          builder: (context, _, __) {
            return Scaffold(
              appBar: _appBar(context, value),
              body: value.historyWordBox.length >= 1 ? const _HistoryList() : _emptyHistoryList(),
            );
          },
        );
      },
    );
  }

  AppBar _appBar(BuildContext context, HistoryViewModel value) {
    return AppBar(
      title: Text(LocaleKeys.history_history.tr()),
      actions: [
        _deleteButton(context, value),
      ],
    );
  }

  TurkishDictionaryCircleElevatedButton _deleteButton(BuildContext context, HistoryViewModel value) {
    return TurkishDictionaryCircleElevatedButton(
        backgroundColor: Colors.transparent,
        elevation: SizeEnum.zero.value,
        onPressed: () {
          showTurkishDictionaryShowDialog(context,
              title: LocaleKeys.info_deleteAll.tr(), content: LocaleKeys.history_deleteAllHistory.tr(), yesButton: () {
            value.historyWordBox.clear();
            context.pop();
          });
        },
        child: value.historyWordBox.isNotEmpty ? _trashIcon(context) : const SizedBox.shrink());
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
    return BaseView<HistoryViewModel>(
      viewModel: HistoryViewModel(),
      onPageBuilder: (context, value) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(TurkishDictionaryStringConstants.history).listenable(),
          builder: (context, _, __) {
            return _list(context, value);
          },
        );
      },
    );
  }

  ListView _list(BuildContext context, HistoryViewModel value) {
    return ListView.builder(
      padding: context.paddingLow,
      itemCount: value.historyWordBox.length,
      itemBuilder: (context, index) {
        return DismissibleWidget(
          dismissibleKey: value.historyWordBox.getAt(index),
          title: value.historyWordBox.getAt(index) ?? TurkishDictionaryStringConstants.empty,
          onDismissed: (direction) => value.historyWordBox.deleteAt(index),
          onTap: () {
            DetailViewModel.word = value.historyWordBox.getAt(index);
            context.router.navigate(const DetailTabBarRoute());
          },
        );
      },
    );
  }
}
