// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPhotos _$ListPhotosFromJson(Map<String, dynamic> json) => ListPhotos(
      id: json['id'] as String,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListPhotosToJson(ListPhotos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
      'user': instance.user,
    };
