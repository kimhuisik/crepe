import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerItem {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? linkUrl;
  final String backgroundColor;
  final int order;
  final bool isActive;

  BannerItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.linkUrl,
    required this.backgroundColor,
    required this.order,
    this.isActive = true,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
} 