import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';

class SeekBar extends HookWidget {
  final Duration? duration;
  final Duration? position;
  final Future<void> Function(Duration)? onChanged;
  final Future<void> Function(Duration)? onChangeEnd;

  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final dragValue = useState<Duration?>(null);
    final dragPosition = dragValue.value ?? position;
    return Stack(
      children: [
        Slider(
          activeColor: Theme.of(context).colorScheme.primary,
          min: 0.0,
          label: Utils.getTimeValue(dragValue.value),
          max: duration!.inMilliseconds.toDouble(),
          value: min(
              dragValue.value?.inMilliseconds.toDouble() ??
                  position?.inMilliseconds.toDouble() ??
                  0,
              duration!.inMilliseconds.toDouble()),
          onChanged: (value) {
            dragValue.value = Duration(milliseconds: value.round());
            if (onChanged != null) {
              onChanged!(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) async {
            if (onChangeEnd != null && dragValue.value != null) {
              await onChangeEnd!(Duration(milliseconds: value.round()));
            }
            dragValue.value = null;
          },
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(Utils.getTimeValue(duration),
              style: Theme.of(context).textTheme.bodySmall),
        ),
        Positioned(
          left: 16.0,
          bottom: 0.0,
          child: Text(Utils.getTimeValue(dragPosition),
              style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
