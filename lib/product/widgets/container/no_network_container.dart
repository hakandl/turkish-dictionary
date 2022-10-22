import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import '../../constants/enums/network/network_result_enum.dart';
import '../../service/network/network_manager.dart';

import '../../constants/enums/size_enum.dart';
import '../../service/network/network_manager_interface.dart';

class NoNetworkContainer extends StatefulWidget {
  const NoNetworkContainer({super.key});

  @override
  State<NoNetworkContainer> createState() => _NoNetworkContainerState();
}

class _NoNetworkContainerState extends State<NoNetworkContainer> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
  }

  void _updateView(NetworkResult result) {
    setState(() => _networkResult = result);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: context.durationLow,
      crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: SizeEnum.fifty.value,
        width: context.width,
        color: context.colorScheme.error,
        child: Center(
          child: Text(
            LocaleKeys.info_noNetwork.tr(),
            style: context.textTheme.titleMedium
                ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      secondChild: const SizedBox.shrink(),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
