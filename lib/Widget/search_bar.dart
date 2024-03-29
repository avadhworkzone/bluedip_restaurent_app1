import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/search_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';

class SearchBarWidget extends StatefulWidget {
  // WhiteSearchBar({Key? key,required this.hintText,,required this.onChanged}) : super(key: key);

  SearchBarWidget(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted});

  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16.w, left: 16.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: SearchboxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            icon_search,
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                widget.onChanged(value);
              },
              onSubmitted: (value) {
                widget.onSubmitted(value);
              },
              autofocus: false,
              style: TextStyle(
                  color: black_354356,
                  fontFamily: fontMavenProProSemiBold,
                  fontSize: 14.sp),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: grey_969da8,
                    fontFamily: fontMavenProProSemiBold,
                    fontSize: 14.sp),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}
