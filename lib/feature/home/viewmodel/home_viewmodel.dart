import 'package:flutter/cupertino.dart';
import 'package:turkce_sozluk/feature/home/model/content_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../service/content_service_interface.dart';

class HomeViewModel extends ChangeNotifier {
  final IContentService contentService;
  static PageController? pageController = PageController();

  List<Kelime>? kelime;
  List<Atasoz>? atasoz;
  List<Syyd>? syyd;
  List<Kural>? kural;

  HomeViewModel(this.contentService) {
    _fetchContentList();
  }

  Future<void> _fetchContentList() async {
    kelime = (await contentService.fetchContentModel())?.kelime ?? [];
    atasoz = (await contentService.fetchContentModel())?.atasoz ?? [];
    syyd = (await contentService.fetchContentModel())?.syyd ?? [];
    kural = (await contentService.fetchContentModel())?.kural ?? [];
    notifyListeners();
  }

  Future<void> openUrl(String url) async {
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  }
}
