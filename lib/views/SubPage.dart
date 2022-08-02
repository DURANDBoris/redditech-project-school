import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditech/model/core/Info.dart';
import 'package:redditech/model/core/Prefs.dart';
import 'package:redditech/model/core/Sub.dart';
import 'package:redditech/model/helper/SubHelper.dart';
import 'package:redditech/provider/SubsProvider.dart';
import 'package:redditech/views/MyAppBar.dart';
import 'package:redditech/views/MyDrawer.dart';

class SubPage extends StatefulWidget {
  @override
  _SubPage createState() => _SubPage();
}

class _SubPage extends State<SubPage> {
  late Info info;
  late Prefs prefs;

  late SubsProvider subsProvider;

  late SubHelper subHelper;

  bool isSwitched = true;
  String last = "";
  List<Widget> listWidget = [];

  Future<void> getListSub() async {
    await subHelper.getSub(subsProvider.filter);

    return;
  }

  List<Widget> ListWidget({required List<Sub> listSub}) {
    listWidget.clear();
    if (listSub.isNotEmpty) {
      last = listSub.last.name;
      for (Sub sub in listSub) {
        listWidget.add(cardSub(sub));
        listWidget.add(Container(
          height: 10,
        ));
      }
    } else {}

    listWidget.add(IconButton(
        onPressed: () {
          subHelper.getSubAfter(last, subsProvider.filter);
        },
        icon: Icon(Icons.add)));

    return listWidget;
  }

  Widget cardSub(Sub sub) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(children: [
            Text(
              sub.subredditName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" * Posted by u/" + sub.author)
          ]),
          Container(
            height: 5,
          ),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Upvote " + sub.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[500]),
              )),
          Container(
            height: 5,
          ),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Icon(Icons.arrow_upward),
                  Text(sub.ups.toString()),
                ],
              )),
          Container(
            height: 10,
          ),
          Text(sub.selftext),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    subsProvider = Provider.of<SubsProvider>(context, listen: false);
    subHelper = SubHelper(context: context);
    listWidget.clear();
    getListSub();
  }

  @override
  void dispose() {
    super.dispose();
    subsProvider.isUpToDate = false;
    listWidget.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: MyAppBar(
          title: 'Subs Page',
        ),
        body: Container(
          color: Colors.orange[800],
          child: Column(
            children: [
              Selector<SubsProvider,String>(
                selector: (_,provider)=>provider.filter,
                builder: (context, data, child) {
                return Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          subsProvider.isUpToDate = false;
                          subsProvider.filter = "best";
                          listWidget.clear();
                          getListSub();
                        },
                        child: Container(
                          color: subsProvider.filter != "best"
                              ? null
                              : Colors.orange[600],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              "best",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              subsProvider.isUpToDate = false;
                              subsProvider.filter = "hot";
                              listWidget.clear();
                              getListSub();
                            },
                            child: Container(
                              color: subsProvider.filter != "hot"
                                  ? null
                                  : Colors.orange[600],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  "Hot",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        subsProvider.isUpToDate = false;
                        subsProvider.filter = "new";
                        listWidget.clear();
                        getListSub();
                      },
                      child: Container(
                        color: subsProvider.filter != "new"
                            ? null
                            : Colors.orange[600],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            "New",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ))
                  ],
                );}
              ),
              Expanded(
                  child: Selector<SubsProvider, bool>(
                      selector: (_, provider) => provider.isUpToDate,
                      builder: (context, data, child) {
                        if (data) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Selector<SubsProvider, List<Sub>>(
                                selector: (_, provider) => provider.listSub,
                                builder: (context, data2, child) {
                                  return Column(
                                    children: ListWidget(listSub: data2),
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
            ],
          ),
        ));
  }
}
