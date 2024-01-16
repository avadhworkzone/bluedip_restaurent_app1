
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../Styles/my_font.dart';

class ChipLayout extends StatelessWidget {

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  const ChipLayout({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      backgroundColor: Colors.white,
      label: Text(label),
      labelStyle: TextStyle(
          fontFamily: fontMavenProMedium,
          fontSize: 12.sp,
          color: black_354356
      ),
      deleteIcon: Container(
        height: 20.h,
        width: 20.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: 12,
        ),
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}