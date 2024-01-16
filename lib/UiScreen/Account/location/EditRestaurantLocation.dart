import 'dart:async';
import 'dart:developer';
import 'package:bluedip_restaurent/UiScreen/Account/location/RestaurantLocation.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_for_flutter/google_places_for_flutter.dart';
import 'package:location/location.dart' as loc1;
import 'package:location/location.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_strings.dart';
import '../../../Widget/Textfield.dart';
import '../../../Widget/circular_progrss_indicator.dart';
import '../../../Widget/common_blue_button.dart';
import '../../../Widget/toolbar_with_title.dart';
import '../../../modal/apiModel/request_model/edit_location_req_model.dart';
import '../../../modal/apiModel/response_model/common_res_model.dart';
import '../../../modal/apiModel/response_model/get_restaurant_location_res_model.dart';
import '../../../modal/apis/api_response.dart';
import '../../../viewModel/restuarant_loaction_view_model.dart';

class EditRestaurantLocation extends StatefulWidget {
  EditRestaurantLocation({Key? key, this.lat, this.lang}) : super(key: key);
  double? lat;
  double? lang;

  @override
  State<EditRestaurantLocation> createState() => _EditRestaurantLocationState();
}

class _EditRestaurantLocationState extends State<EditRestaurantLocation> {
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

  GoogleMapController? _controller;
  loc1.Location currentLocation = loc1.Location();
  Set<Marker> _markers = {};
  EditLocationReqModel reqModel = EditLocationReqModel();
  RestaurantsLocationViewModel resModel = Get.find();
  late BitmapDescriptor icon;
  double latitude = 0;
  double longitude = 0;
  bool isLoading = false;
  bool firstTime = false;
  var pinCode;
  var country;
  var cCode;
  var cityName;
  var state;
  var currentAddress;
  StreamSubscription<LocationData>? locationSubscription;

