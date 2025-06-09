import 'package:blog_app/core/constant/helper_funcction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/dimensionHelper.dart';
import '../../../core/constant/fontsHelper.dart';
import 'custom_text.dart';

class CustomBlog extends StatelessWidget {
  final String ?date;
  final String ?time;
  final VoidCallback? callback;
  final String ?image;
  final String ?title;
  const CustomBlog({super.key, this.callback, this.image, this.title,  required this.date, this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: DimensionHelper.dimens_20.h,
        ),
        height: DimensionHelper.dimens_300.h,
        width: DimensionHelper.dimens_all,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 3),
          borderRadius: BorderRadius.circular(
            DimensionHelper.dimens_40.r,
          ),
          // color: Colors.yellow
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(DimensionHelper.dimens_50),
              child: Image.network(
                image??"No Image Here...",
                fit: BoxFit.cover,
                width: DimensionHelper.dimens_all,
              ),
            ),
            CustomText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                margin: EdgeInsets.only(
                    top: DimensionHelper.dimens_170
                ),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                fontsize: FontHelper.font_32,
                fontFamily: GoogleFonts.boogaloo().fontFamily,
                text: title??"It is a long established fact that a reader will g established fact that a reader will "
            ),
            CustomText(
              color: Colors.green,
              margin: EdgeInsets.only(
                left: DimensionHelper.dimens_30,
                top: DimensionHelper.dimens_300
              ),
              text: date??"No Date",
              fontsize: FontHelper.font_30,
              fontFamily: GoogleFonts.calistoga().fontFamily,
              alignment: Alignment.centerLeft,
            ),
            CustomText(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: AHelperFunction.screenSize(context).width * .7,
                  top: DimensionHelper.dimens_300
              ),
              text: time??"No Time",
              fontsize: FontHelper.font_30,
              fontFamily: GoogleFonts.calistoga().fontFamily,
              alignment: Alignment.centerLeft,
            )
          ],
        ),
      ),
    );
  }
}
