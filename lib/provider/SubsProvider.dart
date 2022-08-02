import 'package:flutter/cupertino.dart';
import 'package:redditech/model/core/Sub.dart';

class SubsProvider extends ChangeNotifier {
  bool _isUpToDate = false;
  List<Sub> _listSub = [];
  String _filter = "best";

  bool get isUpToDate => _isUpToDate;

  set isUpToDate(bool value){
    _isUpToDate = value;
    notifyListeners();
  }

  List<Sub> get listSub => _listSub;

  set listSub(List<Sub> value){
    _listSub = value;
    notifyListeners();
  }

  String get filter => _filter;

  set filter(String value){
    _filter = value;
  }
}
