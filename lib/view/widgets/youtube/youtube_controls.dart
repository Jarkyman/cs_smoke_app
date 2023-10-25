import 'package:flutter/material.dart';

import '../../../core/models/info_model.dart';

class YoutubeControls extends StatelessWidget {
  ///
  const YoutubeControls();

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as InfoModel;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*YoutubeVideoPositionSeekAndPlay(),
          const SizedBox(height: 10);,*/ //TODO: Vriker som en ligegyldig ting at have, hvis showControles ikke kan slåes til på fullscreen
          //PlayerStateSection(),
          Container(
            child: Text(
              info.description,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          //Spacer(),
        ],
      ),
    );
  }
}
