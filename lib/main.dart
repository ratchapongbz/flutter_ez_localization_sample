import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_localization_sample/home_page.dart';
import 'package:flutter_ez_localization_sample/localization/providers/localization_provider.dart';
import 'package:flutter_ez_localization_sample/localization/utils/custom_http_asset_loader.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const EzLocalizationApp());
}

class EzLocalizationApp extends StatelessWidget {
  const EzLocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('th'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      path: 'https://mock-localization-api.herokuapp.com/localization',
      assetLoader: const CustomHttpAssetLoader(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LocalizationProvider())],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomePage(),
      ),
    );
  }
}
