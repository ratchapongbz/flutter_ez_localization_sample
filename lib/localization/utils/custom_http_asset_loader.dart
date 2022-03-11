import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';

class CustomHttpAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    try {
      print('localization loader load translation(${locale.languageCode}) from: $path');
      final targetUrl = Uri.parse(path);
      final response = await http.get(targetUrl);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      print('localization loader load failed with error: ${e.toString()}');
      return null;
    }
  }
}
