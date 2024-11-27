import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Models/premier_league_model.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

class MyDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PremierLeagueModel premierLeagueModel = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x906482AD),
        title: MyText(
            text: "Team Profile",
            fontsize: 20,
            fontfamily: "MontserratBold",
            color: Color(0xfff0f0f0),
            textAlign: TextAlign.center),
        iconTheme: IconThemeData(
          color: Color(0xfff0f0f0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x906482AD),
                Color(0xff6482AD),
              ],
              stops: [
                0.0,
                1,
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  premierLeagueModel.strBadge,
                  height: 300,
                ),
              ),
              SizedBox(height: 24),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: MyDetailText(
                        text: 'Name : ${premierLeagueModel.strTeam}',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: MyDetailText(
                        text:
                            'Alternate Name : ${premierLeagueModel.strTeamAlternate}',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: MyDetailText(
                        text: 'Stadium : ${premierLeagueModel.strStadium}',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: MyDetailText(
                        text: 'Address : ${premierLeagueModel.strLocation}',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: MyDetailText(
                        text:
                            'Description : ${premierLeagueModel.strDescriptionEN}',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
