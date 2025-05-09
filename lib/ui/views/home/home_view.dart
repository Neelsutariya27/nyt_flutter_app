import 'package:flutter/material.dart';
import 'package:nyt_flutter_app/config/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('NYT'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: model.goToSearch,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Text(
                            'Search Articles...',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text("Popular Articles", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                Column(
                  children: List.generate(
                    model.popularData.entries.length,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.cardBgColor,
                        borderRadius: BorderRadius.circular(10),
                        /*boxShadow: [
                            BoxShadow(color: Colors.black.withValues(alpha: .01), offset: Offset(0, 4), blurRadius: 4)
                          ]*/
                      ),
                      child: ListTile(
                        onTap: () {
                          model.goToArticles(model.popularData.values.toList()[index]);
                        },
                        title: Text(
                          model.popularData.keys.toList()[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
