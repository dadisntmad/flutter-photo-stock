import 'package:flutter/material.dart';
import 'package:photos/api_client/api_client.dart';
import 'package:photos/models/list_photos.dart';

class DiscoverViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  List<ListPhotos> _photos = [];
  List<ListPhotos> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPhotos() async {
    _isLoading = true;

    _photos = await _apiClient.fetchRandomPhotos();

    _isLoading = false;

    notifyListeners();
  }
}
