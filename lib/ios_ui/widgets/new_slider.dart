import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// An iOS-style slider.
///
/// Used to select from a range of values.
///
class BetterCupertinoSlider extends StatefulWidget {
  /// Creates an iOS-style slider.
  ///
  /// The slider itself does not maintain any state. Instead, when the state of
  /// the slider changes, the widget calls the [onChanged] callback. Most widgets
  /// that use a slider will listen for the [onChanged] callback and rebuild the
  /// slider with a new [value] to update the visual appearance of the slider.
  ///
  /// * [value] determines currently selected value for this slider.
  /// * [onChanged] is called when the user selects a new value for the slider.
  /// * [onChangeStart] is called when the user starts to select a new value for
  ///   the slider.
  /// * [onChangeEnd] is called when the user is done selecting a new value for
  ///   the slider.
  const BetterCupertinoSlider({
    super.key,
    required this.value,
    required this.configure,
    this.onTapDown,
    this.onTapUp,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
  }) : assert(value >= min && value <= max);

  final double value;

  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;

  final ValueChanged<double>? onChanged;

  final ValueChanged<double>? onChangeStart;

  final ValueChanged<double>? onChangeEnd;

  final double min;

  final double max;

  final BetterCupertinoSliderConfigure configure;

  @override
  // ignore: library_private_types_in_public_api
  _BetterCupertinoSliderState createState() => _BetterCupertinoSliderState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('value', value));
    properties.add(DoubleProperty('min', min));
    properties.add(DoubleProperty('max', max));
  }
}

class _BetterCupertinoSliderState extends State<BetterCupertinoSlider>
    with TickerProviderStateMixin {
  void _handleChanged(double value) {
    assert(widget.onChanged != null);
    final double lerpValue = lerpDouble(widget.min, widget.max, value)!;
    if (lerpValue != widget.value) {
      widget.onChanged!(lerpValue);
    }
  }

  void _handleDragStart(double value) {
    assert(widget.onChangeStart != null);
    widget.onChangeStart!(lerpDouble(widget.min, widget.max, value)!);
  }

  void _handleDragEnd(double value) {
    assert(widget.onChangeEnd != null);
    widget.onChangeEnd!(lerpDouble(widget.min, widget.max, value)!);
  }

  @override
  Widget build(BuildContext context) {
    return _BetterCupertinoSliderRenderObjectWidget(
      value: (widget.value - widget.min) / (widget.max - widget.min),
      configure: widget.configure,
      onChanged: widget.onChanged != null ? _handleChanged : null,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onChangeStart: widget.onChangeStart != null ? _handleDragStart : null,
      onChangeEnd: widget.onChangeEnd != null ? _handleDragEnd : null,
      vsync: this,
    );
  }
}

class _BetterCupertinoSliderRenderObjectWidget extends LeafRenderObjectWidget {
  const _BetterCupertinoSliderRenderObjectWidget({
    Key? key,
    required this.value,
    required this.configure,
    this.onTapDown,
    this.onTapUp,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    required this.vsync,
  }) : super(key: key);

  final double value;
  final BetterCupertinoSliderConfigure configure;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final TickerProvider vsync;

  @override
  _BetterRenderCupertinoSlider createRenderObject(BuildContext context) {
    return _BetterRenderCupertinoSlider(
      value: value,
      configure: configure,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onChanged: onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
      vsync: vsync,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _BetterRenderCupertinoSlider renderObject) {
    renderObject
      ..value = value
      ..configure = configure
      ..onChanged = onChanged
      ..onChangeStart = onChangeStart
      ..onChangeEnd = onChangeEnd
      ..textDirection = Directionality.of(context);
    // Ticker provider cannot change since there's a 1:1 relationship between
    // the _SliderRenderObjectWidget object and the _SliderState object.
  }
}

const Duration _kDiscreteTransitionDuration = Duration(milliseconds: 500);

const double _kAdjustmentUnit =
    0.1; // Matches iOS implementation of material slider.

class _BetterRenderCupertinoSlider extends RenderConstrainedBox {
  _BetterRenderCupertinoSlider({
    required double value,
    required BetterCupertinoSliderConfigure configure,
    ValueChanged<double>? onChanged,
    this.onTapDown,
    this.onTapUp,
    this.onChangeStart,
    this.onChangeEnd,
    required TickerProvider vsync,
    required TextDirection textDirection,
  })  : assert(value >= 0.0 && value <= 1.0),
        _value = value,
        _configure = configure,
        _onChanged = onChanged,
        _textDirection = textDirection,
        super(additionalConstraints: configure.additionalConstraints) {
    final GestureArenaTeam team = GestureArenaTeam();
    _drag = HorizontalDragGestureRecognizer()
      ..team = team
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd;
    _tap = TapGestureRecognizer()
      ..team = team
      ..onTapDown = _handleTapDown
      ..onTapUp = _handleTapUp
      ..onTapCancel = _endInteraction;
    _position = AnimationController(
      value: value,
      duration: _kDiscreteTransitionDuration,
      vsync: vsync,
    )..addListener(markNeedsPaint);
  }

