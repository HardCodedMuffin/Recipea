import 'package:flutter/widgets.dart';
import 'package:recipea_app/app/app.dart';
import 'package:recipea_app/app/ui//login/login.dart';
import 'package:recipea_app/app/widgets/app_navigation.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [AppNavigation.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}