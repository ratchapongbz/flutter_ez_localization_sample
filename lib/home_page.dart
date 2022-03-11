import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_localization_sample/localization/providers/localization_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ez Localization'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('hello_world'.tr()),
            ],
          ),
        ),
      ),
      floatingActionButton: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          value: context.watch<LocalizationProvider>().currentLocale,
          items: context.supportedLocales
              .map(
                (locale) => DropdownMenuItem<Locale>(
                  child: Text(locale.languageCode),
                  value: locale,
                ),
              )
              .toList(),
          onChanged: (value) async {
            if (value != null) {
              await context.read<LocalizationProvider>().changeLocale(context, value);
            }
          },
        ),
      ),
    );
  }
}