  double get value => _value;
  double _value;

  set value(double newValue) {
    assert(newValue >= 0.0 && newValue <= 1.0);
    if (newValue == _value) return;
    _value = newValue;
    _position.value = newValue;
    markNeedsSemanticsUpdate();
  }

  BetterCupertinoSliderConfigure get configure => _configure;
  BetterCupertinoSliderConfigure _configure;

  set configure(BetterCupertinoSliderConfigure newConfigure) {
    if (configure == newConfigure) return;
    _configure = newConfigure;
    markNeedsSemanticsUpdate();
  }

  ValueChanged<double>? get onChanged => _onChanged;
  ValueChanged<double>? _onChanged;

  set onChanged(ValueChanged<double>? value) {
    if (value == _onChanged) return;
    final bool wasInteractive = isInteractive;
    _onChanged = value;
    if (wasInteractive != isInteractive) markNeedsSemanticsUpdate();
  }

  ValueChanged<double>? onChangeStart;
  ValueChanged<double>? onChangeEnd;
  VoidCallback? onTapDown;
  VoidCallback? onTapUp;

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;

  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsPaint();
  }

  late AnimationController _position;

  late HorizontalDragGestureRecognizer _drag;
  late TapGestureRecognizer _tap;

  double _currentDragValue = 0.0;

  double get _discretizedCurrentDragValue {
    double dragValue = _currentDragValue.clamp(0.0, 1.0);
    return dragValue;
  }

  double get _trackLeft => configure.trackHorizontalPadding;
  double get _trackHeight => configure.trackHeight;

  double get _trackRight => size.width - configure.trackHorizontalPadding;

  double get _thumbCenter {
    double visualPosition;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - _value;
        break;
      case TextDirection.ltr:
        visualPosition = _value;
        break;
    }
    return lerpDouble(_trackLeft + configure.thumbRadius,
        _trackRight - configure.thumbRadius, visualPosition)!;
  }

  bool get isInteractive => onChanged != null;

  void _handleDragStart(DragStartDetails details) =>
      _startInteraction(details.globalPosition);

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      final double extent = math.max(
          configure.trackHorizontalPadding,
          size.width -
              2.0 * (configure.trackHorizontalPadding + configure.thumbRadius));
      final double valueDelta = details.primaryDelta! / extent;
      switch (textDirection) {
        case TextDirection.rtl:
          _currentDragValue -= valueDelta;
          break;
        case TextDirection.ltr:
          _currentDragValue += valueDelta;
          break;
      }
      onChanged!(_discretizedCurrentDragValue);
    }
  }

  void _handleDragEnd(DragEndDetails details) => _endInteraction();

  void _handleTapDown(TapDownDetails details) {
    onTapDown?.call();
    _startInteraction(details.globalPosition);
  }

  void _handleTapUp(TapUpDetails details) {
    onTapUp?.call();
    _endInteraction();
  }

  double _getValueFromVisualPosition(double visualPosition) {
    switch (textDirection) {
      case TextDirection.rtl:
        return 1.0 - visualPosition;
      case TextDirection.ltr:
        return visualPosition;
    }
  }

  double _getValueFromGlobalPosition(Offset globalPosition) {
    final double visualPosition =
        (globalToLocal(globalPosition).dx - _trackLeft) / _trackRight;
    return _getValueFromVisualPosition(visualPosition);
  }

  void _startInteraction(Offset globalPosition) {
    if (isInteractive) {
      if (onChangeStart != null) {
        onChangeStart!(_discretizedCurrentDragValue);
      }
      if (configure.useRelative) {
        _currentDragValue = _value;
      } else {
        _currentDragValue = _getValueFromGlobalPosition(globalPosition);
      }
      onChanged!(_discretizedCurrentDragValue);
    }
  }

  void _endInteraction() {
    if (onChangeEnd != null) {
      onChangeEnd!(_discretizedCurrentDragValue);
    }
    _currentDragValue = 0.0;
  }

  @override
  bool hitTestSelf(Offset position) {
    if (configure.useTapGesture || configure.useRelative) {
      return true;
    } else {
      return (position.dx - _thumbCenter).abs() <
          configure.thumbRadius + configure.trackHorizontalPadding;
    }
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent && isInteractive) {
      // We need to add the drag first so that it has priority.
      _drag.addPointer(event);
      _tap.addPointer(event);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    double visualPosition;
    Color leftColor;
    Color rightColor;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - _position.value;
        leftColor = configure.trackRightColor;
        rightColor = configure.trackLeftColor;
        break;
      case TextDirection.ltr:
        visualPosition = _position.value;
        leftColor = configure.trackLeftColor;
        rightColor = configure.trackRightColor;
        break;
    }

    final double trackCenter = offset.dy + size.height / 2.0;
    final double trackLeft = offset.dx + _trackLeft;
    final double trackTop = trackCenter - configure.trackHeight / 2.0;
    final double trackBottom = trackCenter + configure.trackHeight / 2.0;
    final double trackRight = offset.dx + _trackRight;
    final double trackActive = offset.dx + _thumbCenter;

    final Canvas canvas = context.canvas;

    if (visualPosition > 0.0) {
      final Paint paint = Paint()..color = leftColor;

      if (visualPosition != 1.0) {
        canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTRB(trackLeft, trackTop, trackActive, trackBottom),
            topLeft: Radius.circular(configure.trackHeight),
            bottomLeft: Radius.circular(configure.trackHeight),
          ),
          paint,
        );
      } else {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(trackLeft, trackTop, trackRight, trackBottom),
            Radius.circular(configure.trackHeight),
          ),
          paint,
        );
      }
    }

    if (visualPosition < 1.0) {
      final Paint paint = Paint()..color = rightColor;
      if (visualPosition != 0.0) {
        canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTRB(trackActive, trackTop, trackRight, trackBottom),
            topRight: Radius.circular(configure.trackHeight),
            bottomRight: Radius.circular(configure.trackHeight),
          ),
          paint,
        );
      } else {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(trackLeft, trackTop, trackRight, trackBottom),
            Radius.circular(configure.trackHeight),
          ),
          paint,
        );
      }
    }

    final Offset thumbCenter = Offset(trackActive, trackCenter);

    configure.thumbPainter(
      canvas,
      Rect.fromCircle(center: thumbCenter, radius: configure.thumbRadius),
    );
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    config.isSemanticBoundary = isInteractive;
    if (isInteractive) {
      config.textDirection = textDirection;
      config.onIncrease = _increaseAction;
      config.onDecrease = _decreaseAction;
      config.value = '${(value * 100).round()}%';
      config.increasedValue =
          '${((value + _semanticActionUnit).clamp(0.0, 1.0) * 100).round()}%';
      config.decreasedValue =
          '${((value - _semanticActionUnit).clamp(0.0, 1.0) * 100).round()}%';
    }
  }

  double get _semanticActionUnit => _kAdjustmentUnit;

  void _increaseAction() {
    if (isInteractive) {
      onChanged!((value + _semanticActionUnit).clamp(0.0, 1.0));
    }
  }

  void _decreaseAction() {
    if (isInteractive) {
      onChanged!((value - _semanticActionUnit).clamp(0.0, 1.0));
    }
  }
}

