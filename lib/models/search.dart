import 'package:json_annotation/json_annotation.dart';

import 'package:photos/models/list_photos.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  final int total;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<ListPhotos> results;

  Search({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
