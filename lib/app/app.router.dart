import 'package:nyt_flutter_app/ui/views/article_view/article_view.dart';
import 'package:nyt_flutter_app/ui/views/home/home_view.dart';
import 'package:nyt_flutter_app/ui/views/search/search_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ArticleView),
    MaterialRoute(page: SearchView),
  ],
)
class App {}
