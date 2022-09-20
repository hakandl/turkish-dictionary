import 'package:flutter/cupertino.dart';
import 'package:turkce_sozluk/feature/home/model/content_model.dart';

import '../service/content_service_interface.dart';

class HomeViewModel extends ChangeNotifier {
  final IContentService contentService;
  List<Kelime>? kelime;
  List<Atasoz>? atasoz;

  HomeViewModel(this.contentService) {
    _fetchContentList();
  }

  Future<void> _fetchContentList() async {
    kelime = (await contentService.fetchContentModel())?.kelime ?? [];
    atasoz = (await contentService.fetchContentModel())?.atasoz ?? [];
    notifyListeners();
  }
}
