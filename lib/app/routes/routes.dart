import 'package:flutter/widgets.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [AppNavigation.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
