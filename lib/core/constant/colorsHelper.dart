
import 'package:flutter/material.dart';

class ColorsHelper{
  ColorsHelper._();
  static Color? getColor (String value){
    if(value == 'Green'){
      return Colors.green;
    }
    else if(value == 'Red'){
      return Colors.red;
    }else if(value == 'Pink'){
      return Colors.pink;
    }else if(value == 'White'){
      return Colors.white;
    }
    else if(value == 'Yellow'){
      return Colors.yellow;
    }
    return null;
  }
  static const Color deepPurple = Colors.deepPurple;
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Colors.deepPurpleAccent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color black45 = Colors.black45;
  static const Color orangeColor = Colors.orangeAccent;
  static const Color redColor = Colors.red;
  static const Color navyBlue = Color(0xff05243E);
  static  Color greyColor= Colors.grey.withOpacity(0.3);
  static const Color blueColor = Colors.blue;
  static const Color nBlue = Color(0xff42446E);
  static const Color lBlue = Color(0xff3894E8);
  static const Color nBlue1 = Color(0xff6B6DD6);
  static const Color greenColor = Colors.green;
  //static const Color orangeColor = Colors.deepOrangeAccent;
// get started Page color button
static const Color gsButton = Color(0xffF83758);
static const Color viewAllColor1 = Color(0xff4392F9);
static const Color viewAllColor2 = Color(0xffFD6E87);
static const Color bSeller = Color(0xff5B9EE1);

// EXPANCE & TRACKER APP COLORS
static const Color primaryDark = Color(0xff2A7C76);
static const Color primaryLight = Color(0xff429690);

                                                              //ELECTRONICS APP USING FLUTTER AND FIREBASE
static const Color splashB = Color(0xffecefe8);
// movie app colors
 static const Color splashBack = Color(0xffBECBCE);
 static const Color blue = Color(0xff5B5CFE);
 static const Color lightBlue = Color(0xff00B2FF);

                             //                 TO DO APPLICATIONS            ///
static const LinearGradient backColor = LinearGradient(
  colors: [
  // Color(0xffFFFFFF),
  // Color(0xff52B5F5),Color(0xff333333),
  // Color(0xffB3B3B3),Color(0xff529FD3),
  // Color(0xff63D9F3),Color(0xff000000),
  // Color(0xff05243E),Color(0xff0EA5E9),
    //Color(0xffFFFFFF),
  Color(0xff1253AA)
    ,Color(0xff05243E)
 // ,Color(0xff17A1FA)
],begin: Alignment.topCenter,end: Alignment.bottomCenter,stops: [0.2,1.0]
);

}