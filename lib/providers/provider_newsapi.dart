// ignore_for_file: prefer_const_constructors

import 'package:http/http.dart';
import 'package:newsapiproject/configs/config_setting.dart';

class NewsapiProvider { 
  Future<Response> get_source(source) {
    var url = Uri.parse(AppSetting.urlapi + "/sources?category="+source+"&apiKey="+AppSetting.ApiKey);

    return get(url).timeout(Duration(seconds: AppSetting.timeout + 20));
  }
  Future<Response> get_category(category) {
    var url = Uri.parse(AppSetting.urlapi + "?country=id&category="+category+"&apiKey="+AppSetting.ApiKey);

    return get(url).timeout(Duration(seconds: AppSetting.timeout + 20));
  }
}
