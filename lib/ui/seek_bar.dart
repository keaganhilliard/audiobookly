import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';

class SeekBar extends HookWidget {
  final Duration duration;
  final Duration position;
  final Future<void> Function(Duration) onChanged;
  final Future<void> Function(Duration) onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final _dragValue = useState<double>(null);
    final _dragPosition =
        Duration(milliseconds: _dragValue.value?.toInt() ?? 0);
    final _position = _dragValue.value == null
        ? position
        : Duration(milliseconds: _dragValue.value?.toInt() ?? 0);
    return Stack(
      children: [
        Slider(
          activeColor: Theme.of(context).accentColor,
          min: 0.0,
          label: RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                  .firstMatch("$_dragPosition")
                  ?.group(1) ??
              '$_dragPosition',
          max: duration.inMilliseconds.toDouble(),
          value: min(_dragValue.value ?? position.inMilliseconds.toDouble(),
              duration.inMilliseconds.toDouble()),
          onChanged: (value) {
            _dragValue.value = value;
            if (onChanged != null) {
              onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) async {
            if (onChangeEnd != null && _dragValue.value != null) {
              await onChangeEnd(Duration(milliseconds: value.round()));
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
