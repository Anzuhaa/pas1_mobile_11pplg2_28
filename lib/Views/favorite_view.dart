import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/fav_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_card.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

class MyFavoriteView extends StatelessWidget {
  MyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final FavController favController = Get.put(FavController());
    favController.loadTasks();
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
        backgroundColor: Color(0x906482AD),
        title: MyText(
            text: "Favorite Teams",
            fontsize: 20,
            fontfamily: "MontserratBold",
            color: Color(0xfff0f0f0),
            textAlign: TextAlign.center),
      ),
      body: Obx(() {
        if (favController.tasks.isEmpty) {
          return Center(
            child: Text(
              'No club is currently favored.',
              style: TextStyle(color: Color(0x906482AD), fontSize: 24),
            ),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: favController.tasks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) {
            return MyCard(
              premierLeagueModel: favController.tasks[index],
              allowDeletion: true,
            );
          },
        );
      }),
    );
  }
}
