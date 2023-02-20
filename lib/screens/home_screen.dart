import 'package:flutter/material.dart';
import 'package:photos/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HomeViewModel>().getSinglePhoto();
    context.read<HomeViewModel>().getListPhotos();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<HomeViewModel>().getListPhotos();
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
    final model = context.watch<HomeViewModel>();

    const textStyle = TextStyle(color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          width: 75,
          height: 75,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          final photo = model.singlePhoto;
          return [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${photo?.urls.regular}',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Photo',
                          style: textStyle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('by', style: textStyle),
                      const SizedBox(width: 4),
                      Text('${photo?.user.username}', style: textStyle),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
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
      ),
    );
  }
}

class _ListPhotos extends StatelessWidget {
  final int index;
  const _ListPhotos({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewModel>();
    final photo = model.photos[index];
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.network(
            photo.urls.regular,
          ),
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
