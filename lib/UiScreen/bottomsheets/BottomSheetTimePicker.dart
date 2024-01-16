import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';

class BottomSheetTimePicker extends StatefulWidget {
  const BottomSheetTimePicker({Key? key}) : super(key: key);

  @override
  State<BottomSheetTimePicker> createState() => _BottomSheetTimePickerState();
}

class _BottomSheetTimePickerState extends State<BottomSheetTimePicker> {
  Duration duration = const Duration(hours: 1, minutes: 23);

  Duration initialTimer = const Duration();
  // var time;

  DateTime time = DateTime(2016, 5, 10, 22, 35);

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts
  // a CupertinoTimerPicker.
  // void _showDialog(Widget child) {
  //   showCupertinoModalPopup<void>(
  //       context: context,
  //       builder: (BuildContext context) => Container(
  //         height: 216,
  //         padding: const EdgeInsets.only(top: 6.0),
  //         // The bottom margin is provided to align the popup above the system
  //         // navigation bar.
  //         margin: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         // Provide a background color for the popup.
  //         color: CupertinoColors.systemBackground.resolveFrom(context),
  //         // Use a SafeArea widget to avoid system overlaps.
  //         child: SafeArea(
  //           top: false,
  //           child: child,
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Daily Opportunities
              // Title
              Center(
                child: Text("Select Time",
                    style: TextStyle(
                        color: black_354356,
                        fontFamily: fontMavenProBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 12.h,
              ),
              // Description
              Center(
                child: Text(
                    "Choose a time when you wanted to \nstart and end Deal.",
                    style: TextStyle(
                        color: grey_969da8,
                        fontFamily: fontMavenProRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp),
                    textAlign: TextAlign.center),
                heightFactor: 1.2,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: divider_d4dce7,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              // child: timerPicker(),
              child: Container(
                height: 150,
                child: CupertinoDatePicker(
                  initialDateTime: time,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false,
                  // This is called when the user changes the time.
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => time = newTime);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // child: timerPicker(),
              child: Container(
                height: 150,
                child: CupertinoDatePicker(
                  initialDateTime: time,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false,
                  // This is called when the user changes the time.
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => time = newTime);
                  },
                ),
              ),
            ),
          ],
        ),

        Divider(
          height: 1,
          thickness: 1,
          color: divider_d4dce7,
        ),

        // Cancel
        Center(
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Confirm".toUpperCase(),
                  style: TextStyle(
                      color: Blue_5468ff,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontMavenProMedium,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp),
                  textAlign: TextAlign.center),
            ),
          ),
        )
      ],
    );
  }

  // Widget timerPicker() {
  //   return CupertinoTimerPicker(
  //     mode: CupertinoTimerPickerMode.hm,
  //     minuteInterval: 1,
  //     secondInterval: 1,
  //
  //     initialTimerDuration: initialTimer,
  //     onTimerDurationChanged: (Duration changeTimer) {
  //       setState(() {
  //         initialTimer = changeTimer;
  //         time =
  //         '${changeTimer.inHours} hrs ${changeTimer.inMinutes % 60} mins ';
  //       });
  //     },
  //   );
  // }

  Widget _buildContainer(Widget picker) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 18.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _TimerPickerItem extends StatelessWidget {
  const _TimerPickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
