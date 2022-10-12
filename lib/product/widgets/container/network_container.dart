import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/service/network_change_manager.dart';

import '../../constants/enums/size_enum.dart';

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

  Future<void> fetchFirstResult() async {
    waitForScreen(() async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
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
            'internet yok',
            style: context.textTheme.titleLarge,
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
