import 'package:flutter/material.dart';
import 'package:cs_smoke_app/view/shared/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareTutorialDialog extends StatelessWidget {
  const ShareTutorialDialog({super.key});

  static Future<void> showIfNeeded(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeen = prefs.getBool('has_seen_share_tutorial') ?? false;

    if (!hasSeen) {
      // Delay slightly so the UI finishes building before showing the dialog
      await Future.delayed(const Duration(milliseconds: 500));
      if (context.mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const ShareTutorialDialog(),
        );
        await prefs.setBool('has_seen_share_tutorial', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Global.bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: three overlapping social icons
            SizedBox(
              height: 90,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // TikTok – left, slightly lower, slightly rotated
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Transform.rotate(
                      angle: -0.25,
                      child: _socialIcon('assets/icons/tiktok.png', 62),
                    ),
                  ),
                  // YouTube – right, slightly lower, slightly rotated the other way
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Transform.rotate(
                      angle: 0.22,
                      child: _socialIcon('assets/icons/youtube.png', 62),
                    ),
                  ),
                  // Instagram – center, on top, biggest
                  Positioned(
                    top: 0,
                    child: _socialIcon('assets/icons/instagram.png', 74),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Title
            const Text(
              '✨ New Feature',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5B9EF4),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Save your favorite\nlineups in one place',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              'Found a sick smoke on Instagram, TikTok or YouTube? Share it directly to Util Master and always know where to find it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade400,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),

            // Steps
            _buildStep(
              icon: Icons.ondemand_video,
              title: '1. Find a video',
              description: 'Watch a cool lineup on your favorite social app.',
            ),
            const SizedBox(height: 16),
            _buildStep(
              icon: Icons.ios_share,
              title: '2. Tap Share',
              description: 'Hit the share button on Instagram, TikTok, etc.',
            ),
            const SizedBox(height: 16),
            _buildStep(
              icon: Icons.add_to_home_screen,
              title: '3. Choose Util Master',
              description:
                  'Select our app from the list, then create your pin in Util Master.',
            ),

            const SizedBox(height: 32),

            // Button – matches RectangleButton (Go Back) style
            Material(
              color: const Color(0xFF002259).withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF000a1a),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Got it!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(String assetPath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.play_circle_outline,
          color: Colors.white54,
          size: 32,
        ),
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
