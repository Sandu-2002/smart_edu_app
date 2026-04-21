import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';

class SmartEduApp extends StatelessWidget {
  const SmartEduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Smart Edu',
      theme: AppTheme.lightTheme,
      routerConfig: buildAppRouter(isWeb: kIsWeb),
    );
  }
}
