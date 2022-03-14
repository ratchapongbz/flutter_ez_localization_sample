import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';

class CustomHttpAssetLoader extends AssetLoader {
  const CustomHttpAssetLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    try {
      final targetUrl = Uri.parse('$path/${locale.languageCode}');
      final response = await http.get(targetUrl);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      print('localization http loader load failed with error: ${e.toString()}');
      return null;
    }
  }
}
