import 'package:json_annotation/json_annotation.dart';

import 'package:photos/models/exif.dart';
import 'package:photos/models/location.dart';
import 'package:photos/models/urls.dart';
import 'package:photos/models/user.dart';

part 'single_photo.g.dart';

@JsonSerializable()
class SinglePhoto {
  final String id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Urls urls;
  final User user;
  final Exif exif;
  final Location location;

  SinglePhoto({
    required this.id,
    required this.createdAt,
    required this.urls,
    required this.user,
    required this.exif,
    required this.location,
  });

  factory SinglePhoto.fromJson(Map<String, dynamic> json) =>
      _$SinglePhotoFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePhotoToJson(this);
}
