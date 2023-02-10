// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapiproject/configs/config_color.dart';
import 'package:newsapiproject/configs/config_setting.dart';
import 'package:newsapiproject/controllers/controller_article.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapiproject/models/model_article.dart';

class ArticlePage extends StatelessWidget {
  final controller = Get.find<ArticleController>();

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
                child: Stack(
              children: <Widget>[
                layoutList()
              ],
            ))));
  }
Widget layoutList() {
    var animation = controller.getanimation(1);

    return Container(
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
                                                  return itemLayout(controller.listitem[index]);
                                                })));
                            },
                          ))));
            }));
  }
  
  Widget itemLayout(ArticleModel dataitem) {
    return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColor.colorwhite,
             border: Border(bottom: BorderSide(color: Colors.grey,width:0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
              height: 100,
              child:
              GestureDetector(
                  onTap: () {controller.goToNews(dataitem);},
                  child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            child: 
                            dataitem.urlToImage == ""?
                            Container(
                                      decoration : BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                                image: AssetImage(AppSetting.noimage),
                                                fit: BoxFit.cover,
                                                )
                                      ),
                                  ):
                                  Container(
                                      decoration : BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                                image: NetworkImage(dataitem.urlToImage),
                                                fit: BoxFit.cover,
                                                )
                                      ),
                                  ),
                                  ),
                          Padding(padding: EdgeInsets.only(right: 13)),
                          Expanded(
                              child: 
                              Column(children: [
                                Text(
                                    dataitem.title,maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.colorblack,
                                      fontSize: AppSetting.sizetextnormal - 1,
                                      letterSpacing: AppSetting.sizeletterspacing,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Text(
                                    dataitem.description,maxLines: 4,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColor.colorblack,
                                      fontSize: AppSetting.sizetextnormal - 2,
                                      letterSpacing: AppSetting.sizeletterspacing,
                                      height: 1.02
                                    ),
                                  )
                              ],)
                          ),
                        ],
                      ),
                  ),),
            ],
          ),
    );
  }

}
