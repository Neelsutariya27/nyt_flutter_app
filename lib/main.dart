import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nyt_flutter_app/app/app.router.router.dart';
import 'package:nyt_flutter_app/config/app_colors.dart';
import 'package:nyt_flutter_app/ui/widgets/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupLocator();
  setupDialogUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Flutter App',
      theme: AppColors.appTheme,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
//#BBCB2F
