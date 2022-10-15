import 'package:flutter/cupertino.dart';
import '../model/content_model.dart';
import '../../../product/utils/loading.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../service/content_service_interface.dart';

class HomeViewModel extends LoadingStateful {
  final IContentService contentService;
  static PageController? pageController = PageController();

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

  Future<void> openUrl(String url) async {
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  }
}
