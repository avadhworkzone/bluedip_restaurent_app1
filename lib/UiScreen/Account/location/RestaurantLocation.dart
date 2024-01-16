import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc1;
import 'package:permission_handler/permission_handler.dart';
import '../../../Styles/my_colors.dart';
import '../../../Widget/box_shadow.dart';
import '../../../Widget/toolbar_with_title.dart';
import '../../../modal/apiModel/response_model/get_restaurant_location_res_model.dart';
import '../../../modal/apis/api_response.dart';
import '../../../viewModel/restuarant_loaction_view_model.dart';
import 'EditRestaurantLocation.dart';
import 'package:geocoding/geocoding.dart';

import 'locationSettingScreen.dart';

class RestaurantLocation extends StatefulWidget {
  const RestaurantLocation({Key? key}) : super(key: key);

  @override
  State<RestaurantLocation> createState() => _RestaurantLocationState();
}

class _RestaurantLocationState extends State<RestaurantLocation> {
  bool isLoading = false;
  // GoogleMapController? mapController; //contrller for Google map
  // Set<Marker> markers = Set(); //markers for google map
  // LatLng showLocation = LatLng(27.7089427, 85.3086209);
  //
  // @override
  // void initState() {
  //   markers.add(Marker( //add marker on google map
  //     markerId: MarkerId(showLocation.toString()),
  //     position: showLocation, //position of marker
  //     infoWindow: InfoWindow( //popup info
  //       title: 'My Custom Title ',
  //       snippet: 'My Custom Subtitle',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));
  //
  //   //you can add more markers here
  //   super.initState();
  // }
  RestaurantsLocationViewModel restaurantsLocationViewModel = Get.find();
  GoogleMapController? _controller;
  GetRestaurantLocation? getRestaurantLocation;
  loc1.Location currentLocation = loc1.Location();
  BottomViewModel bottomViewModel = Get.find();
  Set<Marker> _markers = {};
  var country;
  var cityName;
  var state;
  var currentAddress;
  double latitude = 0;
  double longitude = 0;
  bool serviceStatus = false;
  late LocationPermission permission;
  bool hasPermission = false;

