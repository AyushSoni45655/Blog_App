import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String ?fontFamily;
  final EdgeInsetsGeometry ? margin;
  final String ?text;
  final double ?spacingLetter;
  final TextAlign ?textAlign;
  final Color ?color;
  final int ?maxLines;
  final TextOverflow? overflow;
  final VoidCallback ? callback;
  final AlignmentGeometry ?alignment;
  final double ?fontsize;
  final FontWeight ?fontWeight;

   const CustomText({super.key, this.text, this.color, this.alignment, this.fontWeight, this.callback, this.textAlign, this.fontsize, this.maxLines = 40, this.overflow, this.margin, this.spacingLetter, this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: margin,
        alignment: alignment,
        child: Text(text??'',style: TextStyle(
            color: color?? Colors.white,
            fontSize: fontsize??26,
            letterSpacing: spacingLetter,
            fontWeight: fontWeight??FontWeight.bold,
          fontFamily: fontFamily
        ),
          textAlign: textAlign??TextAlign.center,
          maxLines: maxLines,
          overflow: overflow,
        ),
      ),
    );
  }
}
