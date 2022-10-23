import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';
import 'package:turkce_sozluk/product/widgets/card/snackbar_card.dart';
import '../../saved/viewmodel/saved_viewmodel.dart';
import '../service/detail_service.dart';
import '../viewmodel/detail_viewmodel.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/service/project_network_manager.dart';
import '../../../product/widgets/modal/bottom_modal_sheet.dart';
import '../../../product/widgets/shimmer/detail_modal_sheet.dart';

import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../product/widgets/shimmer/detail_meanings_list_shimmer.dart';
import '../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../product/widgets/svg.dart';

part '../module/widgets/detail_list.dart';
part '../module/widgets/detail_top.dart';
part '../module/widgets/detail_word_info_card.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      child: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          children: const [
            DetailTop(),
            DetailWordList(),
          ],
        ),
      ),
    );
  }
}
