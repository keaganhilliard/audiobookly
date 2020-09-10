import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SeekBar extends StatefulWidget {
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
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slider(
          activeColor: Theme.of(context).accentColor,
          min: 0.0,
          label: RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                  .firstMatch("$_dragPosition")
                  ?.group(1) ??
              '$_dragPosition',
          max: widget.duration.inMilliseconds.toDouble(),
          value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
              widget.duration.inMilliseconds.toDouble()),
          onChanged: (value) {
            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) async {
            if (widget.onChangeEnd != null) {
              await widget.onChangeEnd(Duration(milliseconds: value.round()));
            }
            _dragValue = null;
          },
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                      .firstMatch("$_duration")
                      ?.group(1) ??
                  '$_duration',
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

  Duration get _dragPosition =>
      Duration(milliseconds: _dragValue?.toInt() ?? 0);
  Duration get _duration => widget.duration;
  Duration get _position => _dragValue == null
      ? widget.position
      : Duration(milliseconds: _dragValue?.toInt() ?? 0);
}
