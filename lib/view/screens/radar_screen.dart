import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/viewmodels/create_pin_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/user_util_view_model.dart';
import 'package:cs_smoke_app/view/screens/info_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:cs_smoke_app/view/widgets/buttons/floating_show_name_button.dart';
import 'package:cs_smoke_app/view/widgets/raw_gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../core/helper/ad_helper.dart';
import '../../core/viewmodels/util_view_model.dart';
import '../widgets/ads/ad_banner_widget.dart';
import '../widgets/appbar/app_bar_widget.dart';
import '../widgets/buttons/icon_button_close.dart';
import '../widgets/buttons/rectangle_button.dart';
import '../widgets/grid_view_widget.dart';

class RadarScreen extends StatefulWidget {
  final bool isCreationMode;

  // Creation mode params (passed from CreatePinScreen)
  final String creationMapName;
  final String creationDescription;
  final String creationVideoUrl;

  const RadarScreen({
    super.key,
    this.isCreationMode = false,
    this.creationMapName = '',
    this.creationDescription = '',
    this.creationVideoUrl = '',
  });

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> {
  BannerAd? _bannerAd;
  int bannerHeight = 0;

  bool _showInstructionText = true;
  Timer? _instructionTimer;

  @override
  void initState() {
    super.initState();
    if (!widget.isCreationMode) {
      createBannerAd();
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _instructionTimer?.cancel();
    super.dispose();
  }

  void _startInstructionTimerIfNeeded() {
    if (_instructionTimer == null && _showInstructionText) {
      _instructionTimer = Timer(const Duration(seconds: 10), () {
        if (mounted) {
          setState(() {
            _showInstructionText = false;
          });
        }
      });
    }
  }

  void createBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            if (_bannerAd != null) {
              bannerHeight = _bannerAd!.size.height;
            }
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
          bannerHeight = 0;
        },
      ),
    ).load();
  }

  // ---------------------------------------------------------------- build --

  @override
  Widget build(BuildContext context) {
    return widget.isCreationMode
        ? _buildCreationMode(context)
        : _buildNormalMode(context);
  }

  // ---------------------------------------------------------- normal mode --

  Widget _buildNormalMode(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final l10n = AppLocalizations.of(context)!;
    final String mapName =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Scaffold(
      floatingActionButton: FloatingShowNameButton(
        bannerPadding: bannerHeight.toDouble(),
        onTap: () {
          utilViewModel.toggleShowName();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AppBarWidget(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    height: utilViewModel.showNames
                        ? context.screenHeight - bannerHeight
                        : context.screenHeight -
                            (context.height20 * 12) -
                            bannerHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(context.radius20 * 2),
                        topRight: Radius.circular(context.radius20 * 2),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Global.bgColor,
                            child: Center(
                              child: RawGestureDetectorWidget(
                                child: GridViewWidget(
                                  mapName: mapName,
                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: utilViewModel.isUtilSelected
                                ? IconButtonClose(
                                    onTap: () {
                                      utilViewModel.reset();
                                    },
                                  )
                                : RectangleButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    text: l10n.goBack,
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _bannerAd != null
              ? SafeArea(
                  left: false,
                  right: false,
                  top: false,
                  child: AdBannerWidget(bannerAd: _bannerAd!))
              : Container(),
        ],
      ),
    );
  }

  // ------------------------------------------------------- creation mode --

  Widget _buildCreationMode(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final createVM = Provider.of<CreatePinViewModel>(context);

    final bool isExpanded = createVM.isSetPositions;

    if (isExpanded) {
      _startInstructionTimerIfNeeded();
    } else {
      _instructionTimer?.cancel();
      _instructionTimer = null;
      _showInstructionText = true;
    }

    final bool hasStands = createVM.activeUtil?.stands.isNotEmpty == true;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // AppBar (hidden in setPositions mode)
                AppBarWidget(),

                // Map area — expands upward when in setPositions mode
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    height: isExpanded
                        ? context.screenHeight - _bottomBarHeight(context)
                        : context.screenHeight -
                            (context.height20 * 12) -
                            _bottomBarHeight(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(context.radius20 * 2),
                        topRight: Radius.circular(context.radius20 * 2),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Global.bgColor,
                            child: Center(
                              child: RawGestureDetectorWidget(
                                // GridViewWidget owns the tap GestureDetector in
                                // creation mode via its onMapTap callback.  This
                                // ensures localPosition is in the image's own
                                // coordinate space, unaffected by the vertical
                                // centering of the map within the container.
                                child: GridViewWidget(
                                  mapName: widget.creationMapName,
                                  isCreationMode: true,
                                  creationVM: createVM,
                                  onMapTap: (dx, dy) =>
                                      _handleMapTap(context, dx, dy,
                                          createVM, utilViewModel, l10n),
                                ),
                              ),
                            ),
                          ),
                          // Instruction text overlay
                          if (isExpanded && _showInstructionText && !hasStands)
                            SafeArea(
                              bottom: false,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: context.height15),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.width15,
                                      vertical: context.height8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(
                                          context.radius10),
                                    ),
                                    child: Text(
                                      l10n.placeStandPosition, // Tap to place throw positions (max 10)
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.font16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom bar (Done / Cancel / Undo / Redo + counter)
          _CreationBottomBar(
            mapName: widget.creationMapName,
            description: widget.creationDescription,
            videoUrl: widget.creationVideoUrl,
          ),
        ],
      ),
    );
  }

  /// Handles a map tap (normalised coordinates, center-based) from GridViewWidget.
  void _handleMapTap(
    BuildContext context,
    double dx,
    double dy,
    CreatePinViewModel createVM,
    UtilViewModel utilViewModel,
    AppLocalizations l10n,
  ) {
    final pos = [dx, dy];

    if (_showInstructionText) {
      setState(() {
        _showInstructionText = false;
      });
    }

    // If a pin is already pending, move it to the new tap location.
    if (createVM.hasPending) {
      createVM.movePending(pos);
      return;
    }

    if (createVM.isSetUtil) {

      // Stage as pending — the user confirms with ✓ on the map.
      createVM.setPendingUtil(pos);
    } else {
      // setPositions mode
      if (!createVM.canAddStand) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.maxStandsReached),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
      // Stage as pending — the user confirms with ✓ on the map.
      createVM.setPendingStand(pos);
    }
  }

  double _bottomBarHeight(BuildContext context) => context.height20 * 5;
}

