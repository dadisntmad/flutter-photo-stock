import 'package:json_annotation/json_annotation.dart';

import 'package:photos/models/profile_image.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String username;
  @JsonKey(name: 'profile_image')
  final ProfileImage profileImage;

  User({
    required this.id,
    required this.username,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
