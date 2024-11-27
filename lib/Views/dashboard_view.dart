import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/dashboard_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Views/favorite_view.dart';
import 'package:pas1_mobile_11pplg2_28/Views/home_view.dart';
import 'package:pas1_mobile_11pplg2_28/Views/profile_view.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_circle_avatar.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [
      MyHomeView(),
      MyFavoriteView(),
      MyProfileView()
    ];

    return Obx(
      () {
        return Scaffold(
          backgroundColor: Color(0xfff0f0f0),
          body: menus[dashboardController.selectedindex.value],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Color(0xfff0f0f0),
            color: Color(0x906482AD),
            animationDuration: Duration(milliseconds: 400),
            onTap: dashboardController.changesMenu,
            items: [
              MyCircleAvatar(
                radius: 16,
                bgColor: Color(0x006482AD),
                icon: Icon(
                  Icons.sports_soccer_rounded,
                  color: Color(0xfff0f0f0),
                  size: 32,
                ),
              ),
              MyCircleAvatar(
                radius: 16,
                bgColor: Color(0x006482AD),
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xfff0f0f0),
                  size: 32,
                ),
              ),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/anzuhaa.jpg'),
              ),
            ],
          ),
        );
      },
    );
  }
}
