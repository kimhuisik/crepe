import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../models/commission.dart';
import '../models/category.dart';
import '../models/banner.dart';
import '../widgets/simple_banner_carousel.dart';
import '../widgets/category_grid.dart';
import '../widgets/commission_card.dart';
import '../widgets/review_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataService _dataService = DataService();
  List<BannerItem> _banners = [];
  List<Category> _categories = [];
  List<Commission> _popularCommissions = [];
  List<Review> _recentReviews = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final results = await Future.wait([
        _dataService.getBanners(),
        _dataService.getCategories(),
        _dataService.getPopularCommissions(),
        _dataService.getReviews(),
      ]);

      setState(() {
        _banners = results[0] as List<BannerItem>;
        _categories = results[1] as List<Category>;
        _popularCommissions = results[2] as List<Commission>;
        _recentReviews = (results[3] as List<Review>).take(5).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('데이터 로딩 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'CREPE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: 검색 화면으로 이동
            },
          ),
          TextButton(
            onPressed: () {
              // TODO: 로그인 화면으로 이동
            },
            child: const Text(
              '로그인',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 배너 섹션
              if (_banners.isNotEmpty) ...[
                SimpleBannerCarousel(
                  banners: _banners,
                  onBannerTap: (banner) {
                    // TODO: 배너 클릭 처리
                  },
                ),
                const SizedBox(height: 24),
              ],

              // 카테고리 섹션
              if (_categories.isNotEmpty) ...[
                CategoryGrid(
                  categories: _categories,
                  onCategoryTap: (category) {
                    // TODO: 카테고리별 커미션 목록으로 이동
                  },
                ),
                const SizedBox(height: 32),
              ],

              // 숨은 맛집 리스트 섹션
              const Text(
                '숨은 맛집 리스트',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _popularCommissions.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: CommissionCard(
                          commission: _popularCommissions[index],
                          onTap: () {
                            // TODO: 커미션 상세 페이지로 이동
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // 통계 섹션
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      '지금 이 순간 크레페에서 커미션',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '31,609건',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const Text(
                      '이 안전하게 진행되고 있어요',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '총 사용자 381,027명',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '등록된 커미션 타입 151,139개',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 최신 후기 섹션
              const Text(
                '지금 막 올라온 최신 후기를 둘러보세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _recentReviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard(review: _recentReviews[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 