import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../models/commission.dart';
import '../models/category.dart';
import '../widgets/commission_card.dart';

class CommissionListScreen extends StatefulWidget {
  final String? categoryId;
  final String? searchQuery;

  const CommissionListScreen({
    super.key,
    this.categoryId,
    this.searchQuery,
  });

  @override
  State<CommissionListScreen> createState() => _CommissionListScreenState();
}

class _CommissionListScreenState extends State<CommissionListScreen> {
  final DataService _dataService = DataService();
  List<Commission> _commissions = [];
  List<Category> _categories = [];
  String _selectedFilter = '전체';
  bool _isLoading = true;

  final List<String> _filters = [
    '전체',
    '글',
    '그림',
    '수공예',
    '디자인',
    '점술',
    '사운드',
    '기타',
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      List<Commission> commissions;
      
      if (widget.searchQuery != null) {
        commissions = await _dataService.searchCommissions(widget.searchQuery!);
      } else if (widget.categoryId != null) {
        commissions = await _dataService.getCommissionsByCategory(widget.categoryId!);
      } else {
        commissions = await _dataService.getCommissions();
      }

      final categories = await _dataService.getCategories();

      setState(() {
        _commissions = commissions;
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('데이터 로딩 실패: $e')),
        );
      }
    }
  }

  List<Commission> get _filteredCommissions {
    if (_selectedFilter == '전체') return _commissions;
    
    final category = _categories.firstWhere(
      (c) => c.name == _selectedFilter,
      orElse: () => Category(
        id: '',
        name: '',
        icon: '',
        color: '',
      ),
    );
    
    return _commissions.where((c) => c.category == category.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.searchQuery != null
              ? '검색 결과'
              : widget.categoryId != null
                  ? '카테고리별 커미션'
                  : '크레페의 특별한 커미션들',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // 필터 탭바
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;
                
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.grey[100],
                    selectedColor: Colors.purple[100],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.purple[700] : Colors.black,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
          
          // 커미션 목록
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredCommissions.isEmpty
                    ? const Center(
                        child: Text(
                          '커미션이 없습니다.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: _loadData,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: _filteredCommissions.length,
                          itemBuilder: (context, index) {
                            return CommissionCard(
                              commission: _filteredCommissions[index],
                              onTap: () {
                                // TODO: 커미션 상세 페이지로 이동
                              },
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
} 