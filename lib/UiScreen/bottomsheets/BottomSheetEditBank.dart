import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';

class BottomSheetEditBank extends StatefulWidget {
  const BottomSheetEditBank({Key? key}) : super(key: key);

  @override
  State<BottomSheetEditBank> createState() => _BottomSheetEditBankState();
}

class _BottomSheetEditBankState extends State<BottomSheetEditBank> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 26, bottom: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text("Enter Password",
                  style: TextStyle(
                      color: black_354356,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp,
                      fontFamily: fontMavenProRegular),
                  textAlign: TextAlign.left),

              SizedBox(
                height: 6.h,
              ),

              PasswordTextField(textInputAction: TextInputAction.done),

              SizedBox(
                height: 40.h,
              ),

              CommonBlueButton(strContinue.toUpperCase(), () {}, blue_3653f6),
            ],
          ),
        ),
      ],
    );
  }
}
