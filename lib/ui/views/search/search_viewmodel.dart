import 'package:flutter/material.dart';
import 'package:nyt_flutter_app/app/app.locator.dart';
import 'package:nyt_flutter_app/app/app.router.router.dart';
import 'package:nyt_flutter_app/models/article_model.dart';
import 'package:nyt_flutter_app/services/api_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navService = locator<NavigationService>();

  final TextEditingController searchController = TextEditingController();

  void clearSearch() {
    searchController.clear();
  }

  Future<void> searchArticles() async {
    final query = searchController.text.trim();
    if (query.isEmpty) return;

    setBusy(true);
    final List<ArticleModel> articles = await _apiService.fetchArticlesByQuery(query);
    setBusy(false);

    if (articles.isNotEmpty) {
      await _navService.navigateToArticleView(articles: articles);
    } else {
      // _navService.showSnackbar(
      //   message: 'No articles found for "$query"',
      //   duration: const Duration(seconds: 2),
      // );
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
