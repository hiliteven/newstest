import 'package:get/get.dart';
import 'package:newsapiproject/controllers/controller_article.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleController());
  }
}
