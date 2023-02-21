import 'package:flutter/material.dart';
import 'package:photos/api_client/api_client.dart';
import 'package:photos/models/list_photos.dart';
import 'package:photos/models/single_photo.dart';

class HomeViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  SinglePhoto? _singlePhoto;
  SinglePhoto? get singlePhoto => _singlePhoto;

  final List<ListPhotos> _photos = [];
  List<ListPhotos> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;

  Future<void> getSinglePhoto() async {
    _isLoading = true;

    _singlePhoto = await _apiClient.fetchSinglePhoto();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> getListPhotos() async {
    _isLoading = true;

    final nextPage = _currentPage += 1;

    final response = await _apiClient.fetchPhotos(nextPage);
    _photos.addAll(response);

    _isLoading = false;

    notifyListeners();
  }

  void loadNextPage(int index) {
    if (index < _photos.length - 1) return;
    getListPhotos();
  }
}
