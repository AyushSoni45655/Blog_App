import 'package:blog_app/core/constant/assetsHelper.dart';
import 'package:blog_app/core/constant/dimensionHelper.dart';
import 'package:blog_app/core/constant/fontsHelper.dart';
import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:blog_app/core/constant/stringHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/user_bloc/user_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  void _navigate() async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      bool isFirstTime = sh.getBool("isFirstTime") ?? true;
      await Future.delayed(Duration(seconds: 4));
      if(isFirstTime == true){
        await sh.setBool("isFirstTime", false);
        context.go("/signin");
      }
      else{
        context.read<UserBloc>().add(UserIsLoggedInEvent());
      }
    } catch (e) {
      debugPrint("Error in  the navigation: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if(state is UserLogOutState){
      context.go("/signin");
    }
    if(state is UserIsLoggedInState){
      context.go("/nav");
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            DimensionHelper.dimens_40.sp),
        child: Column(
        children: [
          SizedBox(height: AHelperFunction.screenSize(context).height * .2,),
          //Image(image: AssetImage(AssetsHelper.bSplash1))
          Image.asset(
            AssetsHelper.bSplash1,
            height: AHelperFunction.screenSize(context).height * .35,
            width: AHelperFunction.screenSize(context).width,
            fit: BoxFit.cover,
          ),
          SizedBox(height: AHelperFunction.screenSize(context).height * .03,),
          Text(
            StringHelper.bSTitle,style: GoogleFonts.frijole(
            color: Colors.white,
            letterSpacing: 6,
            fontSize: FontHelper.font_40
          ),
          ),
          SizedBox(height: AHelperFunction.screenSize(context).height * .02,),
          Image.asset(
            AssetsHelper.bSplash2,
            height: AHelperFunction.screenSize(context).height * .28,
            width: AHelperFunction.screenSize(context).width,
            fit: BoxFit.cover,
          ),
        ],
      ),),
    );
  },
);
  }
}
