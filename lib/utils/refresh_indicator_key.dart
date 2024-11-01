import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _RefreshIndicatorKey extends Hook<GlobalKey<RefreshIndicatorState>> {
  const _RefreshIndicatorKey();

  @override
  _RefreshIndicatorKeyState createState() => _RefreshIndicatorKeyState();
}

class _RefreshIndicatorKeyState
    extends HookState<GlobalKey<RefreshIndicatorState>, _RefreshIndicatorKey> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  bool initialized = false;

  @override
  void initHook() {
    super.initHook();
    Future.delayed(const Duration(milliseconds: 1), () {
      if (!initialized) {
        initialized = true;
        refreshKey.currentState?.show();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  GlobalKey<RefreshIndicatorState> build(BuildContext context) {
    return refreshKey;
  }
}

GlobalKey<RefreshIndicatorState> useRefreshIndicatorKey() {
  return use(_RefreshIndicatorKey());
}
