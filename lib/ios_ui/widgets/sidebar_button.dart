import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SidebarButton extends ConsumerWidget {
  const SidebarButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
        child: const Icon(
          CupertinoIcons.sidebar_left,
        ),
        onPressed: () {
          ref.read(showSidebarProvider.notifier).state =
              !ref.read(showSidebarProvider);
        });
  }
}
