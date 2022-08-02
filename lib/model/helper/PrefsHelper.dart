import 'package:dio/dio.dart';
import 'package:redditech/model/core/Prefs.dart';
import 'package:redditech/model/service/PrefsApi.dart';

class PrefsHelper{
  PrefsApi prefsApi = PrefsApi();

  Future<Prefs> getPrefs() async {
    Response response = await prefsApi.getPrefs();
    Map<dynamic, dynamic> result = response.data;
    Map<String, dynamic> data = <String, dynamic>{};
    for (dynamic type in result.keys) {
      data[type.toString()] = result[type];
    }
    return Prefs.fromJson(data);
  }

  Future<void> postPrefs(Prefs pref) async {
    prefsApi.postPrefs(pref);
  }
  
}