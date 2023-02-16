import 'package:json_annotation/json_annotation.dart';

part 'exif.g.dart';

@JsonSerializable()
class Exif {
  final String? make;
  final String? model;
  final String? name;
  @JsonKey(name: 'exposure_time')
  final String? exposureTime;
  final String? aperture;
  @JsonKey(name: 'focal_length')
  final String? focalLength;
  final int? iso;

  Exif({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json) => _$ExifFromJson(json);

  Map<String, dynamic> toJson() => _$ExifToJson(this);
}
