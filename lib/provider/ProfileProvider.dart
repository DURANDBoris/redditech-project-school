import 'package:flutter/cupertino.dart';
import 'package:redditech/model/core/Prefs.dart';

class ProfileProvider extends ChangeNotifier {
  Prefs _prefs = Prefs(
      over_18: false,
      no_profanity: false,
      feed_reco_en: false,
      en_follow: true,
      country_code: "",
      accept_pms: "");

  int index = 0;

  int index_mps = 0;

  List<String> country_code = [
    "DE",
    "BE",
    "CA",
    "CN",
    "DK",
    "ES",
    "FR",
    "MA",
    "NL",
    "SU",
    "US"
  ];

  List<String> country_name = [
    "Allemagne",
    "Belgique",
    "Canada",
    "Chine",
    "Danemark",
    "Espagne",
    "France",
    "Maroc",
    "Pays-Bas",
    "URSS",
    "Etats-Unis d'Amérique",
    "Unknown"
  ];

  List<String> accept_pms = ["everyone","whitelisted"];

  set prefs(Prefs value) {
    _prefs = value;
    notifyListeners();
  }

  Prefs get prefs => _prefs;
}
