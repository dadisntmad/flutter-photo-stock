// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinglePhoto _$SinglePhotoFromJson(Map<String, dynamic> json) => SinglePhoto(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      exif: Exif.fromJson(json['exif'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SinglePhotoToJson(SinglePhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'urls': instance.urls,
      'user': instance.user,
      'exif': instance.exif,
      'location': instance.location,
    };
