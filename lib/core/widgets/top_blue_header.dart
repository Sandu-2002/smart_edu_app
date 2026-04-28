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
    this.padding = const EdgeInsets.fromLTRB(28, 20, 28, 26),
    this.showGlow = true,
    this.showBottomCurve = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
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
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(showBottomCurve ? 34 : 0),
          bottomRight: Radius.circular(showBottomCurve ? 34 : 0),
        ),
        child: Stack(
          children: [
            if (showGlow) ...[
              Positioned(
                top: -65,
                right: -60,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.07),
                  ),
                ),
              ),
              Positioned(
                bottom: -95,
                left: -95,
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04),
                  ),
                ),
              ),
            ],
            SafeArea(
              bottom: false,
              child: Padding(
                padding: padding,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
