import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/dimensionHelper.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String ?name;
  final String ?email;
  final bool isBio;
  final VoidCallback ?lCallBack;
  final bool isProfile;
  final bool isArrow;
  final String ?image;
  const CustomAppBar(this.lCallBack, this.image, {super.key, this.isArrow = false,this.isProfile = true, this.name, this.email,  this.isBio = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      actions: [
        isProfile?Container(
          //padding: EdgeInsets.all(DimensionHelper.dimens_10.sp),
          height: DimensionHelper.dimens_70.h,
          width: DimensionHelper.dimens_150.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4,color: Colors.yellow)
          ),
          child: Center(child: Image.asset(image!,fit: BoxFit.cover,),),
        ):SizedBox(),
        SizedBox(width: DimensionHelper.dimens_20.w,)
      ],
      title: Row(
        children: [
          isArrow?IconButton(onPressed: lCallBack, icon: Icon(Icons.arrow_back,color: Colors.white,size: 50,)):Container(
            margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20),
            height: DimensionHelper.dimens_60.h,
            width: DimensionHelper.dimens_80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r),
                color: Colors.grey.shade500
            ),
            child: Center(
              child: IconButton(onPressed: lCallBack, icon: Icon(Icons.menu_outlined,color: Colors.black,size: 60,)),
            ),
          ),
          SizedBox(width: AHelperFunction.screenSize(context).width * .06,),
          isBio?Column(
            children: [
              Text(name??"Ayush soni",style: Theme.of(context).textTheme.headlineLarge,),
              Text(email??"asoni84080@gmail.com",style: Theme.of(context).textTheme.headlineMedium)
            ],
          ):SizedBox(),

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(DimensionHelper.dimens_100);

}