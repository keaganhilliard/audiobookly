import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/ios_ui/widgets/sidebar_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbGridView extends HookConsumerWidget {
  const AbGridView({
    super.key,
    required this.title,
    required this.onRefresh,
    required this.child,
    this.previousPageTitle,
    this.onSearchChanged,
  });
  final String title;
  final Future Function() onRefresh;
  final Widget child;
  final String? previousPageTitle;
  final Function(String)? onSearchChanged;

  @override
  Widget build(context, ref) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
          largeTitle: Text(title),
          brightness: Brightness.dark,
          previousPageTitle: previousPageTitle,
          leading: !ref.watch(showSidebarProvider) && previousPageTitle == null
              ? const SidebarButton()
              : null,
        ),
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        if (onSearchChanged != null)
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              // onSuffixTap: () => print('cleared'),
              onChanged: onSearchChanged,
            ),
          )),
        child,
        const SliverToBoxAdapter(child: BottomPadding()),
      ],
    );
  }
}
