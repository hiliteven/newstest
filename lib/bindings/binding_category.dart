import 'package:get/get.dart';
import 'package:newsapiproject/controllers/controller_category.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
