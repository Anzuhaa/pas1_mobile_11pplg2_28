import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/apilogin_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/profile_controller.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

class MyProfileView extends GetView<ProfileController> {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiloginController apiloginController = Get.put(ApiloginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Color(0xff6482AD),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/anzuhaa.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: MyText(
                        textAlign: TextAlign.center,
                        text: "${apiloginController.username}",
                        fontsize: 24,
                        fontfamily: 'MontserratSemi',
                        color: Color(0xff6482AD),
                      ),
                    ),
                    SizedBox(height: 4),
                    Center(
                      child: MyText(
                        textAlign: TextAlign.center,
                        text: "${apiloginController.username}@gmail.com",
                        fontsize: 20,
                        fontfamily: "MontserratSemi",
                        color: Color(0xff6482AD),
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xfffefefe),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildProfileInfoItem(
                                  Icons.admin_panel_settings_rounded, 'Admin'),
                              _buildProfileInfoItem(
                                  Icons.location_on, 'Indonesia'),
                              _buildProfileInfoItem(Icons.cake, '16 - 06'),
                            ],
                          ),
                          SizedBox(height: 16),
                          MyText(
                              textAlign: TextAlign.center,
                              text: "Liverpool Fans",
                              fontsize: 16,
                              fontfamily: "MontserratSemi",
                              color: Color(0xff6482AD))
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    ListTile(
                      leading: Icon(Icons.settings, color: Color(0xff6482AD)),
                      title: MyText(
                          textAlign: TextAlign.center,
                          text: "Terms of Service",
                          fontsize: 20,
                          fontfamily: "MontserratSemi",
                          color: Color(0xff6482AD)),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xff6482AD)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Color(0xff6482AD)),
                      title: MyText(
                          textAlign: TextAlign.center,
                          text: "Log Out",
                          fontsize: 20,
                          fontfamily: "MontserratSemi",
                          color: Color(0xff6482AD)),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xff6482AD)),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xfff0f0f0))),
                              backgroundColor: Color(0x906482AD),
                              titleTextStyle: TextStyle(
                                color: Color(0xfff0f0f0),
                                fontWeight: FontWeight.bold,
                              ),
                              title: Text(
                                'Are you sure want to log out from ${apiloginController.username}?',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Color(0xfff0f0f0),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    apiloginController.logoutUser();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Color(0xfff0f0f0),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfff0f0f0),
    );
  }

  Widget _buildProfileInfoItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Color(0xff6482AD), size: 32),
        const SizedBox(height: 8),
        MyText(
          textAlign: TextAlign.center,
          text: label,
          fontsize: 16,
          fontfamily: "MontserratSemi",
          color: Color(0xff6482AD),
        ),
      ],
    );
  }
}
