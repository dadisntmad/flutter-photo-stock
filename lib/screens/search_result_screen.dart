import 'package:flutter/material.dart';
import 'package:photos/navigation/navigation.dart';
import 'package:photos/view_models/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<SearchViewModel>().getSearchResults();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<SearchViewModel>().getSearchResults();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: Text(
          model.searchQuery,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: model.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: model.photos.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < model.photos.length) {
                  return _ListPhotos(index: index);
                } else {
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
    );
  }
}

class _ListPhotos extends StatelessWidget {
  final int index;
  const _ListPhotos({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<SearchViewModel>();
    final photo = model.photos[index];

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              NavigationRoute.detailed,
              arguments: photo.id,
            );
          },
          child: Image.network(photo.urls.regular),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            photo.user.username,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
