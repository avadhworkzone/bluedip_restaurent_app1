import 'dart:async';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../modal/apiModel/response_model/get_order_list_res_model.dart';
import '../../modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import '../../utils/typedef_utils.dart' as tpdf;

class TimerWidget extends StatefulWidget {
  Data apiRes;
  final tpdf.OnTap? onTap;

  TimerWidget({super.key, required this.apiRes, required this.onTap});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  Duration remainingTime = const Duration(minutes: 1);
  int second = 0;

  void _startTimer() {
    DateTime orderCreationTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(widget.apiRes.dateCreated);

    ///widget.apiRes.dateCreated
    // remainingTime =
    //     orderCreationTime.difference(currentTime);
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        final now = DateTime.now();
        second = now.difference(orderCreationTime).inSeconds;
        if (second > 60) {
          timer.cancel();
        } else {
          remainingTime = Duration(seconds: 60 - second);
        }
        setState(() {});
        // remainingTime = remainingTime! - const Duration(seconds: 1);
        // if (orderCreationTime.difference(currentTime).inMinutes >= 1) {
        //   timer.cancel();
        // }
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // second > 60
        //   ? const SizedBox()
        //   :
        Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: widget.onTap,
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>
              //       const OrderDetail(),
              //     ));

              child: Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Blue_5468ff),
                child: Text("ACCEPT (${formatDuration(remainingTime)})",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontMavenProMedium,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp),
                    textAlign: TextAlign.center),
              ),
            ));
  }
}

/// order detail timer

class OrderDetailTimer extends StatefulWidget {
  OrderDetailTimer({Key? key, required this.apiDataRes, required this.onTap})
      : super(key: key);
  OrderDetailData apiDataRes;
  final tpdf.OrderDetailOnTap? onTap;

  @override
  State<OrderDetailTimer> createState() => _OrderDetailTimerState();
}

class _OrderDetailTimerState extends State<OrderDetailTimer> {
  Timer? timer;
  Duration remainingTime = const Duration(minutes: 1);
  int second = 0;

  void _startTimer() {
    DateTime orderCreationTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(widget.apiDataRes.dateCreated!);

    ///widget.apiRes.dateCreated
    // remainingTime =
    //     orderCreationTime.difference(currentTime);
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        final now = DateTime.now();
        second = now.difference(orderCreationTime).inSeconds;
        if (second > 60) {
          timer.cancel();
        } else {
          remainingTime = Duration(seconds: 60 - second);
        }
        setState(() {});
        // remainingTime = remainingTime! - const Duration(seconds: 1);
        // if (orderCreationTime.difference(currentTime).inMinutes >= 1) {
        //   timer.cancel();
        // }
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return second > 60
        ? const SizedBox()
        : Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: widget.onTap,
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>
              //       const OrderDetail(),
              //     ));

              child: Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Blue_5468ff),
                child: Text("ACCEPT (${formatDuration(remainingTime)})",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontMavenProMedium,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp),
                    textAlign: TextAlign.center),
              ),
            ));
  }
}
