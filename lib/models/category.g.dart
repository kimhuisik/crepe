// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      commissionCount: (json['commissionCount'] as num?)?.toInt() ?? 0,
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'commissionCount': instance.commissionCount,
      'isPopular': instance.isPopular,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String,
      commissionId: json['commissionId'] as String,
      reviewerId: json['reviewerId'] as String,
      reviewerName: json['reviewerName'] as String,
      reviewerAvatar: json['reviewerAvatar'] as String,
      rating: (json['rating'] as num).toDouble(),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      workingDays: (json['workingDays'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'commissionId': instance.commissionId,
      'reviewerId': instance.reviewerId,
      'reviewerName': instance.reviewerName,
      'reviewerAvatar': instance.reviewerAvatar,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'workingDays': instance.workingDays,
    };
