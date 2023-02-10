// ignore_for_file: deprecated_member_use, prefer_const_constructors

// import 'dart:html';
// import 'dart:js';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapiproject/configs/config_setting.dart';
import 'package:newsapiproject/configs/config_route.dart';
import 'package:newsapiproject/models/model_category.dart';

class CategoryController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  Animation<double>? animationHeader;
  List<dynamic> listitem = [];
  var CategoryModelList = [].obs;
  TextEditingController inputhere = TextEditingController();

  
 
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
    callApi();
  }

  Future<bool> closeAll() async {
    await animationController?.reverse();
    animationController?.dispose();

    Get.delete<CategoryController>();
    Get.back();

    return false;
  }
  void goToSource(source) {
    Get.toNamed(AppRoute.source,arguments: source );
  }

  Animation<double> getanimation(index) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0.1 * index, 1, curve: Curves.fastOutSlowIn)));
  }
  void callApi() async {
    listitem =[
   CategoryModel(id:"business",category: "Bisnis",thumbnail: "https://dieng.blob.core.windows.net/ict/2019/02/business-3152586_960_720.jpg"),
   CategoryModel(id:"entertainment",category: "Hiburan",thumbnail: "https://www.shutterstock.com/image-photo/hand-smartphone-records-live-music-260nw-529874515.jpg"),
   CategoryModel(id:"general",category: "Umum",thumbnail: "https://i.pinimg.com/originals/b3/13/08/b313083f22ff8d5bd5f4bba34ef201d4.jpg"),
   CategoryModel(id:"health",category: "Kesehatan",thumbnail: "https://www.maxlifeinsurance.com/content/dam/corporate/images/health-insurance-comparison.png"),
   CategoryModel(id:"science",category: "Pengetahuan",thumbnail: "https://www.educationcorner.com/images/featured-science-study-skills-guide.jpg"),
   CategoryModel(id:"sports",category: "Olah raga",thumbnail: "https://files.northernbeaches.nsw.gov.au/sites/default/files/images/general-information/sports-associations/sports-associations.jpg"),
   CategoryModel(id:"technology",category: "Teknologi",thumbnail: "https://bali-training.com/wp-content/uploads/2017/12/technology-1.jpg")];
  }
 
}
