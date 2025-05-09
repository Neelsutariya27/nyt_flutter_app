import 'dart:developer';

import 'package:nyt_flutter_app/app/app.locator.dart';
import 'package:nyt_flutter_app/app/app.router.router.dart';
import 'package:nyt_flutter_app/models/article_model.dart';
import 'package:nyt_flutter_app/services/api_services.dart';
import 'package:nyt_flutter_app/ui/widgets/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navService = locator<NavigationService>();

  final Map<String, String> _popularData = {
    "Most Viewed": "viewed",
    "Most Shared": "shared",
    "Most Emailed": "emailed"
  };

  Map<String, String> get popularData => _popularData;
  List<ArticleModel> articles = [];

  void goToSearch() {
    _navService.navigateTo(Routes.searchView); // adjust if you're using stacked-generated routes
  }

  Future<void> goToArticles(String type) async {
    final dialogService = locator<DialogService>();
    try {
      dialogService.showCustomDialog(
        variant: DialogType.loading,
        barrierDismissible: false,
        title: 'Loading',
        description: 'Fetching articles...',
      );

      articles = await _apiService.fetchMostPopularArticles(type);
      dialogService.completeDialog(DialogResponse());
      log("BEFORE NAVIGATION ARTICLE LENGTH -- ${articles.length}");
      _navService.navigateToArticleView(articles: articles);
      log("AFTER NAVIGATION");
    } catch (e) {
      dialogService.completeDialog(DialogResponse());
      log('Error: $e');
    }
  }
}
