// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newsapiproject/configs/config_setting.dart';
import 'package:newsapiproject/configs/config_route.dart';
import 'package:http/http.dart' as http;
import 'package:newsapiproject/models/model_source.dart';
import 'package:newsapiproject/providers/provider_newsapi.dart';

class SourceController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  Animation<double>? animationHeader;
  final args = Get.arguments;
  var listitem = [].obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsFlutterBinding.ensureInitialized();

    animationController = AnimationController(
        duration: Duration(milliseconds: AppSetting.timeanimation),
        vsync: this);

    animationHeader = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0, 1, curve: Curves.fastOutSlowIn)));
  }

  @override
  void onReady() async {
    super.onReady();
    animationController!.forward();
    callapi(args.id);
  }

  Future<bool> closeAll() async {
    await animationController?.reverse();
    animationController?.dispose();

    Get.delete<SourceController>();
    Get.back();

    return false;
  }
  void goToArticle(category) {
    Get.toNamed(AppRoute.article,arguments: category);
  }
  void callapi(category) async {
    Get.focusScope!.unfocus();
    try {
      http.Response res =
          await NewsapiProvider().get_source(category);
          var datares = jsonDecode(res.body);
          if(datares['status']=='ok'){
          SourceModel.convert(datares['sources'],listitem);
          }
    } catch (e) {
      print(e);
    }
  }

  Animation<double> getanimation(index) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0.1 * index, 1, curve: Curves.fastOutSlowIn)));
  }
}
