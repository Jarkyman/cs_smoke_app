import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/models/util_model.dart';
import 'package:cs_smoke_app/core/viewmodels/create_pin_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/user_util_view_model.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';
import 'package:cs_smoke_app/view/screens/info_screen.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/radar_view_model.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    super.key,
    required this.mapName,
    this.isCreationMode = false,
    this.creationVM,
    this.onMapTap,
  });

  final String mapName;
  final bool isCreationMode;
  final CreatePinViewModel? creationVM;

  /// Called when the user taps the map in creation mode.
  /// [dx] and [dy] are normalised center-based coords (same system as JSON data).
  final void Function(double dx, double dy)? onMapTap;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget>
    with SingleTickerProviderStateMixin {
  // ── Pulse animation for the pending pin ring ──────────────────────────
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    )..repeat();
    _pulseAnim = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utilViewModel = Provider.of<UtilViewModel>(context);
    final radarViewModel = Provider.of<RadarViewModel>(context);
    final userUtilViewModel = Provider.of<UserUtilViewModel>(context);

    return SizedBox(
      height: double.infinity,
      child: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // ── Filter server utils ───────────────────────────────────
              List<UtilModel> tileSmokes =
                  utilViewModel.utils.where((item) {
                if (utilViewModel.isCt) {
                  return item.location == widget.mapName.toLowerCase() &&
                      item.name == utilViewModel.util &&
                      !item.status;
                } else {
                  return item.location == widget.mapName.toLowerCase() &&
                      item.name == utilViewModel.util &&
                      item.status;
                }
              }).toList();

              // ── User utils ─────────────────────────
              final userUtils = userUtilViewModel
                  .getUserUtilsForMapAndType(
                    widget.mapName,
                    utilViewModel.util,
                    utilViewModel.isT,
                  )
                  .map((u) => u.toUtilModel())
                  .toList();

              final createVM = widget.creationVM;

              return utilViewModel.showNames
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Global.bgColor,
                          child: Image.asset(
                            'assets/img/callouts/CS2_${widget.mapName.toLowerCase()}_radar_name.png',
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        // ── Radar image ───────────────────────────────────
                        Container(
                          width: double.infinity,
                          color: Global.bgColor,
                          child: Image.asset(
                            'assets/img/radar/CS2_${widget.mapName.toLowerCase()}_radar.png',
                          ),
                        ),

                        // ── Normal mode: selected util + stands ───────────
                        if (!widget.isCreationMode &&
                            utilViewModel.isUtilSelected &&
                            utilViewModel.selectedUtil != null)
                          _buildSelectedUtil(
                            context, utilViewModel, radarViewModel)

                        // ── Normal mode: all util pins ────────────────────
                        else if (!widget.isCreationMode &&
                            !utilViewModel.isUtilSelected)
                          Stack(children: [
                            ..._buildUtilPins(context, tileSmokes,
                                radarViewModel, utilViewModel,
                                opacity: 1.0),
                            ..._buildUtilPins(context, userUtils,
                                radarViewModel, utilViewModel,
                                opacity: 1.0),
                          ])

                        // ── Creation mode ─────────────────────────────────
                        else if (widget.isCreationMode && createVM != null)
                          _buildCreationOverlay(
                            context,
                            [...tileSmokes, ...userUtils],
                            createVM,
                            radarViewModel,
                            utilViewModel,
                          ),
                      ],
                    );
            }),
      ),
    );
  }

  // ─────────────────────────── normal: selected util + stands ─────────────

  Widget _buildSelectedUtil(
    BuildContext context,
    UtilViewModel utilViewModel,
    RadarViewModel radarViewModel,
  ) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Transform.translate(
            offset: Offset(
              context.screenWidth * utilViewModel.selectedUtil!.position[0],
              context.screenWidth * utilViewModel.selectedUtil!.position[1],
            ),
            child: Semantics(
              button: true,
              label:
                  'Deselect ${utilViewModel.selectedUtil!.description} ${utilViewModel.selectedUtil!.name}',
              child: GestureDetector(
                onTap: () => utilViewModel.reset(),
                child: SizedBox(
                  height: radarViewModel.utilScale(context),
                  width: radarViewModel.utilScale(context),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/${utilViewModel.selectedUtil!.name}.png',
                      width: radarViewModel.utilScale(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: List.generate(
              utilViewModel.selectedUtil!.stands.length, (idx) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Transform.translate(
                offset: Offset(
                  context.screenWidth *
                      utilViewModel.selectedUtil!.stands[idx].position[0],
                  context.screenWidth *
                      utilViewModel.selectedUtil!.stands[idx].position[1],
                ),
                child: Semantics(
                  button: true,
                  label:
                      'Throw position: ${utilViewModel.selectedUtil!.stands[idx].description}',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoScreen(),
                          settings: RouteSettings(
                              arguments:
                                  utilViewModel.selectedUtil!.stands[idx]),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: radarViewModel.posScale(context),
                      width: radarViewModel.posScale(context),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: radarViewModel.posScale(context),
                            width: radarViewModel.posScale(context),
                            color: utilViewModel.isT
                                ? Colors.red
                                : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // ───────────────────────────── normal: util pin list ─────────────────────

  List<Widget> _buildUtilPins(
    BuildContext context,
    List<UtilModel> utils,
    RadarViewModel radarViewModel,
    UtilViewModel utilViewModel, {
    required double opacity,
  }) {
    return List.generate(utils.length, (idx) {
      return Opacity(
        opacity: opacity,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Transform.translate(
            offset: Offset(
              context.screenWidth * utils[idx].position[0],
              context.screenWidth * utils[idx].position[1],
            ),
            child: Semantics(
              button: true,
              label: 'Select ${utils[idx].description} ${utils[idx].name}',
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    utilViewModel.selectUtil(utils[idx]);
                  });
                },
                child: SizedBox(
                  height: radarViewModel.utilScale(context),
                  width: radarViewModel.utilScale(context),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/${utils[idx].name}.png',
                      width: radarViewModel.utilScale(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // ──────────────────────────────────────── creation mode overlay ───────────

  /// The GestureDetector sits directly on the image Stack so that
  /// [details.localPosition] is in the radar image's own coordinate space
  /// (0…screenWidth, origin = top-left of image).
  ///
  /// Pending pin flow:
  ///   1. First tap → sets pending (highlighted ring + ✓/✗ buttons on map)
  ///   2. Tap elsewhere → moves the pending pin
  ///   3. Tap ✓ → confirms position (places util / stand)
  ///   4. Tap ✗ → cancels, clears pending
  Widget _buildCreationOverlay(
    BuildContext context,
    List<UtilModel> existingUtils,
    CreatePinViewModel createVM,
    RadarViewModel radarViewModel,
    UtilViewModel utilViewModel,
  ) {
    final sw = context.screenWidth;
    final utilSz = radarViewModel.utilScale(context);
    final posSz = radarViewModel.posScale(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (details) {
        final lx = details.localPosition.dx;
        final ly = details.localPosition.dy;
        final dx = (lx - sw / 2.0) / sw;
        final dy = (ly - sw / 2.0) / sw;

        if (createVM.hasPending) {
          // Move pending to new tap location
          createVM.movePending([dx, dy]);
        } else {
          widget.onMapTap?.call(dx, dy);
        }
      },
      child: Stack(
        children: [
          // ── Dimmed existing server pins ─────────────────────────────────
          ..._buildUtilPins(context, existingUtils, radarViewModel,
              utilViewModel,
              opacity: 0.3),

          // ── Completed utils this session ────────────────────────────────
          ...createVM.completedUtils
              .where((tu) =>
                  tu.name == utilViewModel.util &&
                  tu.status == utilViewModel.isT)
              .map((tu) {
            return Stack(children: [
              _pin(sw, tu.position[0], tu.position[1], utilSz,
                  child: Image.asset('assets/icons/${tu.name}.png',
                      width: utilSz)),
            ]);
          }),

          // ── Active util being placed (setPositions mode) ────────────────
          if (createVM.activeUtil != null) ...[
            _pin(sw, createVM.activeUtil!.position[0],
                createVM.activeUtil!.position[1], utilSz,
                child: Image.asset(
                    'assets/icons/${createVM.activeUtil!.name}.png',
                    width: utilSz)),
            ...createVM.activeUtil!.stands.map((sp) {
              return _standSquare(sw, sp[0], sp[1], posSz,
                  color: createVM.activeUtil!.status
                      ? Colors.red.withValues(alpha: 0.8)
                      : Colors.blue.withValues(alpha: 0.8));
            }),
          ],

          // ── Pending pin (not yet confirmed) ─────────────────────────────
          if (createVM.hasPending) ...[
            _buildPendingPin(context, createVM, utilViewModel, radarViewModel, sw),
          ],
        ],
      ),
    );
  }

  // ─────────────────────────── pending pin visual ───────────────────────────

  Widget _buildPendingPin(
    BuildContext context,
    CreatePinViewModel createVM,
    UtilViewModel utilVM,
    RadarViewModel radarViewModel,
    double sw,
  ) {
    final pos = createVM.pendingPosition!;
    final utilSz = radarViewModel.utilScale(context);
    final posSz = radarViewModel.posScale(context);

    // Determine what we're placing
    final isUtil = createVM.isSetUtil;
    final pendingColor = utilVM.isT
        ? Colors.red
        : (createVM.isSetPositions
            ? (createVM.activeUtil?.status == true ? Colors.red : Colors.blue)
            : Colors.blue);

    // Button size
    const btnSize = 34.0;
    const btnSpacing = 14.0;
    final pinHalfSz = (isUtil ? utilSz : posSz) / 2;

    return Stack(
      children: [
        // ── Pulsing ring ─────────────────────────────────────────────────
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Transform.translate(
            offset: Offset(sw * pos[0], sw * pos[1]),
            child: SizedBox(
              width: utilSz,
              height: utilSz,
              child: Center(
                child: AnimatedBuilder(
                  animation: _pulseAnim,
                  builder: (context, _) {
                    final t = _pulseAnim.value;
                    final ringSize = (isUtil ? utilSz : posSz) * (1.4 + t * 1.2);
                    final opacity = (1.0 - t).clamp(0.0, 1.0);
                    return Container(
                      width: ringSize,
                      height: ringSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: opacity),
                          width: 2.5,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        // ── Pin icon / stand square ──────────────────────────────────────
        if (isUtil)
          _pin(sw, pos[0], pos[1], utilSz,
              child: Image.asset(
                'assets/icons/${utilVM.util}.png',
                width: utilSz,
              ))
        else
          _standSquare(sw, pos[0], pos[1], posSz,
              color: pendingColor.withValues(alpha: 0.9)),

        // ── Buttons ─────────────────────────────────────
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Transform.translate(
            // Translate the centered row exactly to the pin's X coordinate
            offset: Offset(
              sw * pos[0],
              sw * pos[1] + pinHalfSz + 25, // Moved slightly down
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✗ Cancel
                _PendingButton(
                  icon: Icons.close_rounded,
                  color: const Color(0xFFE53935),
                  size: btnSize,
                  onTap: () => createVM.cancelPending(),
                ),
                SizedBox(width: btnSpacing),
                // ✓ Confirm
                _PendingButton(
                  icon: Icons.check_rounded,
                  color: const Color(0xFF2E7D32),
                  size: btnSize,
                  onTap: () {
                    if (isUtil) {
                      createVM.confirmPending(name: utilVM.util, status: utilVM.isT);
                    } else {
                      createVM.confirmPending();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ──────────────────────────────── shared helpers ──────────────────────────

  /// Renders a util icon pin at the given normalised center-based position.
  Widget _pin(double sw, double px, double py, double sz,
      {required Widget child}) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Transform.translate(
        offset: Offset(sw * px, sw * py),
        child: SizedBox(
          height: sz,
          width: sz,
          child: Center(child: child),
        ),
      ),
    );
  }

  /// Renders a coloured stand square at the given normalised position.
  Widget _standSquare(double sw, double px, double py, double sz,
      {required Color color}) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Transform.translate(
        offset: Offset(sw * px, sw * py),
        child: SizedBox(
          height: sz,
          width: sz,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: sz,
                width: sz,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────── Pending confirm/cancel button ───────

/// A circular icon button used for the pending pin confirm/cancel actions.
/// Uses [HitTestBehavior.opaque] so taps are absorbed and do NOT propagate
/// to the parent overlay GestureDetector.
class _PendingButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onTap;

  const _PendingButton({
    required this.icon,
    required this.color,
    required this.size,
    required this.onTap,
  });

  @override
  State<_PendingButton> createState() => _PendingButtonState();
}

class _PendingButtonState extends State<_PendingButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.88 : 1.0,
        duration: const Duration(milliseconds: 80),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.55),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: widget.size * 0.58,
          ),
        ),
      ),
    );
  }
}
