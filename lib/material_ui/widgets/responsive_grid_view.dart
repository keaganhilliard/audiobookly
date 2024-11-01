import 'package:flutter/material.dart';

class ResponsiveGridView<T> extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final List<T>? items;
  final Widget Function(T item) itemBuilder;
  final double itemAspectRatio;

  ResponsiveGridView({
    this.items,
    required this.itemBuilder,
    this.itemAspectRatio = 0.84,
    super.key,
  });

  @override
  Widget build(context) {
    return Center(
      child: Scrollbar(
        radius: const Radius.circular(5.0),
        controller: _controller,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            key: const PageStorageKey('responsive-grid'),
            controller: _controller,
            itemCount: items!.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: itemAspectRatio,
              maxCrossAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return itemBuilder(items![index]);
            },
          ),
        ),
      ),
    );
  }
}
