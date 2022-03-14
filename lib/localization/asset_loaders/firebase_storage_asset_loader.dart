import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:easy_localization/easy_localization.dart';

class FirebaseStorageAssetLoader extends AssetLoader {
  const FirebaseStorageAssetLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final downloadUrl = await storage.ref('/${locale.languageCode}.json').getDownloadURL();
      if (downloadUrl.isNotEmpty) {
        final response = await http.get(Uri.parse(downloadUrl));

        if (response.statusCode == 200) {
          return json.decode(utf8.decode(response.bodyBytes));
        }
      }
      return null;
    } catch (e) {
      print('localization firebase storage loader load failed with error: ${e.toString()}');
      return null;
    }
  }
}
