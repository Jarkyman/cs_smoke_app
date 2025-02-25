import 'dart:developer';
import 'dart:io';

import 'package:cs_smoke_app/core/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:rate_my_app/rate_my_app.dart';

class Review {
  static final RateMyApp rateMyApp = RateMyApp(
    minDays: 5,
    minLaunches: 15,
    remindDays: 3,
    remindLaunches: 8,
    googlePlayIdentifier: Constants.ANDROID_ID,
    appStoreIdentifier: Constants.IOS_ID,
  );

  static void checkReviewPopup(BuildContext context) {
    if (rateMyApp.shouldOpenDialog) {
      rateMyApp.showRateDialog(
        context,
        title: 'Enjoying Util Master?',
        message: 'Help us out with a quick rating! Your feedback matters.',
        rateButton: 'RATE',
        noButton: 'NO THANKS',
        laterButton: 'MAYBE LATER',
        listener: (button) {
          switch (button) {
            case RateMyAppDialogButton.rate:
              log('Clicked on "Rate".');
              break;
            case RateMyAppDialogButton.later:
              log('Clicked on "Later".');
              break;
            case RateMyAppDialogButton.no:
              log('Clicked on "No".');
              break;
          }

          return true; // Return false if you want to cancel the click event.
        },
        ignoreNativeDialog: Platform.isAndroid,
        onDismissed: () =>
            rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
      );
    }
  }
}
