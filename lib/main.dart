import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapiproject/configs/config_color.dart';
import 'package:newsapiproject/configs/config_route.dart';
import 'package:newsapiproject/bindings/binding_category.dart';
import 'package:newsapiproject/views/view_category.dart';
import 'package:newsapiproject/bindings/binding_source.dart';
import 'package:newsapiproject/views/view_source.dart';
import 'package:newsapiproject/bindings/binding_article.dart';
import 'package:newsapiproject/views/view_article.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFF9C27B0)));
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}


class MyApp extends StatefulWidget {
  
  @override
  MyAppState createState() => MyAppState();
}


// class MyApp extends StatefulWidget {
class MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: AppRoute.category,
      getPages: [
        GetPage(
          name: AppRoute.category,
          page: () => CategoryPage(),
          binding: CategoryBinding(),
        ),
        GetPage(
          name: AppRoute.article,
          page: () => ArticlePage(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: AppRoute.source,
          page: () => SourcePage(),
          binding: SourceBinding(),
        ),
        // GetPage(
        //   name: AppRoute.webviewnews,
        //   page: () => WebViewNewsPage(),
        //   binding: WebViewNewsBinding(),
        // ),
      ],
    );
  }
}
