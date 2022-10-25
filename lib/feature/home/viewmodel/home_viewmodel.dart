import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/constants/enums/string/string_constants.dart';
import '../../../product/utils/loading.dart';
import '../model/content_model.dart';
import '../service/content_service_interface.dart';

class HomeViewModel extends LoadingStateful {
  final IContentService contentService;
  late final Box themeChangeBox = Hive.box(TurkishDictionaryStringConstants.settings);

  List<Word>? word;
  List<Proverb>? proverb;
  List<Syyd>? syyd;
  List<Rule>? rule;

  HomeViewModel(this.contentService) {
    _fetchContentList();
  }

  Future<void> _fetchContentList() async {
    changeLoading;
    word = (await contentService.fetchContentModel())?.word ?? [];
    proverb = (await contentService.fetchContentModel())?.proverb ?? [];
    syyd = (await contentService.fetchContentModel())?.syyd ?? [];
    rule = (await contentService.fetchContentModel())?.rule ?? [];
    changeLoading;
    notifyListeners();
  }
}
