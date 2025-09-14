import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final String name;
  final String icon;
  final String color;
  final int commissionCount;
  final bool isPopular;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.commissionCount = 0,
    this.isPopular = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Review {
  final String id;
  final String commissionId;
  final String reviewerId;
  final String reviewerName;
  final String reviewerAvatar;
  final double rating;
  final String content;
  final DateTime createdAt;
  final int workingDays;

  Review({
    required this.id,
    required this.commissionId,
    required this.reviewerId,
    required this.reviewerName,
    required this.reviewerAvatar,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.workingDays,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}일 전';
    } else {
      return '${difference.inDays ~/ 30}개월 전';
    }
  }

  String get formattedWorkingDays {
    if (workingDays < 60) {
      return '${workingDays}분';
    } else if (workingDays < 1440) {
      return '${workingDays ~/ 60}시간';
    } else {
      return '${workingDays ~/ 1440}일';
    }
  }
} 