import 'dart:async';

import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:bluedip_restaurent/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../modal/apiModel/response_model/get_order_list_res_model.dart';
import '../../utils/typedef_utils.dart' as tpdf;

class OrderPreparingTimeButton extends StatefulWidget {
  OrderPreparingTimeButton(
      {Key? key,
      this.res,
      this.onTap,
      this.isDetailScreen,
      this.apiDataRes,
      this.onCancelTap})
      : super(key: key);
  Data? res;
  final tpdf.OnReadyClick? onTap;
  final tpdf.OnCancelClick? onCancelTap;
  OrderDetailData? apiDataRes;
  bool? isDetailScreen;

  @override
  State<OrderPreparingTimeButton> createState() =>
      _OrderPreparingTimeButtonState();
}

class _OrderPreparingTimeButtonState extends State<OrderPreparingTimeButton>
    with WidgetsBindingObserver {
  Timer? _timer;
  Duration _remainingTime = const Duration(seconds: 0);
  String orderId = "";

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (mounted)
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= const Duration(seconds: 1);
          // MyConstant.orderPendingTime[orderId] = _remainingTime.inSeconds;
          Utility.orderRTime.addAll({orderId: _remainingTime.inMinutes});

          PreferenceManagerUtils.setOrderTimer(
              key: orderId, value: _remainingTime.inSeconds);
        } else {
          timer.cancel();
          print('Order is ready!');
        }
      });
    });
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        PreferenceManagerUtils.getOrderTimer(orderId);
        print(
            'PreferenceManagerUtils.getOrderTimer${PreferenceManagerUtils.getOrderTimer(orderId)}');
        final current = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        final diff = current - PreferenceManagerUtils.getOrderTimer(orderId);
        await PreferenceManagerUtils.setOrderTimer(key: orderId, value: diff);
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        await PreferenceManagerUtils.setOrderTimer(
            key: orderId, value: _remainingTime.inSeconds);
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    if (widget.isDetailScreen == true) {
      orderId = widget.apiDataRes!.orderId!.toString();
    } else {
      orderId = widget.res!.orderId.toString();
    }
    if (PreferenceManagerUtils.getOrderTimer(orderId) > 0) {
      _remainingTime =
          Duration(seconds: PreferenceManagerUtils.getOrderTimer(orderId));
      print('timer if ma ===${PreferenceManagerUtils.getOrderTimer(orderId)}');
    } else {
      print('else ma gyu.....');
      widget.isDetailScreen == true
          ? _remainingTime =
              Duration(minutes: widget.apiDataRes!.orderPreparationTime ?? 0)
          : _remainingTime =
              Duration(minutes: widget.res!.orderPreparationTime ?? 0);
      PreferenceManagerUtils.setOrderTimer(
          key: orderId, value: _remainingTime.inSeconds);
    }
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _remainingTime.inSeconds == 0
        ? Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: widget.onCancelTap,
              child: Container(
                height: 48.h,
                padding: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: Blue_5468ff,
                  border: Border.all(
                    width: 1,
                    color: Blue_5468ff,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: // Frame 34242
                    Center(
                  child: Text("Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontMavenProMedium,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          )
        : Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Stack(
                  children: [
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Blue_5468ff,
                      ),
                      child: Center(
                        child: Text(
                          // _isRunning
                          //     ?
                          "ORDER READY (${_formatTime(_remainingTime)})",
                          // : 'ORDER READY',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontMavenProMedium,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp),
                        ),
                      ),
                    ),
                    // AnimatedOpacity(
                    //   opacity: _isRunning
                    //       ? 1.0
                    //       : 0.0,
                    //   duration: Duration(
                    //       milliseconds: 500),
                    //   child: Container(
                    //     width: 182.w *
                    //         (_remainingTime /
                    //             _duration),
                    //     height: 48.h,
                    //     color: Colors.white
                    //         .withOpacity(0.5),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // )
            ),
          );
  }
}
