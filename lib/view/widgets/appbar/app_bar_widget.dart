import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/util_view_model.dart';
import 'app_bar_card.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);

    return Container(
      height: Dimensions.height20 * 12,
      child: Stack(
        children: [
          AppBarCard(
            utilViewModel: utilViewModel,
            isCt: false,
          ),
          AppBarCard(
            utilViewModel: utilViewModel,
            isCt: true,
          ),
        ],
      ),
    );
  }
}
