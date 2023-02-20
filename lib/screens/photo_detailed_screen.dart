import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photos/view_models/photo_detailed_view_model.dart';
import 'package:provider/provider.dart';

class PhotoDetailedScreen extends StatefulWidget {
  const PhotoDetailedScreen({Key? key}) : super(key: key);

  @override
  State<PhotoDetailedScreen> createState() => _PhotoDetailedScreenState();
}

class _PhotoDetailedScreenState extends State<PhotoDetailedScreen> {
  @override
  void initState() {
    context.read<PhotoDetailedViewModel>().getPhotoById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PhotoDetailedViewModel>();

    final photoInfo = model.photo;

    late final date;

    const greyTextColor = TextStyle(color: Colors.grey);

    if (photoInfo != null) {
      final parseDate = DateTime.parse(photoInfo.createdAt);
      date = DateFormat('d MMMM y').format(parseDate);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: Text(
          '${model.photo?.user.username}',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: model.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${model.photo?.urls.regular}',
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        useSafeArea: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text('Close'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Table(
                                      children: [
                                        const TableRow(
                                          children: [
                                            Text(
                                              'Make',
                                              style: greyTextColor,
                                            ),
                                            Text(
                                              'Focal Length (mm)',
                                              style: greyTextColor,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              photoInfo?.exif.make ?? '-',
                                            ),
                                            Text(
                                              photoInfo?.exif.focalLength ??
                                                  '-',
                                            ),
                                          ],
                                        ),
                                        const TableRow(
                                          children: [
                                            Text(
                                              'Model',
                                              style: greyTextColor,
                                            ),
                                            Text(
                                              'ISO',
                                              style: greyTextColor,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              photoInfo?.exif.model ?? '-',
                                            ),
                                            Text(
                                              '${photoInfo?.exif.iso ?? '-'}',
                                            ),
                                          ],
                                        ),
                                        const TableRow(
                                          children: [
                                            Text(
                                              'Exposure time',
                                              style: greyTextColor,
                                            ),
                                            Text(
                                              'Dimensions',
                                              style: greyTextColor,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              photoInfo?.exif.exposureTime ??
                                                  '-',
                                            ),
                                            Text(
                                              '${photoInfo?.width} x ${photoInfo?.height}',
                                            ),
                                          ],
                                        ),
                                        const TableRow(
                                          children: [
                                            Text(
                                              'Aperture (ƒ)',
                                              style: greyTextColor,
                                            ),
                                            Text(
                                              'Published',
                                              style: greyTextColor,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              photoInfo?.exif.aperture ?? '-',
                                            ),
                                            Text(date),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.info_outline,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
