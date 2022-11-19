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
  final Color primaryColor;
  final Color secondaryColor;

  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    this.primaryColor = Colors.deepPurple,
    this.secondaryColor = const Color.fromRGBO(128, 128, 128, 1.0),
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
                trackLeftColor: primaryColor,
                trackRightColor: secondaryColor.withOpacity(0.15)),
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
            style: TextStyle(
              fontSize: 15.0,
              color: secondaryColor,
            ),
          ),
        ),
        Positioned(
          left: 8.0,
          bottom: 0.0,
          child: Text(
            Utils.getTimeValue(dragValue.value ?? position),
            style: TextStyle(
              fontSize: 15.0,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
