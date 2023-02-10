// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapiproject/configs/config_color.dart';
import 'package:newsapiproject/configs/config_setting.dart';
import 'package:newsapiproject/controllers/controller_source.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapiproject/models/model_article.dart';
import 'package:newsapiproject/models/model_category.dart';
import 'package:newsapiproject/models/model_source.dart';

class SourcePage extends StatelessWidget {
  final controller = Get.find<SourceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorwhite,
        appBar: AppBar(
        leading: BackButton(
            color: Colors.white
        ),
        title: Text(controller.args.id,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple[400],
        centerTitle: false,


      ),
        body: WillPopScope(
            onWillPop: controller.closeAll,
            child: SafeArea(
                child: Column(
              children: <Widget>[
                layoutBody(),
              ],
            ))));
  }
  

  Widget layoutBody() {
    var animation = controller.getanimation(1);

    return Expanded(
        child: AnimatedBuilder(
            animation: controller.animationController!,
            builder: (_, __) {
              return FadeTransition(
                  opacity: animation,
                  child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 30 * (1.0 - animation.value), 0.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.colorwhite,
                          ),
                          child: Column(
                            children: <Widget>[
                              layoutList(),
                            ],
                          ))));
            }));
  }


  Widget layoutList() {
    var animation = controller.getanimation(4);

    return Expanded(
        child: AnimatedBuilder(
            animation: controller.animationController!,
            builder: (_, __) {
              return FadeTransition(
                  opacity: animation,
                  child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 30 * (1.0 - animation.value), 0.0),
                      child: Container(
                          width: double.infinity,
                          child: GetBuilder(
                            init: controller,
                            builder: (_) {
                              return
                                          Obx(() => ( ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: controller.listitem.length,
                                                itemBuilder: (_, index) {
                                                  return itemLayout( controller.listitem[index]);
                                                })));
                            },
                          ))));
            }));
  }

  Widget itemLayout(SourceModel dataitem) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColor.colorwhite,
             border: Border(bottom: BorderSide(color: Colors.grey,width:0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  onTap: () {controller.goToArticle(dataitem);},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            dataitem.name,maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.colorblack,
                              fontSize: AppSetting.sizetextnormal - 1,
                              letterSpacing: AppSetting.sizeletterspacing,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ],
                      ),
                      
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 2),
                          child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 Expanded(
                                  child:
                                    Text(
                                        dataitem.description,maxLines: 3,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.colorblack,
                                          fontSize: AppSetting.sizetextnormal - 2,
                                          letterSpacing: AppSetting.sizeletterspacing,
                                        ),
                                      )),
                              ],
                            )
                          ),
                          
                    ],
                  )),
            ],
          )),
    );
  }



}
