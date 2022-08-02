import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:redditech/model/core/Sub.dart';
import 'package:redditech/model/service/SubApi.dart';
import 'package:redditech/provider/SubsProvider.dart';

class SubHelper {
  BuildContext context;

  SubApi subApi = SubApi();

  late SubsProvider subsProvider;

  SubHelper({required this.context}) {
    subsProvider = Provider.of<SubsProvider>(context, listen: false);
  }

  Future<void> getSub(String value) async {
    List<Sub> listsub = [];
    Response response = await subApi.getSub(value);
    Map<dynamic, dynamic> result = response.data;

    for (dynamic type in result['data']['children']) {
      listsub.add(Sub.fromJson(type));
    }
    result['data']['children'] == [] ? subsProvider.listSub = []: subsProvider.listSub = listsub;
    
    subsProvider.isUpToDate = true;
    return;
  }

  Future<void> getSubAfter(String last, String value) async {
    List<Sub> listsub = [];
    Response response = await subApi.getSubAfter(last, value);
    Map<dynamic, dynamic> result = response.data;

    for (dynamic type in result['data']['children']) {
      listsub.add(Sub.fromJson(type));
    }
    
    subsProvider.listSub = listsub;
    subsProvider.isUpToDate = true;

    return;
  }
}
