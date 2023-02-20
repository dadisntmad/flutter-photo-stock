import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photos/mock/categories.dart';
import 'package:photos/view_models/discover_view_model.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    context.read<DiscoverViewModel>().getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DiscoverViewModel>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const _AppBarContent(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: _CategoryList(),
          ),
          SliverMasonryGrid.count(
            childCount: model.photos.length,
            crossAxisCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return _ListPhotos(index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  const _AppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search by Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 170,
            child: GridView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 170 / 270,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    print(category.text);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(
                          category.imageUrl,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ListPhotos extends StatelessWidget {
  final int index;
  const _ListPhotos({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoverViewModel>();
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