typedef BetterCupertinoThumbPainter = Function(Canvas canvas, Rect rect);

void defaultThumbPainter(Canvas canvas, Rect rect) {
  final RRect rrect = RRect.fromRectAndRadius(
    rect,
    Radius.circular(rect.shortestSide / 2.0),
  );
  const Color borderColor = Color(0x08000000);

  // draw shadow
  for (final BoxShadow shadow in kBetterSliderBoxShadows) {
    canvas.drawRRect(rrect.shift(shadow.offset), shadow.toPaint());
  }

  // draw border
  canvas.drawRRect(
    rrect.inflate(0.5),
    Paint()..color = borderColor,
  );

  // draw background
  canvas.drawRRect(rrect, Paint()..color = Colors.white);
}

const List<BoxShadow> kBetterSliderBoxShadows = <BoxShadow>[
  BoxShadow(
    color: Color(0x33000000),
    offset: Offset(0, 2),
    blurRadius: 1.0,
  ),
];

class BetterCupertinoSliderConfigure {
  final BoxConstraints additionalConstraints;

  final bool useTapGesture;
  final bool useRelative;

  final double trackHorizontalPadding;
  final double trackHeight;
  final Color trackLeftColor;
  final Color trackRightColor;

  final double thumbRadius;
  final BetterCupertinoThumbPainter thumbPainter;

  const BetterCupertinoSliderConfigure({
    this.additionalConstraints =
        const BoxConstraints.tightFor(width: 176.0, height: 28.0),
    this.useTapGesture = true,
    this.useRelative = true,
    this.trackHorizontalPadding = 8.0,
    this.trackHeight = 4.0,
    this.trackLeftColor = const Color(0xFFFF6B26),
    this.trackRightColor = const Color(0xFFE3E9EF),
    this.thumbRadius = 8.0,
    this.thumbPainter = defaultThumbPainter,
  });

  BetterCupertinoSliderConfigure copyWith({
    BoxConstraints? additionalConstraints,
    bool? useTapGesture,
    bool? useRelative,
    double? trackHorizontalPadding,
    double? trackHeight,
    Color? trackLeftColor,
    Color? trackRightColor,
    double? thumbRadius,
    BetterCupertinoThumbPainter? thumbPainter,
  }) {
    return BetterCupertinoSliderConfigure(
      additionalConstraints:
          additionalConstraints ?? this.additionalConstraints,
      useTapGesture: useTapGesture ?? this.useTapGesture,
      useRelative: useRelative ?? this.useRelative,
      trackHorizontalPadding:
          trackHorizontalPadding ?? this.trackHorizontalPadding,
      trackHeight: trackHeight ?? this.trackHeight,
      trackLeftColor: trackLeftColor ?? this.trackLeftColor,
      trackRightColor: trackRightColor ?? this.trackRightColor,
      thumbRadius: thumbRadius ?? this.thumbRadius,
      thumbPainter: thumbPainter ?? this.thumbPainter,
    );
  }
}
