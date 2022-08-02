import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:redditech/data/userData.dart' as userData;
import 'package:redditech/model/core/Prefs.dart';

class PrefsApi {
  Future<Response> getPrefs() async {
    Response response = await Dio().get(
      "https://oauth.reddit.com/api/v1/me/prefs",
      options: Options(headers: <String, dynamic>{
        'Authorization': 'Bearer ${userData.accessToken}',
        'content-Type': 'application/x-www-form-urlencoded',
      }),
    );

    return response;
  }

  Future<void> postPrefs(Prefs pref) async {
    Uri uri = Uri.parse(
        "https://oauth.reddit.com/api/v1/me/prefs");

    await http.patch(uri,
        headers: {
          'Authorization': 'Bearer ${userData.accessToken}'
        },
        body: json.encode({
          "over_18": pref.over_18,
          "feed_recommendations_enabled": pref.feed_reco_en,
          "enable_followers": pref.en_follow,
          "no_profanity": pref.no_profanity,
          "country_code": pref.country_code,
          "accept_pms": pref.accept_pms,
        }));
    return;
  }
}
