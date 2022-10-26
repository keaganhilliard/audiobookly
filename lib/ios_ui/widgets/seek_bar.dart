import 'package:audiobookly/utils/utils.dart';
import 'package:better_cupertino_slider/better_cupertino_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';

class SeekBar extends HookWidget {
  final Duration? duration;
  final Duration? position;
  final Future<void> Function(Duration)? onChanged;
  final Future<void> Function(Duration)? onChangeEnd;

  const SeekBar({
    required this.duration,
    required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final dragValue = useState<Duration?>(null);
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(height: 60),
          child: BetterCupertinoSlider(
            configure: BetterCupertinoSliderConfigure(
                thumbRadius: 5.0,
                trackHeight: 10,
                thumbPainter: (canvas, rect) {},
                trackLeftColor: Colors.deepPurple,
                trackRightColor: const Color.fromRGBO(128, 128, 128, 0.15)),
            // thumbColor: Colors.deepPurple,
            // activeColor: Colors.deepPurple,
            min: 0.0,
            max: duration!.inMilliseconds.toDouble(),
            value: min(
              dragValue.value?.inMilliseconds.toDouble() ??
                  position?.inMilliseconds.toDouble() ??
                  0,
              duration!.inMilliseconds.toDouble(),
            ),
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
        ),
        Positioned(
          right: 8.0,
          bottom: 0.0,
          child: Text(
            Utils.getTimeValue(duration),
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(128, 128, 128, 1.0),
            ),
          ),
        ),
        Positioned(
          left: 8.0,
          bottom: 0.0,
          child: Text(
            Utils.getTimeValue(dragValue.value ?? position),
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(128, 128, 128, 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
