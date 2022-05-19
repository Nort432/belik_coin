import 'package:flutter/material.dart';

import 'src/config/app_routes/app_route.dart';
import 'src/config/app_themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocalizations.supportedLocales.first,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes(),
      theme: AppTheme.myLight,
      darkTheme: AppTheme.myDark,
      themeMode: ThemeMode.system,
    );
  }
}