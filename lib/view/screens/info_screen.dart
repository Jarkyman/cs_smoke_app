import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<String> url = ['dQw4w9WgXcQ'];

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'dQw4w9WgXcQ',
    autoPlay: true,
    params: const YoutubePlayerParams(
      mute: true,
      captionLanguage: 'en',
      enableCaption: false,
      pointerEvents: PointerEvents.initial,
      color: 'black',
      showControls: true,
      enableKeyboard: false,
      enableJavaScript: true,
      showFullscreenButton: true,
      interfaceLanguage: 'en',
      showVideoAnnotations: false,
      loop: true,
      origin: 'https://www.youtube.com',
      playsInline: true,
      strictRelatedVideos: true,
    ),
  );

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayerScaffold(
        controller: _controller,
        builder: (context, player) {
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                /*if (kIsWeb && constraints.maxWidth > 750) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            player,
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Controls(),
                        ),
                      ),
                    ],
                  );
                }*/

                return ListView(
                  children: [
                    player,
                    Container(
                      child: Text('Description'),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
