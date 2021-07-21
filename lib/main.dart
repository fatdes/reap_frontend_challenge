import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

import 'auth/login.dart';
import 'env.dart';
import 'user/insta_pic.dart';
import 'util/api_util.dart';

void main() {
  defaultApiClient = ApiClient(basePath: Env.apiBase);

  runApp(InstaPicApp());
}

class InstaPicApp extends StatelessWidget {
  InstaPicApp();

  String _defaultRoute() {
    return ApiUtil.hasLoggedIn() ? 'authorized' : 'not_authorized';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaPic',
      initialRoute: _defaultRoute(),
      routes: {
        'not_authorized': (BuildContext context) => Login(),
        'authorized': (BuildContext context) => InstaPic(),
      },
    );
  }
}
