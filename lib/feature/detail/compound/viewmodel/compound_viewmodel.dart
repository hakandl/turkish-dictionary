import '../../../../product/utils/loading.dart';
import '../../model/detail_model.dart';
import '../service/compound_service_interface.dart';

class CompoundViewModel extends LoadingStateful {
  final ICompoundService compoundService;
  static String? word;

  List<DetailModel>? detailList;

  CompoundViewModel(this.compoundService) {
    _fetchCompound();
  }

  Future<void> _fetchCompound() async {
    changeLoading;
    detailList = await compoundService.fetchCompoundData() ?? [];
    changeLoading;
    notifyListeners();
  }
}
