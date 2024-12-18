import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/DI/service_locator.dart';
import 'package:mobile_project/constants/language_code.dart';
import 'package:mobile_project/routers/app_router.dart';
import 'package:mobile_project/theme/app_themes.dart';



void main() async {
  await configureDependencies();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale(LanguageCode.en),
        Locale(LanguageCode.lo),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale(LanguageCode.lo),
      child: const TagWizardApp()));
}

class TagWizardApp extends StatelessWidget {
  const TagWizardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mobile Project',
      theme: AppThemes.main,
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<AppRouter>().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
