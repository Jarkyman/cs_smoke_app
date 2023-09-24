import 'package:cs_smoke_app/core/viewmodels/radar_view_model.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RawGestureDetectorWidget extends StatelessWidget {
  const RawGestureDetectorWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RadarViewModel>(context);
    final Size size = MediaQuery.of(context).size;

    final _gestures = {
      DragAndScale: GestureRecognizerFactoryWithHandlers<DragAndScale>(
        () => DragAndScale(),
        (DragAndScale instance) {
          instance
            ..onStart = (details) {
              model.handleDragScaleStart(details);
            }
            ..onUpdate = (details) {
              model.handleDragScaleUpdate(details);
            }
            ..onEnd = (_) {
              model.handleDragScaleEnd();
            };
        },
      )
    };

    final AlignmentGeometry _alignment = FractionalOffset.fromOffsetAndRect(
      Offset(
        size.width / 2.0,
        size.height / 2.0,
      ),
      Rect.fromLTRB(
        0.0,
        0.0,
        size.width,
        size.height,
      ),
    );

    final Matrix4 _transform = Matrix4.diagonal3(
      Vector3(
        model.scale,
        model.scale,
        model.scale,
      ),
    )..translate(
        model.pos.x,
        model.pos.y,
      );

    return RawGestureDetector(
      gestures: _gestures,
      child: Container(
        color: Global.bgColor,
        child: Transform(
          alignment: _alignment,
          transform: _transform,
          child: ScrollConfiguration(
            behavior: RemoveScrollGlow(),
            child: child,
          ),
        ),
      ),
    );
  }
}

class RemoveScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class DragAndScale extends ScaleGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
