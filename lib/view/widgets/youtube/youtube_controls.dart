import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../core/models/info_model.dart';

class YoutubeControls extends StatelessWidget {
  ///
  const YoutubeControls({super.key});

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as InfoModel;
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15),
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
                fontSize: Dimensions.font26,
              ),
            ),
          ),
          //Spacer(),
        ],
      ),
    );
  }
}
