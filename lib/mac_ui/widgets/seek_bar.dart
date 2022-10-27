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
            constraints: const BoxConstraints.expand(height: 6.0),
            child: BetterCupertinoSlider(
              configure: BetterCupertinoSliderConfigure(
                trackHorizontalPadding: 0.0,
                // thumbRadius: 5.0,
                additionalConstraints: const BoxConstraints.expand(),
                trackHeight: 6.0,
                thumbPainter: (canvas, rect) {
                  if (showPosition.value) {
                    final RRect rrect = RRect.fromRectAndRadius(
                      Rect.fromLTRB(rect.left + 5, 47, rect.right - 5, 60),
                      const Radius.circular(2.0),
                    );
                    for (final BoxShadow shadow in kBetterSliderBoxShadows) {
                      canvas.drawRRect(
                          rrect.shift(shadow.offset), shadow.toPaint());
                    }
                    canvas.drawRRect(
                      rrect.inflate(0.5),
                      Paint()..color = Colors.black.withOpacity(0.5),
                    );
                    canvas.drawRRect(
                      rrect,
                      Paint()..color = Colors.deepPurple,
                    );
                  }
                },
                trackLeftColor: Colors.deepPurple,
                trackRightColor: const Color.fromRGBO(
                    109, 109, 109, 1), // const Color.fromRGBO(0, 0, 0, 0.5),
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
          _Label(
            show: showPosition.value,
            text:
                '-${Utils.getTimeValue(duration! - (dragValue.value ?? position ?? Duration.zero))}',
            left: false,
          ),
          _Label(
            show: showPosition.value,
            text: Utils.getTimeValue(dragValue.value ?? position),
            left: true,
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final bool show;
  final String text;
  final bool left;
  const _Label({required this.show, required this.text, required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left ? 8.0 : null,
      right: left ? null : 8.0,
      bottom: 8.0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: show ? 1.0 : 0.0,
        child: Text(
          text,
          style: MacosTheme.of(context)
              .typography
              .callout
              .copyWith(color: const Color.fromRGBO(109, 109, 109, 1)),
        ),
      ),
    );
  }
}
