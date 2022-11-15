import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/shared/utils/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    // Locator.instance.get<VersionService>().getInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: 'Shopfy Test',
      theme: ThemeAppWidget.purple(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        FlutterI18nDelegate(
          translationLoader: E2EFileTranslationLoader(
            useCountryCode: true,
            basePath: 'assets/i18n',
            fallbackFile: 'pt_BR',
            forcedLocale: const Locale('pt', 'BR'),
          ),
        ),
        FlutterI18nDelegate(
          translationLoader: E2EFileTranslationLoader(
            useCountryCode: true,
            basePath: 'assets/i18n',
            // fallbackFile: 'en',s
            forcedLocale: const Locale('en'),
          ),
        ),
      ],
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
      ],
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
