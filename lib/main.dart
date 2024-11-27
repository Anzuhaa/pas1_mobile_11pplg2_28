import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Views/dashboard_view.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/apilogin_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Views/detail_view.dart';
import 'package:pas1_mobile_11pplg2_28/Views/login_view.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/profile_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/splash_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF6482AD),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0x756482AD),
          secondary: Color(0xff7FA1C3),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6482AD),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController());
        Get.put(ApiloginController());
      }),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(SplashController());
            },
          ),
        ),
        GetPage(
          name: '/login',
          page: () => MyLoginView(),
          binding: BindingsBuilder(
            () {
              Get.put(ApiloginController());
            },
          ),
        ),
        GetPage(
          name: '/home',
          page: () => const MyDashboard(),
          binding: BindingsBuilder(
            () {
              Get.put(ProfileController());
            },
          ),
        ),
        GetPage(name: '/detailedview', page: () => MyDetailView()),
      ],
    );
  }
}
