import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';

class CustomDateSelector extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double ?height;
  final double ?width;
  final bool isTAndDate ;

   const CustomDateSelector({
    super.key,
        this.height,
        this.width,
     this.isTAndDate = false,
    required this.controller,
    required this.hintText,
  });

  @override
  State<CustomDateSelector> createState() => _CustomDateSelectorState();
}

class _CustomDateSelectorState extends State<CustomDateSelector> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(2000),   // Minimum date
      lastDate: DateTime(2101),    // Maximum date
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ??DimensionHelper.dimens_80,
      width: widget.width ??DimensionHelper.dimens_80,
        padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_10),
      decoration: BoxDecoration(
          color: ColorsHelper.navyBlue,
          borderRadius: BorderRadius.circular(DimensionHelper.dimens_10.r)
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: FontHelper.font_26,
          fontWeight: FontWeight.bold
        ),
        controller: widget.controller,
        readOnly: true, // ताकि यूज़र manually कुछ टाइप न करे
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: FontHelper.font_32
          ),
          suffixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      )
    );
  }
}
