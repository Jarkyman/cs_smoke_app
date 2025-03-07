import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class YoutubePlayerStateSection extends StatelessWidget {
  const YoutubePlayerStateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      builder: (context, value) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: _getStateColor(value.playerState),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(Dimensions.height8),
          child: Text(
            value.playerState.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }
}
