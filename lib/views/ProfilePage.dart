

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redditech/model/core/Info.dart';
import 'package:redditech/model/core/Prefs.dart';
import 'package:redditech/model/helper/InfoHelper.dart';
import 'package:redditech/model/helper/PrefsHelper.dart';
import 'package:redditech/provider/ProfileProvider.dart';
import 'package:redditech/data/userData.dart' as userData;

import 'MyAppBar.dart';
import 'MyDrawer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  late Info info;
  late Prefs prefs;

  late ProfileProvider profileProvider;

  InfoHelper infoHelper = InfoHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  bool isSwitched = true;

  Future<bool> getInfoAndPrefs() async {
    info = await infoHelper.getInfo();
    prefs = await prefsHelper.getPrefs();

    profileProvider.index =
        profileProvider.country_code.indexOf(prefs.country_code);
    profileProvider.index_mps =
        profileProvider.accept_pms.indexOf(prefs.accept_pms);
    if (profileProvider.index == -1) {
      profileProvider.index = 11;
    }
    profileProvider.prefs = prefs;

    return true;
  }

  Widget _myDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
            flex: 7,
            child: SizedBox(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[500],
                ))),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    print(userData.accessToken);
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(title: 'Profile Page',),
      body: FutureBuilder<bool>(
          future: getInfoAndPrefs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      getInfoAndPrefs();
                    },
                    child: SizedBox(
                        height: 256,
                        child: Center(
                            child: Image(
                              image: NetworkImage(info.imgSrc),
                              fit: BoxFit.fill,
                            ))),
                  ),
                  SizedBox(
                      height: 45,
                      child: Center(
                          child: Text(
                            info.name,
                            style: TextStyle(fontSize: 20),
                          ))),
                  _myDivider(),
                  SizedBox(
                      height: 45,
                      child: Center(
                          child: Text(
                            "Subscribers : " + info.subscribers.toString(),
                            style: TextStyle(fontSize: 20),
                          ))),
                  _myDivider(),
                  SizedBox(
                      child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Description : " + info.description,
                            ),
                          ))),
                  _myDivider(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Consumer<ProfileProvider>(
                          builder: (context, data, child) {
                            return Column(
                              children: [
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Adult content")),
                                      Switch(
                                          value: prefs.over_18,
                                          onChanged: (value) {
                                            profileProvider.prefs.over_18 = value;
                                            profileProvider.prefs.no_profanity =
                                                value;
                                            prefsHelper
                                                .postPrefs(profileProvider.prefs);
                                            profileProvider.prefs =
                                                profileProvider.prefs;
                                          })
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("no_profanity")),
                                      Switch(
                                          value: profileProvider.prefs.no_profanity,
                                          onChanged: (value) {
                                            profileProvider.prefs.no_profanity =
                                                value;
                                            prefsHelper
                                                .postPrefs(profileProvider.prefs);
                                            profileProvider.prefs =
                                                profileProvider.prefs;
                                          })
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                              "Enable home feed recommendation")),
                                      Switch(
                                          value: profileProvider.prefs.feed_reco_en,
                                          onChanged: (value) {
                                            profileProvider.prefs.feed_reco_en =
                                                value;
                                            prefsHelper
                                                .postPrefs(profileProvider.prefs);
                                            profileProvider.prefs =
                                                profileProvider.prefs;
                                          })
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child:
                                          Text("Allow people to follow you")),
                                      Switch(
                                          value: profileProvider.prefs.en_follow,
                                          onChanged: (value) {
                                            profileProvider.prefs.en_follow = value;
                                            prefsHelper
                                                .postPrefs(profileProvider.prefs);
                                            profileProvider.prefs =
                                                profileProvider.prefs;
                                          })
                                    ],
                                  ),
                                ),
                                Center(
                                    child: Row(
                                      children: [
                                        Expanded(child: Text("Country")),
                                        DropdownButton(
                                          value: profileProvider
                                              .country_name[profileProvider.index],
                                          onChanged: (String? value) {
                                            if (value != null) {
                                              profileProvider.index = profileProvider
                                                  .country_name
                                                  .indexOf(value);
                                              profileProvider.prefs.country_code =
                                              profileProvider.country_code[
                                              profileProvider.index];
                                              profileProvider.prefs =
                                                  profileProvider.prefs;
                                              prefsHelper
                                                  .postPrefs(profileProvider.prefs);
                                            }
                                          },
                                          items: profileProvider.country_name
                                              .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ],
                                    )),
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Who can send mps")),
                                      DropdownButton(
                                        value: profileProvider
                                            .accept_pms[profileProvider.index_mps],
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            profileProvider.index_mps =
                                                profileProvider.accept_pms
                                                    .indexOf(value);
                                            profileProvider.prefs.accept_pms =
                                            profileProvider.accept_pms[
                                            profileProvider.index_mps];
                                            profileProvider.prefs =
                                                profileProvider.prefs;
                                            prefsHelper
                                                .postPrefs(profileProvider.prefs);
                                          }
                                        },
                                        items: profileProvider.accept_pms
                                            .map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                              ],
                            );
                          }),
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
