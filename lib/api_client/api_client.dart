import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:photos/models/list_photos.dart';
import 'package:photos/models/single_photo.dart';

class ApiClient {
  final _httpClient = http.Client();
  final _apiKey = dotenv.env['API_KEY'];
  static const _baseUrl = 'https://api.unsplash.com';

  Future<SinglePhoto> fetchSinglePhoto() async {
    final response = await _httpClient.get(Uri.parse(
        '$_baseUrl/photos/random?orientation=landscape&client_id=$_apiKey'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return SinglePhoto.fromJson(result);
    } else {
      throw Exception('Failed to load a single photo');
    }
  }

  Future<List<ListPhotos>> fetchPhotos() async {
    final response =
        await _httpClient.get(Uri.parse('$_baseUrl/photos?client_id=$_apiKey'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List;
      return result.map((photo) => ListPhotos.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to load list photos');
    }
  }
}
