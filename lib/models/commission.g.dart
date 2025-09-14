// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) => Commission(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String,
      price: (json['price'] as num).toInt(),
      priceType: json['priceType'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      status: json['status'] as String,
      imageUrl: json['imageUrl'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      workingDays: (json['workingDays'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      isUrgent: json['isUrgent'] as bool? ?? false,
      isPopular: json['isPopular'] as bool? ?? false,
      badge: json['badge'] as String?,
    );

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorAvatar': instance.authorAvatar,
      'price': instance.price,
      'priceType': instance.priceType,
      'tags': instance.tags,
      'category': instance.category,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'imageUrls': instance.imageUrls,
      'workingDays': instance.workingDays,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isUrgent': instance.isUrgent,
      'isPopular': instance.isPopular,
      'badge': instance.badge,
    };
