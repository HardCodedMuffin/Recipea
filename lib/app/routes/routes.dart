import 'package:flutter/widgets.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/home/home.dart';
import 'package:recipea/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}