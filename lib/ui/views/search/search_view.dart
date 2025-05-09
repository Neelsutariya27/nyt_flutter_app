import 'package:flutter/material.dart';
import 'package:nyt_flutter_app/config/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Search Articles'), centerTitle: true, elevation: 0),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: model.searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Enter search term...',
                    filled: true,
                    fillColor: AppColors.cardBgColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: model.clearSearch,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: model.searchArticles,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    child: model.isBusy
                        ? Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                              strokeWidth: 1,
                            ),
                          )
                        : Text("Search",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
