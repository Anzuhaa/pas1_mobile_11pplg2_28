import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_28/Widgets/my_text.dart';

//helpbutton
class MyHelpbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyHelpbutton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'MontserratSemi',
            color: Color(0x90F0F0F0),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

//textbutton
class MyTextbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData? icons;
  final Color? colors;

  final Color textColor;
  final double height;
  final double borderRadius;

  const MyTextbutton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.height = 60,
    this.borderRadius = 4.0,
    this.icons,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'MontserratSemi',
            color: textColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

//bottombutton
class MyBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyBottomButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: MyTextSpan(
                      text1:
                          "By logging in or registering, you agree to Echo's ",
                      text2: "Terms of Service ",
                      text3: "and ",
                      text4: "Privacy Policy",
                      fontsize: 12,
                      fontfamily: 'MontserratSemi',
                      colorPrimary: Color(0xff000000),
                      colorSpan: Color(0xff6482AD),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MyTextbutton(
                    text: text,
                    onPressed: onPressed,
                    backgroundColor: Color(0xff7FA1C3),
                    textColor: Color(0xfff0f0f0),
                    borderRadius: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
