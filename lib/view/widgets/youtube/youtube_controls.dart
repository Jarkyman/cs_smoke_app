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
      padding: EdgeInsets.all(context.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            info.description,
            style: TextStyle(
              fontSize: context.font26,
            ),
          ),
        ],
      ),
    );
  }
}
