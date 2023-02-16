// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exif _$ExifFromJson(Map<String, dynamic> json) => Exif(
      make: json['make'] as String?,
      model: json['model'] as String?,
      name: json['name'] as String?,
      exposureTime: json['exposure_time'] as String?,
      aperture: json['aperture'] as String?,
      focalLength: json['focal_length'] as String?,
      iso: json['iso'] as int?,
    );

Map<String, dynamic> _$ExifToJson(Exif instance) => <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'name': instance.name,
      'exposure_time': instance.exposureTime,
      'aperture': instance.aperture,
      'focal_length': instance.focalLength,
      'iso': instance.iso,
    };
