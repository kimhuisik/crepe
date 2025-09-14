import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/banner.dart';

class SimpleBannerCarousel extends StatefulWidget {
  final List<BannerItem> banners;
  final Function(BannerItem)? onBannerTap;

  const SimpleBannerCarousel({
    super.key,
    required this.banners,
    this.onBannerTap,
  });

  @override
  State<SimpleBannerCarousel> createState() => _SimpleBannerCarouselState();
}

class _SimpleBannerCarouselState extends State<SimpleBannerCarousel> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    
    // 자동 슬라이드
    if (widget.banners.isNotEmpty) {
      Future.delayed(const Duration(seconds: 4), _autoSlide);
    }
  }

  void _autoSlide() {
    if (!mounted) return;
    
    final nextIndex = (_currentIndex + 1) % widget.banners.length;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    
    Future.delayed(const Duration(seconds: 4), _autoSlide);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: BannerItemWidget(
                  banner: banner,
                  onTap: () => widget.onBannerTap?.call(banner),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.banners.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  entry.key,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.purple
                      : Colors.grey[300],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class BannerItemWidget extends StatelessWidget {
  final BannerItem banner;
  final VoidCallback? onTap;

  const BannerItemWidget({
    super.key,
    required this.banner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(int.parse(banner.backgroundColor.replaceFirst('#', '0xFF'))),
              Color(int.parse(banner.backgroundColor.replaceFirst('#', '0xFF')))
                  .withOpacity(0.8),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // 배경 이미지
              Positioned.fill(
                child: banner.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        banner.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Color(int.parse(
                            banner.backgroundColor.replaceFirst('#', '0xFF'),
                          )),
                          child: const Center(
                            child: Icon(Icons.image, color: Colors.white54, size: 40),
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: banner.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Color(int.parse(
                            banner.backgroundColor.replaceFirst('#', '0xFF'),
                          )),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Color(int.parse(
                            banner.backgroundColor.replaceFirst('#', '0xFF'),
                          )),
                        ),
                      ),
              ),
              // 텍스트 오버레이
              Positioned(
                left: 20,
                top: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      banner.subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 