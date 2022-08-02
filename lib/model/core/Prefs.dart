
class Prefs {
  bool over_18;
  bool no_profanity;
  bool feed_reco_en;
  bool en_follow;
  String country_code;
  String accept_pms;

  Prefs({
    required this.over_18,
    required this.no_profanity,
    required this.feed_reco_en,
    required this.en_follow,
    required this.country_code,
    required this.accept_pms,
  });

  factory Prefs.fromJson(Map<String, dynamic> json) {
    return Prefs(
      over_18: json['over_18'],
      no_profanity: json['no_profanity'],
      feed_reco_en: json['feed_recommendations_enabled'],
      en_follow: json['enable_followers'],
      country_code: json['country_code'],
      accept_pms: json['accept_pms'],
    );
  }

  Map<String, dynamic> PrefsToJson(Prefs instance) => <String, dynamic>{
  'over_18' : instance.over_18,
  'no_profanity' : instance.no_profanity,
  'feed_reco_en' : instance.feed_reco_en,
  'en_follow' : instance.en_follow,
  'country_code' : instance.country_code,
  'accept_pms' : instance.accept_pms,
    };

}