  late BitmapDescriptor icon;

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 4.2, size: Size(30, 30)),
        "assets/images/icon_location_pin_map.png");
    setState(() {
      this.icon = icon;
    });
  }

  checkGps() async {
    var location = await Permission.location.request();
    log("LOCATION PERMISSION $location");
    if (location.isPermanentlyDenied) {
      openAppSettings().then((value) async {
        log("STATUS vale ${value}");

        if (value == false) {
          var status = await Permission.location.request();
        }
      });
    } else if (location.isGranted) {
      serviceStatus = await Geolocator.isLocationServiceEnabled();
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
          getResLoc();
        }
      } else {
        // showSnackBar(
        //     message: "GPS Service is not enabled, turn on GPS location",
        //     snackColor: ColorUtils.red);
      }
    }
  }

  void getLocation() async {
    setState(() {
      isLoading = true;
    });
    // var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((loc1.LocationData loc) async {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 16.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      latitude = loc.latitude!;
      longitude = loc.longitude!;
      var addresses = await placemarkFromCoordinates(
          loc.latitude ?? 0.0, loc.longitude ?? 0.0);
      log('addresses=-----$addresses');
      var first = addresses.first;
      country = first.country;
      cityName = first.locality;
      state = first.administrativeArea;
      currentAddress =
          "${first.street}, ${first.subLocality}, ${first.locality}, ${first.country}, ${first.postalCode}";
      setState(() {
        _markers.add(Marker(
            markerId: const MarkerId('Home'),
            icon: icon,
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      // requestLocationPermission();
      // checkGps();
      getResLoc();
      getIcons();
    });
  }

  getResLoc() async {
    setState(() {
      isLoading = true;
    });
    print('isLoading first time==${isLoading}');
    await restaurantsLocationViewModel.getRestaurantLocationViewModel();

    if (restaurantsLocationViewModel.getRestaurantsLocationApiResponse.status ==
        Status.COMPLETE) {
      print('response is complete');
      getRestaurantLocation =
          restaurantsLocationViewModel.getRestaurantsLocationApiResponse.data;
      if (getRestaurantLocation!.data != null) {
        print('if ma gyu');
        print('my res----->${jsonEncode(getRestaurantLocation)}');
        currentLocation.onLocationChanged.listen((loc1.LocationData loc) async {
          _controller
              ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(getRestaurantLocation!.data!.lat ?? 0.0,
                getRestaurantLocation!.data!.lang ?? 0.0),
            zoom: 16.0,
          )));
          country = getRestaurantLocation!.data!.country ?? "NA";
          cityName = getRestaurantLocation!.data!.cityName ?? "NA";
          state = getRestaurantLocation!.data!.state ?? 'NA';
          currentAddress =
              "${getRestaurantLocation!.data!.address}, ${getRestaurantLocation!.data!.cityName}, ${state}, ${getRestaurantLocation!.data!.pincode}";
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              _markers.add(Marker(
                  markerId: const MarkerId('Home'),
                  icon: icon,
                  position: LatLng(getRestaurantLocation!.data!.lat ?? 0.0,
                      getRestaurantLocation!.data!.lang ?? 0.0)));
              print('isLoading$isLoading');
              isLoading = false;
              print('isLoading$isLoading');
            });
          });
        });
      } else {
        print('else ma gyu');
        getLocation();
      }
    } else if (restaurantsLocationViewModel
            .getRestaurantsLocationApiResponse.status ==
        Status.ERROR) {
      print('there must be error');
      getLocation();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                    onTap: () {
                      bottomViewModel.currentIndex = 4;
                      Get.offAll(() => const LatestBottomNavigationScreen());
                    },
                    child: Container(
                        width: 40.w,
                        height: 40.w,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(icon_arrow_left),
                        ))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Restaurant Location",
                    style: TextStyle(
                        fontFamily: fontJosefinSansBold,
                        color: black_354356,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
          ),
          // ToolbarWithTitle("Restaurant Location"),
          isLoading == true
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(14.r),
                            decoration: boxDecoration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 268.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14.r),
                                    child: GoogleMap(
                                      zoomControlsEnabled: true,
                                      mapType: MapType.terrain,
                                      zoomGesturesEnabled: true,
                                      initialCameraPosition:
                                          const CameraPosition(
                                        target: LatLng(21.710274309571417,
                                            72.97339821197653),
                                        zoom: 17.0,
                                      ),
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        _controller = controller;
                                      },
                                      markers: _markers,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Store Location",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.sp),
                                        textAlign: TextAlign.left),
                                    GestureDetector(
                                      onTap: () {
                                        print('edit resto location');
                                        if (getRestaurantLocation!.data !=
                                            null) {
                                          Get.to(EditRestaurantLocation(
                                              lat: getRestaurantLocation!
                                                  .data!.lat,
                                              lang: getRestaurantLocation!
                                                  .data!.lang));
                                        } else {
                                          Get.to(EditRestaurantLocation(
                                              lat: latitude, lang: longitude));
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          border: Border.all(
                                              width: 1, color: Blue_5468ff),
                                        ),
                                        child: // EDIT
                                            Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w, vertical: 6),
                                          child: Text("EDIT",
                                              style: TextStyle(
                                                  color: Blue_5468ff,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp),
                                              textAlign: TextAlign.left),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Plan
                                    Expanded(
                                      flex: 1,
                                      child: Text("Country",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),

                                    // Monthly
                                    Expanded(
                                      flex: 2,
                                      child: Text("${country}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     // Plan
                                //     Expanded(
                                //       flex: 1,
                                //       child: Text("Country Code",
                                //           style: TextStyle(
                                //               color: grey_969da8,
                                //               fontFamily: fontMavenProMedium,
                                //               fontStyle: FontStyle.normal,
                                //               fontSize: 14.sp),
                                //           textAlign: TextAlign.left),
                                //     ),
                                //
                                //     // Monthly
                                //     Expanded(
                                //       flex: 2,
                                //       child: Text("+91",
                                //           style: TextStyle(
                                //               color: black_354356,
                                //               fontFamily: fontMavenProMedium,
                                //               fontStyle: FontStyle.normal,
                                //               fontSize: 15.sp),
                                //           textAlign: TextAlign.left),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 20.h,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Plan
                                    Expanded(
                                      flex: 1,
                                      child: Text("City",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),

                                    // Monthly
                                    Expanded(
                                      flex: 2,
                                      child: Text("${cityName}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Plan
                                    Expanded(
                                      flex: 1,
                                      child: Text("State/Region",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),

                                    // Monthly
                                    Expanded(
                                      flex: 2,
                                      child: Text("${state}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Plan
                                    Expanded(
                                      flex: 1,
                                      child: Text("Address",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),
                                    // Monthly
                                    Expanded(
                                      flex: 2,
                                      child: Text("${currentAddress}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    ));
  }
}