  RestaurantsLocationViewModel restaurantsLocationViewModel = Get.find();
  CommonResponseModel? response;
  GetRestaurantLocation? getRestaurantLocation;

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 4.2, size: Size(30, 30)),
        "assets/images/icon_location_pin_map.png");
    setState(() {
      this.icon = icon;
    });
  }

  void getLocation({double? latit, double? longit}) async {
    latitude = widget.lat!;
    longitude = widget.lang!;
    setState(() {
      isLoading = true;
      firstTime = true;
      _addressController.text = '';
      _pincodeController.text = '';
    });
    await currentLocation.getLocation();
    locationSubscription =
        currentLocation.onLocationChanged.listen((loc1.LocationData loc) async {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latit ?? latitude, longit ?? longitude),
        zoom: 16.0,
      )));
      latitude = latit ?? latitude;
      longitude = longit ?? longitude;
      var addresses = await placemarkFromCoordinates(
          latit ?? latitude, longit ?? longitude);

      var first = addresses.first;
      pinCode = first.postalCode;
      currentAddress =
          "${first.street}, ${first.subLocality}, ${first.locality}, ${first.country}, ${first.postalCode}";

      country = first.country;
      cCode = first.isoCountryCode;
      cityName = first.locality;
      state = first.administrativeArea;

      _markers.add(Marker(
          markerId: const MarkerId('Home'),
          icon: icon,
          position: LatLng(latit ?? latitude, longit ?? longitude)));
      setState(() {
        _pincodeController.text = pinCode;
        _addressController.text = currentAddress;
        isLoading = false;
      });
      if (_addressController.text != "" && _pincodeController.text != "") {
        locationSubscription!.cancel();
      }
    });

    // print('status===${status}');
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
      getIcons();
    });
  }

  // late BitmapDescriptor pinLocationIcon;
  //
  // void setCustomMapPin() async {
  //   pinLocationIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.5),
  //       'assets/images/icon_location_pin_account.svg');
  // }

  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();

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
      // resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Edit Restaurant Location"),
          isLoading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            GoogleMap(
                              zoomControlsEnabled: true,
                              mapType: MapType.terrain,
                              zoomGesturesEnabled: true,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(latitude, longitude),
                                zoom: 17.0,
                              ),
                              onMapCreated: (GoogleMapController controller) {
                                _controller = controller;
                              },
                              markers: _markers,
                            ),
                            SingleChildScrollView(
                              child: SearchGooglePlacesWidget(
                                placeType: PlaceType.address,
                                placeholder: 'Enter the address',
                                apiKey:
                                    'AIzaSyApn3-bC5KtY1mF-AxgiC-43V4qPak5CoI',
                                onSearch: (Place place) {},
                                onSelected: (Place place) async {
                                  var geolocation = await place.geolocation;

                                  var destinationCoordinates = LatLng(
                                      geolocation?.coordinates.latitude,
                                      geolocation?.coordinates.longitude);

                                  List<Placemark> place1 = [];
                                  List<Placemark> newPlace =
                                      await placemarkFromCoordinates(
                                          geolocation?.coordinates.latitude,
                                          geolocation?.coordinates.longitude);
                                  print(newPlace);
                                  setState(() {
                                    place1 = newPlace;
                                    print('===${place1.first}');
                                  });
                                  getLocation(
                                      latit: geolocation?.coordinates.latitude,
                                      longit:
                                          geolocation?.coordinates.longitude);

                                  // setDestination(place);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: bg_f3f5f9,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r))),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pin Code",
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
                                    controller: _pincodeController,
                                    regularExpression:
                                        RegularExpression.digitsPattern,
                                    obscureText: true,
                                    onTap: () {},
                                    onChanged: (value) {},
                                    validationType: ValidationType.PNumber,
                                    inputLength: 6),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("House Number, Building and Locality",
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
                                    controller: _addressController,
                                    obscureText: true,
                                    onChanged: (value) {},
                                    regularExpression: RegularExpression
                                        .alphabetDigitSpacePattern),
                                SizedBox(
                                  height: 40.h,
                                ),
                                GetBuilder<RestaurantsLocationViewModel>(
                                  builder: (controller) {
                                    if (controller
                                            .editRestaurantsLocationApiResponse
                                            .status ==
                                        Status.LOADING) {
                                      return const CircularIndicator();
                                    }

                                    return CommonBlueButton(strSave, () async {
                                      reqModel.action = 'add_resto_location';
                                      reqModel.country = country;
                                      reqModel.countryCode = cCode;
                                      reqModel.cityName = cityName;
                                      reqModel.state = state;
                                      reqModel.lat = latitude.toString();
                                      reqModel.lang = longitude.toString();
                                      reqModel.pincode =
                                          _pincodeController.text;
                                      reqModel.address =
                                          _addressController.text;
                                      await restaurantsLocationViewModel
                                          .editRestaurantLocationViewModel(
                                              model: reqModel);
                                      if (controller
                                              .editRestaurantsLocationApiResponse
                                              .status ==
                                          Status.ERROR) {
                                        Get.snackbar('', "Server error",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: blue_3d56f0);
                                      }
                                      if (controller
                                              .editRestaurantsLocationApiResponse
                                              .status ==
                                          Status.COMPLETE) {
                                        response = controller
                                            .editRestaurantsLocationApiResponse
                                            .data;
                                        if (response!.status == true) {
                                          Get.offAll(
                                              const RestaurantLocation());
                                          // Get.offAll(LatestBottomNavigationScreen());
                                        } else {
                                          Get.snackbar(
                                              '', '${response!.message}',
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor: blue_3d56f0);
                                        }
                                      }

                                      // await resModel.postRestaurantLocationViewModel();
                                    }, blue_3653f6);
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    ));
  }
  // setDestination(Place place) async {
  //   destination.value = place.description!;
  //   mapStatus.value = Constants.route;
  //   var geolocation = await place.geolocation;
  //   destinationCoordinates = LatLng(
  //       geolocation?.coordinates.latitude, geolocation?.coordinates.longitude);
  //   await drawRoute(destinationCoordinates);
  //   await addDestinationMarker(destinationCoordinates);
  //   getTotalDistanceAndTime(destinationCoordinates);
  // }
}
