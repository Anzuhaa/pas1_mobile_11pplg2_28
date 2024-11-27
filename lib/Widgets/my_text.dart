// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//textfield
class MyTextfield extends StatelessWidget {
  final String labelText;
  final double fontsize;
  final bool isObsecure;
  final IconData? icons;
  final Color? colors;
  final Color bgColor;
  final Color? textColor;
  final TextEditingController? controller;
  final VoidCallback onIconPressed;
  final TextInputType? textInputType;

  const MyTextfield({
    super.key,
    required this.labelText,
    required this.fontsize,
    required this.isObsecure,
    this.icons,
    required this.controller,
    required this.onIconPressed,
    required this.textColor,
    this.colors,
    required this.bgColor,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: textInputType,
        style: TextStyle(
          fontFamily: 'MontserratSemi',
          color: textColor,
          fontSize: fontsize,
        ),
        obscureText: isObsecure,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'MontserratSemi',
            color: textColor,
            fontSize: fontsize,
          ),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x10ffffff)),
              borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x10ffffff)),
              borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: bgColor,
          suffixIcon: GestureDetector(
            onTap: onIconPressed,
            child: Icon(
              icons,
              color: colors,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}

//spantext
class MyTextSpan extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final double fontsize;
  final String fontfamily;
  final Color colorPrimary;
  final Color colorSpan;
  final TextAlign textAlign;

  const MyTextSpan({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.fontsize,
    required this.fontfamily,
    required this.colorPrimary,
    required this.colorSpan,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: text1, style: TextStyle(color: colorPrimary)),
          TextSpan(text: text2, style: TextStyle(color: colorSpan)),
          TextSpan(text: text3, style: TextStyle(color: colorPrimary)),
          TextSpan(text: text4, style: TextStyle(color: colorSpan)),
        ],
      ),
    ));
  }
}

//normal text
class MyText extends StatelessWidget {
  final String text;
  final double fontsize;
  final String fontfamily;
  final Color color;
  final TextAlign textAlign;

  const MyText({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontfamily,
    required this.color,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        textAlign: textAlign,
        text,
        style: TextStyle(
          fontFamily: fontfamily,
          fontSize: fontsize,
          color: color,
        ),
      ),
    );
  }
}

class MyDetailText extends StatelessWidget {
  final String text;

  const MyDetailText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "MontserratSemi",
        fontSize: 14,
        color: Color(0xfff0f0f0),
      ),
    );
  }
}
