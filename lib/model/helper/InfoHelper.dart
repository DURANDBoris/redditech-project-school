import 'package:dio/dio.dart';
import 'package:redditech/model/core/Info.dart';
import 'package:redditech/model/service/InfoApi.dart';

class InfoHelper{
  InfoApi infoApi = InfoApi();

  Future<Info> getInfo() async {
    Response response = await infoApi.getInfo();
    Map<dynamic, dynamic> result = response.data;
    Map<String, dynamic> data = <String, dynamic>{};
    for (dynamic type in result.keys) {
      data[type.toString()] = result[type];
    }
    
    return Info.fromJson(data);
  }
}