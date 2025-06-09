import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';



class CustomButton extends StatelessWidget {
  final EdgeInsetsGeometry ? margin;
  final double ?height;
  final double ?width;
  final String? text;
  final bool  cText;
  final Color ?color;
  final bool isIcon;
  final VoidCallback? callback;
  const CustomButton({super.key, this.height = 50, this.width = DimensionHelper.dimens_all, this.text, this.callback, this.cText = true, this.color, this.margin, this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: isIcon?EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_40.sp):null,
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: cText?null:Border.all(color: ColorsHelper.nBlue1,width: 4),
          color: cText?color??ColorsHelper.blackColor:ColorsHelper.transparent,
          borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r)
        ),
        child: isIcon?Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_circle_right_outlined,size: 60,color: Colors.white,),
            Text(text??"",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontHelper.font_40,
                color:cText? CupertinoColors.white:CupertinoColors.white
            ),),
          ],
        ):Center(
          child: Text(text??"",textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontHelper.font_36,
              color:cText? CupertinoColors.white:CupertinoColors.white
          ),),
        ),
      ),
    );
  }
}
