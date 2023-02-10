import 'package:get/get.dart';
import 'package:newsapiproject/controllers/controller_source.dart';

class SourceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SourceController());
  }
}
