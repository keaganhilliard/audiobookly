import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RefresherStateNotifier<T> extends StateNotifier<T> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  RefresherStateNotifier(super.initial) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshKey.currentState?.show();
    });
  }

  @override
  void dispose() {
    refreshKey.currentState?.dispose();
    super.dispose();
  }
}
