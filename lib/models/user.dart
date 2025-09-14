import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String nickname;
  final String avatar;
  final String? bio;
  final int followerCount;
  final int followingCount;
  final int commissionCount;
  final double rating;
  final int reviewCount;
  final bool isVerified;
  final DateTime joinedAt;
  final List<String> specialties;
  final String? website;
  final String? twitter;
  final String? instagram;

  User({
    required this.id,
    required this.nickname,
    required this.avatar,
    this.bio,
    this.followerCount = 0,
    this.followingCount = 0,
    this.commissionCount = 0,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isVerified = false,
    required this.joinedAt,
    this.specialties = const [],
    this.website,
    this.twitter,
    this.instagram,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get formattedRating {
    return rating.toStringAsFixed(1);
  }

  String get formattedFollowerCount {
    if (followerCount >= 1000) {
      return '${(followerCount / 1000).toStringAsFixed(1)}K';
    }
    return followerCount.toString();
  }
} 