// ========================================================= bottom bar ====--

class _CreationBottomBar extends StatelessWidget {
  final String mapName;
  final String description;
  final String videoUrl;

  const _CreationBottomBar({
    required this.mapName,
    required this.description,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final createVM = Provider.of<CreatePinViewModel>(context);
    final userUtilVM = Provider.of<UserUtilViewModel>(context, listen: false);

    return SafeArea(
      top: false,
      child: Container(
        height: context.height20 * 5,
        color: Global.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter row
            if (createVM.isSetUtil && createVM.completedCount > 0)
              Padding(
                padding: EdgeInsets.only(bottom: context.height8),
                child: Text(
                  l10n.utilsAdded(createVM.completedCount),
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: context.font16,
                  ),
                ),
              ),

            // Button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Undo
                _BarButton(
                  icon: Icons.undo,
                  label: l10n.undo,
                  enabled: !createVM.hasPending &&
                      (createVM.isSetUtil
                          ? createVM.canUndoUtil
                          : createVM.canUndoStand),
                  onTap: () => createVM.isSetUtil
                      ? createVM.undoUtil()
                      : createVM.undoStand(),
                ),
                // Cancel
                _BarButton(
                  icon: Icons.close,
                  label: l10n.cancel,
                  enabled: true,
                  color: Colors.redAccent,
                  onTap: () => createVM.isSetPositions
                      ? createVM.cancelPositions()
                      : _confirmCancel(context, l10n),
                ),
                // Done
                _BarButton(
                  icon: Icons.check,
                  label: l10n.done,
                  enabled: !createVM.hasPending &&
                      (createVM.isSetPositions
                          ? (createVM.activeUtil?.stands.isNotEmpty ?? false)
                          : createVM.hasCompletedUtils),
                  color: Global.blue,
                  onTap: () {
                    if (createVM.isSetPositions) {
                      if (!createVM.donePositions()) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(l10n.addAtLeastOneStand)),
                        );
                      }
                    } else {
                      _confirmDone(context, l10n, createVM, userUtilVM);
                    }
                  },
                ),
                // Redo
                _BarButton(
                  icon: Icons.redo,
                  label: l10n.redo,
                  enabled: !createVM.hasPending &&
                      (createVM.isSetUtil
                          ? createVM.canRedoUtil
                          : createVM.canRedoStand),
                  onTap: () => createVM.isSetUtil
                      ? createVM.redoUtil()
                      : createVM.redoStand(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmCancel(BuildContext context, AppLocalizations l10n) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        title: Text(l10n.confirmCancel,
            style: const TextStyle(color: Colors.white)),
        content: Text(l10n.confirmCancelBody,
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.confirmNo,
                style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // close radar
              Navigator.pop(context); // close create pin screen
            },
            child: Text(l10n.confirmYes,
                style: const TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  void _confirmDone(
    BuildContext context,
    AppLocalizations l10n,
    CreatePinViewModel createVM,
    UserUtilViewModel userUtilVM,
  ) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        title: Text(l10n.confirmDone,
            style: const TextStyle(color: Colors.white)),
        content: Text(l10n.confirmDoneBody,
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.confirmNo,
                style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // close dialog
              final newUtils = createVM.finalizeSession(
                location: mapName,
                description: description,
                videoUrl: videoUrl,
              );
              await userUtilVM.addUserUtils(newUtils);

              if (!context.mounted) return;

              // Navigate to InfoScreen for the first util's first stand
              final firstUtil = newUtils.first.toUtilModel();
              final firstStand = firstUtil.stands.first;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoScreen(),
                  settings: RouteSettings(arguments: firstStand),
                ),
                (route) => route.isFirst,
              );
            },
            child: Text(l10n.confirmYes, style: TextStyle(color: Global.blue)),
          ),
        ],
      ),
    );
  }
}

class _BarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final Color? color;
  final VoidCallback onTap;

  const _BarButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        enabled ? (color ?? Colors.white) : Colors.white24;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: effectiveColor, size: context.iconSize32),
          SizedBox(height: context.height8 / 2),
          Text(
            label,
            style: TextStyle(
              color: effectiveColor,
              fontSize: context.font16,
            ),
          ),
        ],
      ),
    );
  }
}
