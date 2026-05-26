import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/cupertino.dart';

class RadarViewModel extends ChangeNotifier {
  /// The minimum scale limit for the interactive map (1.0 = no zoom).
  static const double minScale = 1.0;

  /// The threshold at which the map is considered "zoomed in" (2.0 = 2x zoom).
  static const double scaleThreshold = 2.0;

  /// The maximum scale limit for the interactive map (4.0 = 4x zoom).
  static const double maxScale = 4.0;

  double _scale = minScale;
  double? _posScale;
  double? _utilScale;
  double _previousScale = minScale;
  Pos _pos = Pos(0.0, 0.0);
  Pos _previousPos = Pos(0.0, 0.0);
  Pos _endPos = Pos(0.0, 0.0);
  bool _isScaled = false;

  double get scale => _scale;
  double posScale(BuildContext context) => _posScale ?? context.position;
  double utilScale(BuildContext context) => _utilScale ?? context.utility;
  double get previousScale => _previousScale;
  Pos get pos => _pos;
  Pos get previousPos => _previousPos;
  Pos get endPos => _endPos;
  bool get isScaled => _isScaled;

  bool _hasTouched = false;
  bool get hasTouched => _hasTouched;
  set hasTouched(bool value) {
    _hasTouched = value;
    notifyListeners();
  }

  void handleDragScaleStart(ScaleStartDetails details) {
    _hasTouched = true;
    _previousScale = _scale;
    _previousPos.x = (details.focalPoint.dx / _scale) - _endPos.x;
    _previousPos.y = (details.focalPoint.dy / _scale) - _endPos.y;
    notifyListeners();
  }

  void handleDragScaleUpdate(ScaleUpdateDetails details) {
    _scale = _previousScale * details.scale;
    if (_scale > scaleThreshold) {
      _isScaled = true;
    } else {
      _isScaled = false;
    }

    if (_scale < minScale) {
      _scale = minScale;
    } else if (_scale > maxScale) {
      _scale = maxScale;
    } else if (_previousScale == _scale) {
      _pos.x = (details.focalPoint.dx / _scale) - _previousPos.x;
      _pos.y = (details.focalPoint.dy / _scale) - _previousPos.y;
    }
    notifyListeners();
  }

  void handleDragScalePositionUpdate(
      ScaleUpdateDetails details, BuildContext context) {
    if (scale > maxScale) {
      _posScale = (context.position / 2); // Minimumsværdien for posScale
    } else {
      // Beregn posScale baseret på en lineær sammenhæng med scale
      _posScale = _interpolate(scale, minScale, context.position, maxScale,
          (context.position / 2)); // Justér efter behov
    }
    notifyListeners();
  }

  void handleDragScaleUtilUpdate(
      ScaleUpdateDetails details, BuildContext context) {
    if (scale > maxScale) {
      _utilScale = (context.utility / 2); // Minimumsværdien for posScale
    } else {
      // Beregn posScale baseret på en lineær sammenhæng med scale
      _utilScale = _interpolate(scale, minScale, context.utility, maxScale,
          (context.utility / 2)); // Justér efter behov
    }
    notifyListeners();
  }

  double _interpolate(double x, double x1, double y1, double x2, double y2) {
    return y1 + ((y2 - y1) / (x2 - x1)) * (x - x1);
  }

  void reset() {
    _scale = minScale;
    _posScale = null;
    _utilScale = null;
    _previousScale = minScale;
    _pos = Pos(0.0, 0.0);
    _previousPos = Pos(0.0, 0.0);
    _endPos = Pos(0.0, 0.0);
    _isScaled = false;
    notifyListeners();
  }

  void handleDragScaleEnd() {
    _previousScale = minScale;
    _endPos = _pos;
    notifyListeners();
  }
}

class Pos {
  double x = 0.0;
  double y = 0.0;

  Pos(this.x, this.y);
}
