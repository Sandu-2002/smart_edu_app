import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class TopBlueHeader extends StatelessWidget {
  final double height;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool showGlow;
  final bool showBottomCurve;

  const TopBlueHeader({
    super.key,
    required this.child,
    this.height = AppSizes.headerHeight,
    this.padding = const EdgeInsets.fromLTRB(0, 0, 0, 0),
    this.showGlow = true,
    this.showBottomCurve = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryBlue, AppColors.primaryBlueDark],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(showBottomCurve ? 34 : 0),
          bottomRight: Radius.circular(showBottomCurve ? 34 : 0),
        ),
        boxShadow: showGlow
            ? const [
                BoxShadow(
                  color: Color(0x33243F97),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          if (showGlow) ...[
            Positioned(
              top: -35,
              right: -25,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),
            Positioned(
              bottom: -45,
              left: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
          ],
          SafeArea(
            bottom: false,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
