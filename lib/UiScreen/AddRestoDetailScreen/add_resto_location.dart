import 'package:bluedip_restaurent/Styles/my_strings.dart';
import 'package:bluedip_restaurent/Widget/Textfield.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/Widget/common_blue_button.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/add_resto_location_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../viewModel/restuarant_loaction_view_model.dart';
import '../bottom_bar/LatestBottomNavigationScreen.dart';

class AddRestoLocation extends StatefulWidget {
  const AddRestoLocation(
      {Key? key,
      this.countryName,
      this.cityName,
      this.state,
      this.address,
      this.pinCode,
      this.countryCode,
      this.lat,
      this.lang})
      : super(key: key);
  final String? countryName;
  final String? cityName;
  final String? state;
  final String? address;
  final String? pinCode;
  final String? countryCode;
  final String? lat;
  final String? lang;

  @override
  State<AddRestoLocation> createState() => _AddRestoLocationState();
}

class _AddRestoLocationState extends State<AddRestoLocation> {
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  RestaurantsLocationViewModel addLoc = Get.find();
  AddRestoLocationReqModel reqModel = AddRestoLocationReqModel();

  @override
  void initState() {
    addressController.text = widget.address ?? "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // back_button(),
                SizedBox(
                  width: 16.3.w,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Add Location',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: black_354356,
                        fontFamily: fontJosefinSansBold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country',
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp)),
                      SizedBox(height: 5.w),
                      loginTextformField("${widget.countryName ?? ""}",
                          regularExpression:
                              RegularExpression.alphabetWithSpacePattern,
                          controller: countryController,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 15.w),
                      // Text('${widget.countryName}'),
                      Text('City',
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp)),
                      SizedBox(height: 5.w),
                      loginTextformField("${widget.cityName}",
                          regularExpression:
                              RegularExpression.alphabetWithSpacePattern,
                          controller: cityController,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 15.w),
                      // Text('${widget.cityName}'),
                      Text('State',
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp)),
                      SizedBox(height: 5.w),
                      loginTextformField("${widget.state}",
                          regularExpression:
                              RegularExpression.alphabetWithSpacePattern,
                          controller: stateController,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 15.w),
                      // Text('${widget.state}'),
                      Text('Address',
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp)),
                      SizedBox(height: 5.w),
                      loginTextformField("",
                          regularExpression:
                              RegularExpression.alphabetWithSpacePattern,
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 15.w),
                      Text('Pincode',
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp)),
                      SizedBox(height: 5.w),
                      loginTextformField("${widget.pinCode}",
                          regularExpression:
                              RegularExpression.alphabetWithSpacePattern,
                          controller: pinCodeController,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next),
                      SizedBox(height: 45.w),
                      CommonBlueButton(strContinue.toUpperCase(), () async {
                        reqModel.action = "add_resto_location";
                        reqModel.country = widget.countryName;
                        reqModel.countryCode = widget.countryCode;
                        reqModel.cityName = widget.cityName;
                        reqModel.state = widget.state;
                        reqModel.address = widget.address;
                        reqModel.pincode = widget.pinCode;
                        reqModel.lat = widget.lat.toString();
                        reqModel.lang = widget.lang.toString();
                        await addLoc.addRestaurantLocationViewModel(
                            model: reqModel);
                        CommonResponseModel locationResponse =
                            addLoc.addRestaurantsLocationApiResponse.data;
                        if (addLoc.addRestaurantsLocationApiResponse.status ==
                            Status.COMPLETE) {
                          if (locationResponse.status == true) {
                            Get.offAll(const LatestBottomNavigationScreen());
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           LatestBottomNavigationScreen(),
                            //     ));
                          } else {
                            Get.snackbar('', '${locationResponse.message}',
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: blue_3d56f0);
                          }
                        }
                      }, blue_3653f6)
                      // Text('${widget.pinCode}'),
                    ],
                  ),
                ),
                GetBuilder<RestaurantsLocationViewModel>(
                  builder: (controller) {
                    if (addLoc.addRestaurantsLocationApiResponse.status ==
                        Status.LOADING) {
                      return Center(child: const CircularIndicator());
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
