import 'package:flutter/material.dart';

class FloatingShareButton extends StatelessWidget {
  const FloatingShareButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFF000a1a), width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xFF002259).withOpacity(0.6),
      child: Icon(
        Icons.share,
        color: Colors.white,
      ),
    );
  }
}
