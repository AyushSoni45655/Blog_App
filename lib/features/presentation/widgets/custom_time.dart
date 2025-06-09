import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';

class CustomTime extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double ?height;
  final double ?width;
  final bool isTAndDate ;

  const CustomTime({
    super.key,
    this.height,
    this.width,
    this.isTAndDate = false,
    required this.controller,
    required this.hintText,
  });

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        widget.controller.text = DateFormat('hh:mm a').format(selectedTime);
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
          onTap: () => _selectTime(context),
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
