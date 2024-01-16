import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Styles/my_colors.dart';

final drop_down_box_shadow = BoxDecoration(
    borderRadius: BorderRadius.circular(15.r),
    boxShadow: [BoxShadow(
        color: const Color(0xffe5ebf6),
        offset: Offset(0,6),
        blurRadius: 8,
        spreadRadius: 0
    )] ,
    color: Colors.white
);

// final selectboxDecoration = BoxDecoration(
//     border: Border.all(color: bg_btn_199a8e, width: 1),
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(
//         color: shadow_0x0f041d42,
//         offset: Offset(
//           0.0,
//           3.0,
//         ),
//         blurRadius: 21.0,
//         spreadRadius: 0.0,
//       )
//     ],
//     borderRadius: BorderRadius.all(Radius.circular(14.r)));
