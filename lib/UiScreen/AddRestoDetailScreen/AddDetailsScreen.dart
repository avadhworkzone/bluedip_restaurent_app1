import 'dart:developer';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/utility.dart';
import 'package:bluedip_restaurent/viewModel/add_resto_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/common_blue_button.dart';
import '../../modal/apiModel/request_model/add_resto_details_req_model.dart';
import '../../modal/apiModel/response_model/add_resto_details_res_model.dart';
import '../../utils/shared_preference_utils.dart';
import 'DetailPage1.dart';
import 'DetailPage2.dart';
import 'DetailPage3.dart';
import 'map_screen.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  PageController controller = PageController();
  MenuItems menuItems = MenuItems();
  SeatingCapacity seatingCapacity = SeatingCapacity();
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  static String lat = '';
  static String long = '';
  Position? position;

  final List<Widget> _list = <Widget>[
    const Center(child: DetailPage1()),
    const Center(child: DetailPage2()),
    const Center(child: DetailPage3()),
  ];

  int _curr = 0;
  AddRestaurantsDetailsReqModel addRestaurantsDetailsReqModel =
      AddRestaurantsDetailsReqModel();
  AddRestaurantsViewModel addRestaurantsViewModel = Get.find();

  checkGps() async {
    var location = await Permission.location.request();
    log("LOCATION PERMISSION $location");
    if (location.isPermanentlyDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      openAppSettings().then((value) async {
        log("STATUS vale ${value}");

        if (value == false) {
          var status = await Permission.location.request();
        }
      });
    } else if (location.isGranted) {
      serviceStatus = await Geolocator.isLocationServiceEnabled();
      print('hasPermission====$location');

      if (serviceStatus) {
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // showSnackBar(
            //     message: "Location permissions are denied",
            //     snackColor: ColorUtils.red);
          } else if (permission == LocationPermission.deniedForever) {
            // showSnackBar(
            //     message: "Location permissions are permanently denied",
            //     snackColor: ColorUtils.red);
          } else {
            hasPermission = true;
          }
        } else {
          hasPermission = true;
        }
        if (hasPermission) {
          print('hasPermission====');
          getLocation();
        }
      } else {
        print('hasPermission====error');
        Get.snackbar(
          'error',
          "GPS Service is not enabled, turn on GPS location",
        );
        // showSnackBar(
        //     message: "GPS Service is not enabled, turn on GPS location",
        //     snackColor: ColorUtils.red);
      }
    }
  }

  getLocation() async {
    print('getLocation====');
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      lat = position!.latitude.toString();
      long = position!.longitude.toString();
      addRestoDetailApiCall();

      log("====lat=========${lat}");
      log("====long=========${long}");
    } catch (e) {
      print('Error: $e');
      snackBar(title: '${e} , Please try after some time');
    }
  }

  addRestoDetailApiCall() async {
    addRestaurantsDetailsReqModel.action = "edit_restaurant";
    addRestaurantsDetailsReqModel.restaurantCategory = Utility.selectCategory;
    addRestaurantsDetailsReqModel.cuisine = Utility.addCuisine;
    addRestaurantsDetailsReqModel.averageCost =
        Utility.addAverageCost.toString();
    menuItems.min = Utility.menuItemsMin.toString();
    menuItems.max = Utility.menuItemsMax.toString();
    addRestaurantsDetailsReqModel.menuItems = menuItems;
    seatingCapacity.min = Utility.seatingCapacityMin.toString();
    seatingCapacity.max = Utility.seatingCapacityMax.toString();
    addRestaurantsDetailsReqModel.seatingCapacity = seatingCapacity;
    addRestaurantsDetailsReqModel.monthlyRevenueGoal =
        Utility.monthlyRevenueGoal.toString();
    addRestaurantsDetailsReqModel.priceRange = Utility.priceRange.toString();
    addRestaurantsDetailsReqModel.subFacilities = Utility.facilityData;
    addRestaurantsDetailsReqModel.restaurantType = Utility.restaurantType;
    addRestaurantsDetailsReqModel.restaurantName = Utility.restoName;
    addRestaurantsDetailsReqModel.mobileNumber = Utility.mobileNo;
    addRestaurantsDetailsReqModel.restaurantImg =
        PreferenceManagerUtils.getRestoImage();

    await addRestaurantsViewModel.addRestoDetails(
        model: addRestaurantsDetailsReqModel);
    AddResturentDetailsResModel response =
        addRestaurantsViewModel.addRestoDetailsApiResponse.data;
    print('response.status==${response.status}');

    if (addRestaurantsViewModel.addRestoDetailsApiResponse.status ==
        Status.COMPLETE) {
      if (response.status == false) {
        Get.snackbar('', '${response.message}',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: blue_3d56f0);
      } else if (response.status == true) {
        await PreferenceManagerUtils.setRestoDetailsAdd(true);
        print(
            '---setRestoDetailsAdd====${PreferenceManagerUtils.getRestoDetailsAdd()}');
        Get.to(MapScreen(
          lat: lat,
          long: long,
        ));

        // Get.offAll(const LatestBottomNavigationScreen());
      } else {
        Get.snackbar('', '${response.message}',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: blue_3d56f0);
      }
    }
  }

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
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 14.w),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _curr != 0
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.animateToPage(_curr - 1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                    });
                                  },
                                  child: SvgPicture.asset(icon_arrow_left))
                              // CommonBlueButton(strNext.toUpperCase(), () {
                              //         setState(() {
                              //           controller.animateToPage(_curr - 1,
                              //               duration:
                              //                   const Duration(milliseconds: 500),
                              //               curve: Curves.linear);
                              //         });
                              //       }, blue_3653f6)
                              : SizedBox(),
                          // GestureDetector(
                          //     onTap: () => {Navigator.pop(context, false)},
                          //     child: SvgPicture.asset(icon_arrow_left))

                          SizedBox(
                            width: 16.3.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              strAddDetails,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: black_354356,
                                  fontFamily: fontJosefinSansBold),
                            ),
                          ),
                          Text(
                            "${_curr + 1}/${_list.length}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        // reverse: true,
                        // physics: BouncingScrollPhysics(),
                        controller: controller,
                        onPageChanged: (num) {
                          setState(() {
                            _curr = num;
                          });
                        },
                        children: _list,
                      ),
                    ),
                  ],
                ),
                GetBuilder<AddRestaurantsViewModel>(
                  builder: (controller) {
                    if (controller.addRestoDetailsApiResponse.status ==
                        Status.LOADING) {
                      return const CircularIndicator();
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _curr != 2
                  ? CommonBlueButton(strNext.toUpperCase(), () {
                      setState(() {
                        if (_curr == 0) {
                          if (formKey.currentState!.validate()) {
                            controller.animateToPage(_curr + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          } else {
                            snackBar(title: 'Detail is Required');
                          }
                        } else {
                          controller.animateToPage(_curr + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      });
                    }, blue_3653f6)
                  : CommonBlueButton(strFinish.toUpperCase(), () async {
                      checkGps();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           const LatestBottomNavigationScreen(),
                      //     ));
                    }, blue_3653f6),
            )));
  }
}
