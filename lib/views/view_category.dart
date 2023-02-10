// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapiproject/configs/config_color.dart';
import 'package:newsapiproject/configs/config_setting.dart';
import 'package:newsapiproject/controllers/controller_category.dart';
import 'package:lottie/lottie.dart';

class CategoryPage extends StatelessWidget {
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorwhite,  
        appBar: AppBar(
        title: Text("Categories",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple[400],
        centerTitle: false,
      ),
        body: SafeArea(
                child: Column(
              children: <Widget>[
                layoutBody(),
              ],
            )));
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
                        width: MediaQuery.of(Get.context!).size.width,
                        height: MediaQuery.of(Get.context!).size.height,
                          decoration: BoxDecoration(
                            color: AppColor.colorwhite,
                          ),
                          child:
                          SingleChildScrollView(  padding: const EdgeInsets.all(20), child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                   GetBuilder(
                              init: controller,
                              builder: (_) {
                               return GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.5),
                                padding: EdgeInsets.only(top:15),
                                itemCount: controller.listitem.length,
                                itemBuilder: ((context, index) => 
                                InkWell(
                                    onTap: () {
                                      controller.goToSource(controller.listitem[index]);
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 170,
                                          height: 120,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                        image: NetworkImage(controller.listitem[index].thumbnail),
                                                fit: BoxFit.cover,
                                                ),
                                          ),
                                           child:ClipRRect(
                                              child: Material(
                                                color: Colors.white.withOpacity(0.5),
                                                  child:Align(
                                                    alignment: Alignment(-0.7, -0.5),
                                                      child: Text(
                                                          controller.listitem[index].id,
                                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: AppSetting.sizetextnormal - 1),
                                                          ),
                                                )),
                                              ),
                                        )
                                      ],
                                    ),
                                    )
                                ));
                              })


                          ],) ,)
                              )));
            }));
  }


}
