import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/fav_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/post_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Models/premier_league_model.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

class MyCard extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final FavController favController = Get.put(FavController());
  final PremierLeagueModel premierLeagueModel;
  bool allowDeletion = false;

  MyCard(
      {super.key,
      required this.premierLeagueModel,
      required this.allowDeletion});

  @override
  Widget build(BuildContext context) {
    favController.loadTasks();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [
              Color(0xff6482AD),
              Color(0xfff0f0f0),
            ],
          ),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Color(0xff6482AD), width: 1.5, style: BorderStyle.solid)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  postController.detailed(premierLeagueModel);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        premierLeagueModel.strBadge,
                      )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: MyText(
                      text: premierLeagueModel.strTeam,
                      fontsize: 14,
                      fontfamily: 'MontserratBold',
                      color: Color(0xfff0f0f0),
                      textAlign: TextAlign.left),
                ),
              ),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 8),
                child: Obx(
                  () {
                    var isLiked = favController
                        .getLikedById(premierLeagueModel.idTeam)
                        .value;
                    return IconButton(
                        onPressed: () {
                          if (isLiked) {
                            if (allowDeletion) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xfff0f0f0))),
                                    backgroundColor: Color(0x906482AD),
                                    titleTextStyle: TextStyle(
                                      color: Color(0xfff0f0f0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    title: Text(
                                      'Remove this item from favourites?',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No',
                                            style: TextStyle(
                                                color: Color(0xfff0f0f0))),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          favController.deleteTask(
                                              premierLeagueModel.idTeam);
                                          Get.snackbar('Information',
                                              '${premierLeagueModel.strTeam} removed from favorites.',
                                              backgroundColor: Colors.green,
                                              colorText: Colors.white);
                                        },
                                        child: Text('Yes',
                                            style: TextStyle(
                                                color: Color(0xfff0f0f0))),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              Get.snackbar('Error',
                                  'You can only remove favorites from Library.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            }
                          } else {
                            favController.addTask(premierLeagueModel);
                            Get.snackbar('Information',
                                '${premierLeagueModel.strTeam} added to favorites.',
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                          }
                        },
                        icon: Icon(
                          isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isLiked ? Colors.white : Colors.white,
                          size: 24,
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
