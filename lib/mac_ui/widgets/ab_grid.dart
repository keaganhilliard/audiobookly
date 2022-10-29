import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbGrid extends HookConsumerWidget {
  final int childCount;
  final Widget? Function(BuildContext, int) childBuilder;
  const AbGrid({
    super.key,
    required this.childCount,
    required this.childBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: childCount,
        childBuilder,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: ref.watch(crossCountProvider),
      ),
    );
  }
}
// http://139.144.170.107:13378