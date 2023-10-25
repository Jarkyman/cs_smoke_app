import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class YoutubeVideoPositionIndicator extends StatelessWidget {
  ///
  const YoutubeVideoPositionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return StreamBuilder<YoutubeVideoState>(
      stream: controller.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        final position = snapshot.data?.position.inMilliseconds ?? 0;
        final duration = controller.metadata.duration.inMilliseconds;

        return LinearProgressIndicator(
          color: Colors.white,
          value: duration == 0 ? 0 : position / duration,
          minHeight: Dimensions.stroke1,
        );
      },
    );
  }
}
