import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:cs_smoke_app/core/models/info_model.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import 'package:cs_smoke_app/view/widgets/report_bottom_sheet.dart';
import 'package:provider/provider.dart';

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
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.height20),
          Consumer<RatingViewModel>(
            builder: (context, ratingViewModel, child) {
              final String? currentRating = ratingViewModel.getRating(info.videoId);
              final bool hasReported = ratingViewModel.hasReported(info.videoId);

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      currentRating == 'like' ? Icons.thumb_up : Icons.thumb_up_outlined,
                      color: currentRating == 'like' ? Colors.blue : Colors.grey,
                    ),
                    iconSize: context.iconSize32,
                    onPressed: () {
                      ratingViewModel.setRating(info.videoId, 'like');
                    },
                  ),
                  SizedBox(width: context.height15),
                  IconButton(
                    icon: Icon(
                      currentRating == 'dislike' ? Icons.thumb_down : Icons.thumb_down_outlined,
                      color: currentRating == 'dislike' ? Colors.red : Colors.grey,
                    ),
                    iconSize: context.iconSize32,
                    onPressed: () {
                      ratingViewModel.setRating(info.videoId, 'dislike');
                    },
                  ),
                  SizedBox(width: context.height15),
                  IconButton(
                    icon: Icon(
                      hasReported ? Icons.flag : Icons.flag_outlined,
                      color: hasReported ? Colors.orange : Colors.grey,
                    ),
                    iconSize: context.iconSize32,
                    onPressed: hasReported
                        ? null
                        : () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => ReportBottomSheet(videoId: info.videoId),
                            );
                          },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
