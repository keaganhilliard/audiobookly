import 'package:audiobookly/utils/utils.dart';
import 'package:better_cupertino_slider/better_cupertino_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:macos_ui/macos_ui.dart';

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
    final showPosition = useState(false);
    return MouseRegion(
      onEnter: (event) => showPosition.value = true,
      onExit: (event) => showPosition.value = false,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.expand(height: 5),
            child: BetterCupertinoSlider(
              configure: BetterCupertinoSliderConfigure(
                // thumbRadius: 5.0,
                additionalConstraints: const BoxConstraints.expand(),
                trackHeight: 5,
                thumbPainter: (canvas, rect) {},
                trackLeftColor: Colors.deepPurple,
                trackRightColor: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
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
          // if (showPosition.value)
          Positioned(
            right: 8.0,
            bottom: 8.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: showPosition.value ? 1.0 : 0.0,
              child: Text(
                '-${Utils.getTimeValue(duration! - (dragValue.value ?? position ?? Duration.zero))}',
                style: MacosTheme.of(context)
                    .typography
                    .callout
                    .copyWith(color: const Color.fromRGBO(109, 109, 109, 1)),
              ),
            ),
          ),
          Positioned(
            left: 8.0,
            bottom: 8.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: showPosition.value ? 1.0 : 0.0,
              child: Text(
                Utils.getTimeValue(dragValue.value ?? position),
                style: MacosTheme.of(context)
                    .typography
                    .callout
                    .copyWith(color: const Color.fromRGBO(109, 109, 109, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
