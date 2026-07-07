import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:cs_smoke_app/l10n/app_localizations.dart';
import 'package:cs_smoke_app/core/helper/dimensions.dart';
import 'package:cs_smoke_app/core/viewmodels/create_pin_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cs_smoke_app/core/models/enums.dart';
import 'package:cs_smoke_app/view/screens/radar_screen.dart';
import 'package:cs_smoke_app/core/viewmodels/util_view_model.dart';

class CreatePinScreen extends StatefulWidget {
  /// If non-null, the URL field is pre-filled and locked (share intent mode).
  final String? prefillUrl;

  const CreatePinScreen({super.key, this.prefillUrl});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _urlController;
  final TextEditingController _descController = TextEditingController();
  String? _selectedMap;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(text: widget.prefillUrl ?? '');
  }

  @override
  void dispose() {
    _urlController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (!_formKey.currentState!.validate()) return;
    final createPinVM = CreatePinViewModel();
    final utilVM = Provider.of<UtilViewModel>(context, listen: false);
    utilVM.reset();
    utilVM.toggleUtil(UtilType.smoke, Team.t);

    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(arguments: _selectedMap),
        builder: (_) => ChangeNotifierProvider<CreatePinViewModel>.value(
          value: createPinVM,
          child: RadarScreen(
            isCreationMode: true,
            creationMapName: _selectedMap!,
            creationDescription: _descController.text.trim(),
            creationVideoUrl: _urlController.text.trim(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        backgroundColor: Global.bgColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: context.iconSize24,
        ),
        title: Text(
          l10n.createPin,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.font20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: context.width20,
              vertical: context.height20,
            ),
            children: [
              // --- Video URL ---
              Text(
                l10n.videoUrl,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.font16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height8),
              TextFormField(
                controller: _urlController,
                readOnly: widget.prefillUrl != null,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.url,
                autocorrect: false,
                decoration: _inputDecoration(
                  hint: 'https://youtube.com/...',
                  icon: Icons.link,
                  locked: widget.prefillUrl != null,
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? l10n.videoUrl : null,
              ),

              SizedBox(height: context.height25),

              // --- Description ---
              Text(
                '${l10n.description} (optional)',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.font16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height8),
              TextFormField(
                controller: _descController,
                style: const TextStyle(color: Colors.white),
                decoration: _inputDecoration(
                  hint: 'e.g. A Site smoke',
                  icon: Icons.edit_outlined,
                ),
              ),

              SizedBox(height: context.height25),

              // --- Map selector (visual grid) ---
              Text(
                l10n.selectMap,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.font16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height8),
              _MapGrid(
                selected: _selectedMap,
                onSelected: (map) => setState(() => _selectedMap = map),
              ),
              if (_selectedMap == null && _formKey.currentState != null)
                Padding(
                  padding: EdgeInsets.only(top: context.height8),
                  child: Text(
                    l10n.selectMap,
                    style:
                        const TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ),

              SizedBox(height: context.height50),

              // --- Next button ---
              SizedBox(
                height: context.height20 * 2.5,
                child: ElevatedButton(
                  onPressed: _onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Global.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.radius10),
                    ),
                  ),
                  child: Text(
                    l10n.next,
                    style: TextStyle(
                      fontSize: context.font16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    bool locked = false,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white24, fontSize: context.font16),
      prefixIcon: Icon(icon, color: Colors.white54, size: context.iconSize24),
      suffixIcon: locked
          ? Icon(Icons.lock_outline,
              color: Colors.white38, size: context.iconSize24)
          : null,
      filled: true,
      fillColor: Colors.grey.shade900,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.radius10),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.radius10),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.radius10),
        borderSide: BorderSide(color: Global.blue, width: context.stroke2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.radius10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.radius10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}

// ============================================================== map grid --

class _MapGrid extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelected;

  const _MapGrid({required this.selected, required this.onSelected});

  // Returns the util-type color accent for each map (subtle decoration)
  Color _accentFor(String map) {
    final h = map.hashCode;
    // deterministic accent per map from a curated palette
    const palette = [
      Color(0xFF1565C0), // blue
      Color(0xFF4CAF50), // green
      Color(0xFFE91E63), // pink
      Color(0xFFFF9800), // orange
      Color(0xFF9C27B0), // purple
      Color(0xFF00BCD4), // cyan
      Color(0xFFFFEB3B), // yellow
      Color(0xFFF44336), // red
      Color(0xFF009688), // teal
      Color(0xFF795548), // brown
    ];
    return palette[h.abs() % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 16 / 9,
      ),
      itemCount: Global.maps.length,
      itemBuilder: (context, i) {
        final map = Global.maps[i];
        final isSelected = map == selected;
        final accent = _accentFor(map);

        return Semantics(
          button: true,
          selected: isSelected,
          label: 'Select map $map',
          child: GestureDetector(
            onTap: () => onSelected(map),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.radius10),
                border: Border.all(
                  color: isSelected ? accent : Colors.transparent,
                  width: isSelected ? 2.5 : 0,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: accent.withValues(alpha: 0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                        )
                      ]
                    : null,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/maps/CS2_${map.toLowerCase()}_map.png',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? Colors.black.withValues(alpha: 0.15)
                        : Colors.black.withValues(alpha: 0.45),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  // Selected checkmark
                  if (isSelected)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: accent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  // Map name at bottom
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: context.height8 * 0.6,
                        horizontal: context.width10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(context.radius10),
                          bottomRight: Radius.circular(context.radius10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.85),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        map,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: context.font16,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
