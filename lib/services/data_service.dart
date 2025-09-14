import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/commission.dart';
import '../models/user.dart';
import '../models/category.dart';
import '../models/banner.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  List<Commission>? _commissions;
  List<Category>? _categories;
  List<BannerItem>? _banners;
  List<Review>? _reviews;

  Future<List<Commission>> getCommissions() async {
    if (_commissions != null) return _commissions!;

    final String jsonString = await rootBundle.loadString('assets/data/commissions.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    _commissions = jsonList.map((json) => Commission.fromJson(json)).toList();
    return _commissions!;
  }

  Future<List<Category>> getCategories() async {
    if (_categories != null) return _categories!;

    final String jsonString = await rootBundle.loadString('assets/data/categories.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    _categories = jsonList.map((json) => Category.fromJson(json)).toList();
    return _categories!;
  }

  Future<List<BannerItem>> getBanners() async {
    if (_banners != null) return _banners!;

    final String jsonString = await rootBundle.loadString('assets/data/banners.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    _banners = jsonList.map((json) => BannerItem.fromJson(json)).toList();
    return _banners!;
  }

  Future<List<Review>> getReviews() async {
    if (_reviews != null) return _reviews!;

    final String jsonString = await rootBundle.loadString('assets/data/reviews.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    _reviews = jsonList.map((json) => Review.fromJson(json)).toList();
    return _reviews!;
  }

  Future<List<Commission>> getPopularCommissions() async {
    final commissions = await getCommissions();
    return commissions.where((c) => c.isPopular).toList();
  }

  Future<List<Commission>> getCommissionsByCategory(String categoryId) async {
    final commissions = await getCommissions();
    return commissions.where((c) => c.category == categoryId).toList();
  }

  Future<List<Commission>> searchCommissions(String query) async {
    final commissions = await getCommissions();
    final lowercaseQuery = query.toLowerCase();
    
    return commissions.where((c) => 
      c.title.toLowerCase().contains(lowercaseQuery) ||
      c.description.toLowerCase().contains(lowercaseQuery) ||
      c.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery)) ||
      c.authorName.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  Future<Commission?> getCommissionById(String id) async {
    final commissions = await getCommissions();
    try {
      return commissions.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Review>> getReviewsForCommission(String commissionId) async {
    final reviews = await getReviews();
    return reviews.where((r) => r.commissionId == commissionId).toList();
  }
} 