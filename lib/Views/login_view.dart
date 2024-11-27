import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_button.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';
import 'package:pas1_mobile_11pplg2_28/Controller/apilogin_controller.dart';

class MyLoginView extends StatefulWidget {
  const MyLoginView({super.key});

  @override
  State<MyLoginView> createState() => _MyLoginViewState();
}

class _MyLoginViewState extends State<MyLoginView> {
  bool _obscurePassword = true;
  final ApiloginController apiloginController = Get.put(ApiloginController());
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleUsernameClear() {
    setState(() {
      username.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff6482AD),
                Color(0xfff0f0f0),
              ],
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MyTextfield(
                  textInputType: TextInputType.text,
                  labelText: 'Username',
                  fontsize: 20,
                  textColor: Color(0xfff0f0f0),
                  isObsecure: false,
                  controller: username,
                  onIconPressed: _toggleUsernameClear,
                  icons: Icons.clear_rounded,
                  colors: Color(0x906482AD),
                  bgColor: Color(0x90F0F0F0),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MyTextfield(
                  textInputType: TextInputType.text,
                  labelText: 'Password',
                  fontsize: 20,
                  textColor: Color(0xfff0f0f0),
                  isObsecure: _obscurePassword,
                  controller: password,
                  onIconPressed: _togglePasswordVisibility,
                  icons: _obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  colors: Color(0x906482AD),
                  bgColor: Color(0x90F0F0F0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 32),
                child: MyHelpbutton(
                  text: "Forgot your password?",
                  onPressed: () {},
                ),
              ),
              Spacer(),
              MyBottomButton(
                text: "Log In",
                onPressed: () {
                  if (username.text.isEmpty || password.text.isEmpty) {
                    apiloginController.loginStatus.value =
                        'All fields are required';
                    Get.snackbar(
                      'Error',
                      'Please fill in all fields.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    apiloginController.loginUser(
                      username.text,
                      password.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
