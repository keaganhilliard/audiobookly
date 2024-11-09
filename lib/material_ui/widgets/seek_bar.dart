import 'dart:async';

import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/interactive_slider/interactive_slider.dart';

class SeekBar extends StatefulWidget {
  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    this.primaryColor = Colors.deepPurple,
    this.secondaryColor = const Color.fromRGBO(128, 128, 128, 1.0),
    this.onChanged,
    this.onChangeEnd,
    this.enabled = true,
    this.padding = const EdgeInsets.all(16.0),
  });

  final EdgeInsets padding;
  final Duration? duration;
  final Duration? position;
  final Future<void> Function(Duration)? onChanged;
  final Future<void> Function(Duration)? onChangeEnd;
  final Color primaryColor;
  final Color secondaryColor;
  final bool enabled;

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
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
      enabled: widget.enabled,
      padding: widget.padding,
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
      iconGap: 4.0,
      startIcon: Text(
        Utils.getTimeValue(_dragValue ?? widget.position),
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey.shade300,
        ),
      ),
      endIcon: Text(
        "-${Utils.getTimeValue(
          (widget.duration ?? Duration.zero) -
              ((_dragValue ?? widget.position) ?? Duration.zero),
        )}",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
