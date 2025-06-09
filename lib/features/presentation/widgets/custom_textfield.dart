import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';
class CustomTextfield extends StatelessWidget {
  final String ? prefixText;
  final int ? maxLength;
  final EdgeInsetsGeometry ?margin;
  final String ? Function(String?)?validatore;
  final TextEditingController? controller;
  final String? hintText;
  final bool hide;
  final IconData ?preIcon;
  final Widget ?suffixIcon;
  final TextInputType ?inputType;
  const CustomTextfield({super.key,  this.validatore,  this.controller, this.hintText, this.hide = false, this.inputType, this.preIcon, this.suffixIcon, this.margin, this.prefixText, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(right: DimensionHelper.dimens_30.w,left: 20),
      height: DimensionHelper.dimens_70.h,
      width: DimensionHelper.dimens_all,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow,width: 2),
        //color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r)
      ),
      child: TextFormField(
        maxLength: maxLength,
        cursorColor: Colors.pink,
        cursorWidth: 3,
        validator: validatore,
        controller: controller,
        obscureText: hide,
        keyboardType: inputType,
        style: TextStyle(color: Colors.white,fontSize: FontHelper.font_28,fontWeight: FontHelper.medium),
        decoration: InputDecoration(
          prefixText: prefixText,
          prefixStyle: TextStyle(
            color: Colors.white,
            fontSize: FontHelper.font_30
          ),
          errorStyle: TextStyle(
            height: 0.1,
            color: Colors.white,
            fontSize: FontHelper.font_20
          ),
          prefixIcon: Icon(preIcon,size: DimensionHelper.dimens_50.sp,color: Colors.white,),
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(borderSide: BorderSide.none),

          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: FontHelper.font_24,
          )
        ),
      ),
    );
  }
}
