import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';

class SeekBar extends HookWidget {
  final Duration? duration;
  final Duration? position;
  final Future<void> Function(Duration)? onChanged;
  final Future<void> Function(Duration)? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final _dragValue = useState<Duration?>(null);
    final _position = _dragValue.value ?? position;
    return Stack(
      children: [
        Slider(
          activeColor: Theme.of(context).colorScheme.primary,
          min: 0.0,
          label: RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                  .firstMatch("${_dragValue.value}")
                  ?.group(1) ??
              '${_dragValue.value}',
          max: duration!.inMilliseconds.toDouble(),
          value: min(
              _dragValue.value?.inMilliseconds.toDouble() ??
                  position?.inMilliseconds.toDouble() ??
                  0,
              duration!.inMilliseconds.toDouble()),
          onChanged: (value) {
            _dragValue.value = Duration(milliseconds: value.round());
            if (onChanged != null) {
              onChanged!(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) async {
            if (onChangeEnd != null && _dragValue.value != null) {
              await onChangeEnd!(Duration(milliseconds: value.round()));
            }
            _dragValue.value = null;
          },
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                      .firstMatch("$duration")
                      ?.group(1) ??
                  '$duration',
              style: Theme.of(context).textTheme.caption),
        ),
        Positioned(
          left: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                      .firstMatch("$_position")
                      ?.group(1) ??
                  '$_position',
              style: Theme.of(context).textTheme.caption),
        ),
      ],
    );
  }
}
