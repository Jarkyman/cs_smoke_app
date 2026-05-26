import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/viewmodels/rating_view_model.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';

class ReportBottomSheet extends StatefulWidget {
  final String videoId;

  const ReportBottomSheet({super.key, required this.videoId});

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  bool _outdatedVideo = false;
  bool _wrongData = false;
  bool _videoNotWorking = false;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: EdgeInsets.all(context.height20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reportVideo,
            style: TextStyle(
              fontSize: context.font20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.height20),
          CheckboxListTile(
            title: Text(l10n.outdatedVideo),
            value: _outdatedVideo,
            activeColor: Global.blue,
            onChanged: (val) {
              setState(() {
                _outdatedVideo = val ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(l10n.wrongData),
            value: _wrongData,
            activeColor: Global.blue,
            onChanged: (val) {
              setState(() {
                _wrongData = val ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(l10n.videoNotWorking),
            value: _videoNotWorking,
            activeColor: Global.blue,
            onChanged: (val) {
              setState(() {
                _videoNotWorking = val ?? false;
              });
            },
          ),
          SizedBox(height: context.height20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: context.height15),
              ),
              onPressed: _isSubmitting || (!_outdatedVideo && !_wrongData && !_videoNotWorking)
                  ? null
                  : () async {
                      setState(() {
                        _isSubmitting = true;
                      });
                      
                      List<String> reasons = [];
                      if (_outdatedVideo) reasons.add('report_outdated_video');
                      if (_wrongData) reasons.add('report_wrong_data');
                      if (_videoNotWorking) reasons.add('report_video_broken');

                      await Provider.of<RatingViewModel>(context, listen: false)
                          .submitReport(widget.videoId, reasons);
                      
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.reportSubmitted)),
                        );
                      }
                    },
              child: _isSubmitting 
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : Text(l10n.submitReport),
            ),
          ),
        ],
      ),
    );
  }
}
