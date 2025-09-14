// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
      bio: json['bio'] as String?,
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      commissionCount: (json['commissionCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      isVerified: json['isVerified'] as bool? ?? false,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      specialties: (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      website: json['website'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'commissionCount': instance.commissionCount,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isVerified': instance.isVerified,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'specialties': instance.specialties,
      'website': instance.website,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
    };
