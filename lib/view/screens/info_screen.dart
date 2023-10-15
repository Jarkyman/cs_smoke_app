import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../core/viewmodels/util_view_model.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<String> url = ['dQw4w9WgXcQ'];

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: '',
    autoPlay: true,
    params: const YoutubePlayerParams(
      mute: true,
      enableCaption: false,
      showControls: true,
      enableKeyboard: false,
      enableJavaScript: true,
      showFullscreenButton: true,
      showVideoAnnotations: false,
      loop: true,
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
    final info = ModalRoute.of(context)!.settings.arguments as InfoModel;
    final utilViewModel = Provider.of<UtilViewModel>(context);
    _controller.loadVideoById(videoId: info.videoId);

    return Scaffold(
      backgroundColor: Global.bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String url = await _controller.videoUrl;
          Share.share(
              "Check out this ${utilViewModel.selectedUtil!.name}: $url");
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF000a1a), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Color(0xFF002259).withOpacity(0.6),
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              child: Text(
                info.description,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF002259).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF000a1a), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'Go Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
