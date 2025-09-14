// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      linkUrl: json['linkUrl'] as String?,
      backgroundColor: json['backgroundColor'] as String,
      order: (json['order'] as num).toInt(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'linkUrl': instance.linkUrl,
      'backgroundColor': instance.backgroundColor,
      'order': instance.order,
      'isActive': instance.isActive,
    };
