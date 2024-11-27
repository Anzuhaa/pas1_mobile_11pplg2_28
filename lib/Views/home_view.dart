import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/fav_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/post_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_card.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

class MyHomeView extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  bool allowDeletion = false;

  @override
  Widget build(BuildContext context) {
    final FavController favController = Get.put(FavController());
    favController.loadTasks();
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
        backgroundColor: Color(0x906482AD),
        title: MyText(
            text: "Premier League Teams",
            fontsize: 20,
            fontfamily: "MontserratBold",
            color: Color(0xfff0f0f0),
            textAlign: TextAlign.center),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (postController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: postController.postList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (context, index) {
                    return MyCard(
                      premierLeagueModel: postController.postList[index],
                      allowDeletion: false,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
