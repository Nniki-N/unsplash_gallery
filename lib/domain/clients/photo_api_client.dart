import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:unsplash_gallery/domain/configuration/configuration.dart';
import 'package:unsplash_gallery/domain/entity/unsplash_photo.dart';

class PhotoApiClient {
  Uri _createUri({required String path, Map<String, dynamic>? parameters}) {
    final uri = Uri.parse('${Configuration.host}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<List<UnsplashPhoto>> fetchImages({required int page}) async {
    try {
      final uri = _createUri(
        path: 'photos/',
        parameters: <String, dynamic>{
          'client_id': Configuration.accessKey,
          'page': page.toString(),
          'per_page': 30.toString(),
        },
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final result = (json.decode(response.body) as List)
            .map((e) => UnsplashPhoto.fromJson(e))
            .toList();

        return result;
      } else {
        throw ('some error');
      }
    } catch (e) {
      return [];
    }
  }
}
