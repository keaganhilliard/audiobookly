import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AbGridView extends HookWidget {
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
  Widget build(context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
          largeTitle: Text(title),
          brightness: Brightness.dark,
          previousPageTitle: previousPageTitle,
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
