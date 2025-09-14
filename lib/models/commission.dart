import 'package:json_annotation/json_annotation.dart';

part 'commission.g.dart';

@JsonSerializable()
class Commission {
  final String id;
  final String title;
  final String description;
  final String authorId;
  final String authorName;
  final String authorAvatar;
  final int price;
  final String priceType; // 'fixed' or 'negotiable'
  final List<String> tags;
  final String category;
  final String status; // 'open', 'closed', 'in_progress'
  final String imageUrl;
  final List<String> imageUrls;
  final int workingDays;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int viewCount;
  final int likeCount;
  final double rating;
  final int reviewCount;
  final bool isUrgent;
  final bool isPopular;
  final String? badge; // 'GREEN', 'PURPLE', etc.

  Commission({
    required this.id,
    required this.title,
    required this.description,
    required this.authorId,
    required this.authorName,
    required this.authorAvatar,
    required this.price,
    required this.priceType,
    required this.tags,
    required this.category,
    required this.status,
    required this.imageUrl,
    required this.imageUrls,
    required this.workingDays,
    required this.createdAt,
    required this.updatedAt,
    this.viewCount = 0,
    this.likeCount = 0,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isUrgent = false,
    this.isPopular = false,
    this.badge,
  });

  factory Commission.fromJson(Map<String, dynamic> json) =>
      _$CommissionFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionToJson(this);

  String get formattedPrice {
    if (priceType == 'negotiable') {
      return '협의 가능';
    }
    return '${price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}P';
  }

  String get formattedWorkingDays {
    if (workingDays == 1) {
      return '당일 납품';
    }
    return '$workingDays일';
  }
} 