import 'package:turkce_sozluk/product/utils/loading.dart';

import '../../model/detail_model.dart';
import '../service/proverb_service_interface.dart';

class ProverbViewModel extends LoadingStateful {
  final IProverbService proverbService;
  static String? word;

  List<DetailModel>? detailList;

  ProverbViewModel(this.proverbService) {
    _fetchProverb();
  }

  Future<void> _fetchProverb() async {
    changeLoading;
    detailList = await proverbService.fetchProverbData() ?? [];
    changeLoading;
    notifyListeners();
  }
}
