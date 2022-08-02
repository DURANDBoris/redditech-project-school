
import 'package:dio/dio.dart';
import 'package:redditech/data/userData.dart' as userData;

class SubApi {
  Future<Response> getSub(String value) async {
    Response response;
    response = await Dio().get("https://oauth.reddit.com/$value/",
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${userData.accessToken}',
          'content-Type': 'application/x-www-form-urlencoded',
        }),
        queryParameters: {'limit': '20', 'after': ''});
    return response;
  }
    Future<Response> getSubAfter(String last,String value) async {
    Response response;
    response = await Dio().get("https://oauth.reddit.com/$value/",
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${userData.accessToken}',
          'content-Type': 'application/x-www-form-urlencoded',
        }),
        queryParameters: {'limit': '20', 'after': last});
    return response;
  }
}
