import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/cupertino.dart';

class RadarViewModel extends ChangeNotifier {
  double _scale = 1.0;
  double _posScale = Dimensions.position;
  double _utilScale = Dimensions.utility;
  double _previousScale = 1.0;
  Pos _pos = Pos(0.0, 0.0);
  Pos _previousPos = Pos(0.0, 0.0);
  Pos _endPos = Pos(0.0, 0.0);
  bool _isScaled = false;

  double get scale => _scale;
  double get posScale => _posScale;
  double get utilScale => _utilScale;
  double get previousScale => _previousScale;
  Pos get pos => _pos;
  Pos get previousPos => _previousPos;
  Pos get endPos => _endPos;
  bool get isScaled => _isScaled;

  bool _hasTouched = false;
  bool get hasTouched => _hasTouched;
  set hasTouched(value) {
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
    if (_scale > 2.0) {
      _isScaled = true;
    } else {
      _isScaled = false;
    }

    if (_scale < 1.0) {
      _scale = 1.0;
    } else if (_scale > 4.0) {
      _scale = 4.0;
    } else if (_previousScale == _scale) {
      _pos.x = (details.focalPoint.dx / _scale) - _previousPos.x;
      _pos.y = (details.focalPoint.dy / _scale) - _previousPos.y;
    }
    notifyListeners();
  }

  void handleDragScalePositionUpdate(ScaleUpdateDetails details) {
    if (scale > 4.0) {
      _posScale = (Dimensions.position / 2); // Minimumsværdien for posScale
    } else {
      // Beregn posScale baseret på en lineær sammenhæng med scale
      _posScale = _interpolate(scale, 1, Dimensions.position, 4,
          (Dimensions.position / 2)); // Justér efter behov
    }
    notifyListeners();
  }

  void handleDragScaleUtilUpdate(ScaleUpdateDetails details) {
    if (scale > 4.0) {
      _utilScale = (Dimensions.utility / 2); // Minimumsværdien for posScale
    } else {
      // Beregn posScale baseret på en lineær sammenhæng med scale
      _utilScale = _interpolate(scale, 1, Dimensions.utility, 4,
          (Dimensions.utility / 2)); // Justér efter behov
    }
    notifyListeners();
  }

  double _interpolate(double x, double x1, double y1, double x2, double y2) {
    return y1 + ((y2 - y1) / (x2 - x1)) * (x - x1);
  }

  void reset() {
    _scale = 1.0;
    _posScale = Dimensions.position;
    _utilScale = Dimensions.utility;
    _previousScale = 1.0;
    _pos = Pos(0.0, 0.0);
    _previousPos = Pos(0.0, 0.0);
    _endPos = Pos(0.0, 0.0);
    _isScaled = false;
    notifyListeners();
  }

  void handleDragScaleEnd() {
    _previousScale = 1.0;
    _endPos = _pos;
    notifyListeners();
  }
}

class Pos {
  double x = 0.0;
  double y = 0.0;

  Pos(x, y) {
    this.x = x;
    this.y = y;
  }
}
