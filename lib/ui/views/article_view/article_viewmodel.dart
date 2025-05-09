import 'package:nyt_flutter_app/app/app.locator.dart';
import 'package:nyt_flutter_app/services/api_services.dart';
import 'package:stacked/stacked.dart';

class ArticleViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
}
