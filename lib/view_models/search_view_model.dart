import 'package:flutter/material.dart';
import 'package:photos/api_client/api_client.dart';
import 'package:photos/models/list_photos.dart';

class SearchViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final String searchQuery;

  SearchViewModel(this.searchQuery);

  final List<ListPhotos> _photos = [];
  List<ListPhotos> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;

  Future<void> getSearchResults() async {
    _isLoading = true;

    final nextPage = _currentPage += 1;

    final response = await _apiClient.fetchSearchResult(searchQuery, nextPage);
    _photos.addAll(response.results);

    _isLoading = false;

    notifyListeners();
  }
}
