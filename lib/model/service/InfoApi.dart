import 'package:dio/dio.dart';
import 'package:redditech/data/userData.dart' as userData;

class InfoApi{
  Future<Response> getInfo() async {
    Response response = await Dio().get(
      "https://oauth.reddit.com/api/v1/me",
      options: Options(headers: <String, dynamic>{
        'Authorization': 'Bearer ${userData.accessToken}',
        'content-Type': 'application/x-www-form-urlencoded',
      }),
    );
    return response;
  }
}