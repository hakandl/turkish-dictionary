import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/svg_enum.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import 'package:turkce_sozluk/product/widgets/button/circle_elevated_button.dart';
import 'package:turkce_sozluk/product/widgets/container/icon_text_info_widget.dart';
import 'package:turkce_sozluk/product/widgets/dialog/show_dialog.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

import '../../../product/init/navigator/app_router.dart';
import '../../../product/widgets/card/dismissible_card.dart';
import '../../detail/viewmodel/detail_viewmodel.dart';
import '../viewmodel/saved_viewmodel.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> with TurkceSozlukShowDialog {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('saved').listenable(),
      builder: (context, value, child) {
        return Scaffold(
            appBar: _appBar(context),
            body: context.watch<SavedViewModel>().savedWordBox.length >= 1 ? const _SavedList() : _emptySavedView());
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.saved_saved.tr()),
      actions: [_deleteButton(context)],
    );
  }

  TurkceSozlukCircleElevatedButton _deleteButton(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      backgroundColor: Colors.transparent,
      elevation: SizeEnum.zero.value,
      onPressed: context.read<SavedViewModel>().savedWordBox.isNotEmpty
          ? () {
              showTurkceSozlukShowDialog(context,
                  title: LocaleKeys.info_deleteAll.tr(), content: LocaleKeys.saved_deleteAllSaved.tr(), yesButton: () {
                context.read<SavedViewModel>().savedWordBox.clear();
                context.pop();
              });
            }
          : null,
      child: context.read<SavedViewModel>().savedWordBox.isNotEmpty ? _trashIcon(context) : const SizedBox.shrink(),
    );
  }

  Padding _trashIcon(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SvgWidget(icon: SvgNameEnum.trash.icon),
    );
  }

  Center _emptySavedView() {
    return Center(
      child: IconAndTextInfoWidget(
        text: LocaleKeys.saved_savedInfo.tr(),
        icon: SvgNameEnum.saved.icon,
      ),
    );
  }
}

class _SavedList extends StatelessWidget {
  const _SavedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('saved').listenable(),
      builder: (context, value, child) {
        return ListView.builder(
          padding: context.paddingLow,
          itemCount: context.watch<SavedViewModel>().savedWordBox.length,
          itemBuilder: (context, index) {
            return DismissibleWidget(
              dismissibleKey: context.watch<SavedViewModel>().savedWordBox.getAt(index),
              title: context.watch<SavedViewModel>().savedWordBox.getAt(index) ?? '',
              onDismissed: (direction) => context.read<SavedViewModel>().savedWordBox.deleteAt(index),
              onTap: () {
                DetailViewModel.word = context.read<SavedViewModel>().savedWordBox.getAt(index);
                context.router.navigate(const DetailTabBarRoute());
              },
            );
          },
        );
      },
    );
  }
}
/* ValueListenableBuilder(
      valueListenable: Hive.box('saved').listenable(),
      builder: (context, value, child) {
        return Scaffold(
            appBar: _appBar(context),
            body: context.watch<SavedViewModel>().savedWordBox.length >= 1 ? const _SavedList() : _emptySavedView());
      },
    ); */