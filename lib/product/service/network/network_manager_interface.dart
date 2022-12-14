import '../../constants/enums/network/network_result_enum.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkChangeManager {
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}
