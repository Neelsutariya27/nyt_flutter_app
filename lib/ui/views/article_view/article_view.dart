import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyt_flutter_app/config/app_colors.dart';
import 'package:nyt_flutter_app/models/article_model.dart';
import 'package:nyt_flutter_app/ui/views/article_view/article_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ArticleView extends StatelessWidget {
  final List<ArticleModel> articles;
  const ArticleView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleViewModel>.reactive(
      viewModelBuilder: () => ArticleViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Articles'), centerTitle: true, elevation: 0),
          body: model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(left: BorderSide(width: 4, color: AppColors.primaryColor)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title ?? "",
                            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textColor),
                          ),
                          SizedBox(height: 6),
                          Text(
                            article.abstract ?? "",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat("hh:mm a, dd-MM-yyyy ").format(article.publishedDate ?? DateTime.now()),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
