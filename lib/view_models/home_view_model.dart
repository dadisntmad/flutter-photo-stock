import 'package:flutter/material.dart';
import 'package:photos/api_client/api_client.dart';
import 'package:photos/models/list_photos.dart';
import 'package:photos/models/single_photo.dart';

class HomeViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  SinglePhoto? _singlePhoto;
  SinglePhoto? get singlePhoto => _singlePhoto;

  List<ListPhotos> _photos = [];
  List<ListPhotos> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getSinglePhoto() async {
    _isLoading = true;

    _singlePhoto = await _apiClient.fetchSinglePhoto();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> getListPhotos() async {
    _isLoading = true;

    _photos = await _apiClient.fetchPhotos();

    _isLoading = false;

    notifyListeners();
  }
}
