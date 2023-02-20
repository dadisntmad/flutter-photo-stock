import 'package:flutter/material.dart';
import 'package:photos/api_client/api_client.dart';
import 'package:photos/models/single_photo.dart';

class PhotoDetailedViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  SinglePhoto? _photo;
  SinglePhoto? get photo => _photo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final String photoId;

  PhotoDetailedViewModel(this.photoId);

  Future<void> getPhotoById() async {
    _isLoading = true;

    _photo = await _apiClient.fetchPhotoById(photoId);

    _isLoading = false;

    notifyListeners();
  }
}
