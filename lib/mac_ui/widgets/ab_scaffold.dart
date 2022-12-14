import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:macos_ui/macos_ui.dart';

final crossCountProvider = StateProvider((ref) => 3);

class AbScaffold extends HookConsumerWidget {
  final Widget child;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  AbScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosScaffold(
      toolBar: const ToolBar(
        height: 32.0,
        dividerColor: MacosColors.transparent,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return LayoutBuilder(builder: (context, constraints) {
              debouncer.run(() {
                ref.read(crossCountProvider.notifier).state =
                    (constraints.maxWidth / 180).round();
              });
              return CustomScrollView(
                slivers: [
                  child,
                ],
              );
            });
          },
        ),
      ],
    );
  }
}
