import 'dart:async';

import 'package:audiobookly/utils/utils.dart';
// import 'package:better_cupertino_slider/better_cupertino_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:audiobookly/utils/interactive_slider/interactive_slider.dart';

class SeekBar2 extends StatefulWidget {
  final Duration? duration;
  final Duration? position;
  final Future<void> Function(Duration)? onChanged;
  final Future<void> Function(Duration)? onChangeEnd;
  final Color primaryColor;
  final Color secondaryColor;

  const SeekBar2({
    super.key,
    required this.duration,
    required this.position,
    this.primaryColor = Colors.deepPurple,
    this.secondaryColor = const Color.fromRGBO(128, 128, 128, 1.0),
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  State<SeekBar2> createState() => _SeekBar2State();
}

class _SeekBar2State extends State<SeekBar2> {
  final InteractiveSliderController _controller =
      InteractiveSliderController(0.0);
  Duration? _dragValue;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller.value = (widget.position?.inMilliseconds.toDouble() ?? 0.0) /
        (widget.duration?.inMilliseconds.toDouble() ?? 1.0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.duration != null && !_isDragging) {
      _controller.value = (widget.position?.inMilliseconds.toDouble() ?? 0.0) /
          widget.duration!.inMilliseconds.toDouble();
    }
    return InteractiveSlider(
      min: 0.0,
      max: widget.duration!.inMilliseconds.toDouble(),
      unfocusedMargin: EdgeInsets.all(0),
      unfocusedOpacity: 0.8,
      foregroundColor: widget.primaryColor,
      backgroundColor: Colors.grey.withOpacity(0.1),
      iconColor: Colors.white,
      controller: _controller,
      onDragStart: () {
        setState(() {
          _isDragging = true;
        });
      },
      onDragStop: () {
        setState(() {
          _isDragging = false;
          _dragValue = null;
        });
      },
      onChanged: (value) {
        if (_isDragging) {
          setState(() {
            _dragValue = Duration(milliseconds: (value.round()));
          });
        }
        widget.onChanged?.call(Duration(milliseconds: (value.round())));
      },
      onProgressUpdated: (value) async {
        await widget.onChangeEnd?.call(Duration(milliseconds: (value).round()));
      },
      iconPosition: IconPosition.below,
      startIcon: Text(
        Utils.getTimeValue(_dragValue ?? widget.position),
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey.shade300,
        ),
      ),
      endIcon: Text(
        "-${Utils.getTimeValue((widget.duration ?? Duration.zero) - ((_dragValue ?? widget.position) ?? Duration.zero))}",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
