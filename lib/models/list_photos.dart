import 'package:json_annotation/json_annotation.dart';

import 'package:photos/models/urls.dart';
import 'package:photos/models/user.dart';

part 'list_photos.g.dart';

@JsonSerializable()
class ListPhotos {
  final String id;
  final Urls urls;
  final User user;

  ListPhotos({
    required this.id,
    required this.urls,
    required this.user,
  });

  factory ListPhotos.fromJson(Map<String, dynamic> json) =>
      _$ListPhotosFromJson(json);

  Map<String, dynamic> toJson() => _$ListPhotosToJson(this);
}
