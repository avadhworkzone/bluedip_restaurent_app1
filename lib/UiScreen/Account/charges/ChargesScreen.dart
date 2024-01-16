import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:bluedip_restaurent/viewModel/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_strings.dart';
import '../../../Widget/Textfield.dart';
import '../../../Widget/common_blue_button.dart';
import '../../../Widget/toolbar_with_title.dart';
import '../../../modal/apiModel/response_model/common_res_model.dart';

class ChargesScreen extends StatefulWidget {
  const ChargesScreen({Key? key}) : super(key: key);

  @override
  State<ChargesScreen> createState() => _ChargesScreenState();
}

class _ChargesScreenState extends State<ChargesScreen> {
  final _packageController = TextEditingController();
  final _gstController = TextEditingController();
  final _cgstController = TextEditingController();
  final _sgstController = TextEditingController();
  AccountViewModel accountViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
        child: Scaffold(
      backgroundColor: bg_f3f5f9,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithTitle("Charges"),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Text("Packaging Charges (for takeaway)",
                              style: TextStyle(
                                  color: black_354356,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 6.h,
                          ),
                          loginTextformField("",
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _packageController,
                              obscureText: true,
                              onChanged: (value) {},
                              regularExpression:
                                  RegularExpression.pricePattern),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text("GST(%)",
                              style: TextStyle(
                                  color: black_354356,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 6.h,
                          ),
                          loginTextformField(
                            "",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: _gstController,
                            obscureText: true,
                            onChanged: (value) {},
                            regularExpression: RegularExpression.pricePattern,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text("CGST(%)",
                              style: TextStyle(
                                  color: black_354356,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 6.h,
                          ),
                          loginTextformField("",
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              controller: _cgstController,
                              obscureText: true,
                              onChanged: (value) {},
                              regularExpression:
                                  RegularExpression.pricePattern),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text("SGST(%)",
                              style: TextStyle(
                                  color: black_354356,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 6.h,
                          ),
                          loginTextformField("",
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              controller: _sgstController,
                              obscureText: true,
                              onChanged: (value) {},
                              regularExpression:
                                  RegularExpression.pricePattern),
                          SizedBox(
                            height: 40.h,
                          ),
                          CommonBlueButton(strSave, () async {
                            await accountViewModel.addChargesViewModel(
                                packingCharge: _packageController.text,
                                gst: _gstController.text,
                                cGst: _cgstController.text,
                                sGst: _sgstController.text);
                            if (accountViewModel.addChargesApiResponse.status ==
                                Status.COMPLETE) {
                              CommonResponseModel res =
                                  accountViewModel.addChargesApiResponse.data;
                              if (res.status == true) {
                                Get.offAll(
                                    const LatestBottomNavigationScreen());
                              } else {
                                Get.snackbar('', '${res.message}',
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    backgroundColor: blue_3d56f0);
                              }
                            }
                          }, blue_3653f6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GetBuilder<AccountViewModel>(
            builder: (controller) {
              if (controller.addChargesApiResponse.status == Status.LOADING) {
                return const CircularIndicator();
              }
              return const SizedBox();
            },
          )
        ],
      ),
    ));
  }
}
