import 'dart:async';
import 'dart:developer';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/add_resto_location.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/Widget/common_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Styles/my_strings.dart';

class MapScreen extends StatefulWidget {
  final String? lat;
  final String? long;

  const MapScreen({Key? key, this.lat, this.long}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  // GetCityViewModel getCityViewModel = Get.find();
  // UserLocationReqModel reqModel = UserLocationReqModel();
  // double lat = 20.5937;
  // double lng = 78.9629;
  LatLng? currentLatLng;
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  // LocationData? _currentPosition;

  var country;
  var countryCode;
  var cityName;
  var state;
  var address;
  var pinCode;
  var lat;
  var long;
  // void _onMapCreated(GoogleMapController _cntlr) {
  //   _controller = _cntlr;
  //   final marker = Marker(
  //     markerId: MarkerId('0'),
  //     position: LatLng(lat, lng),
  //   );
  //
  //   _markers.add(marker);
  // }

  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR" + error.toString());
  //   });
  //
  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    await Geolocator.getCurrentPosition().then((currLocation) async {
      setState(() {
        currentLatLng =
            LatLng(double.parse(widget.lat!), double.parse(widget.long!));
      });
      var addresses = await placemarkFromCoordinates(
          double.parse(widget.lat!), double.parse(widget.long!));

      ///currLocation.longitude
      var first = addresses.first;
      country = first.country;
      countryCode = first.isoCountryCode;
      cityName = first.locality;
      state = first.administrativeArea;
      pinCode = first.postalCode;
      address = '${first.street} ${cityName}, ${state}, ${country}, ${pinCode}';
      lat = widget.lat ?? "";
      long = widget.long ?? "";

      // print('address===${first.subLocality}');
      // print('country::==${first.country}');
      // print('address===${first.locality}');
      // print('address===${first}');
      // print('address===${first.isoCountryCode}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLatLng == null
          ? const SizedBox()
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Stack(
                          // alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: currentLatLng!, zoom: 17),
                              // markers: _markers.toSet(),
                              zoomControlsEnabled: false,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              padding: const EdgeInsets.only(
                                top: 40.0,
                              ),
                              onCameraMove: (position) {
                                // _debouncer.run(() {
                                // setState(() {
                                // _isLoading = true;
                                // print('_markers.first===${_markers}');
                                // _markers.first = _markers.first
                                //     .copyWith(positionParam: position.target);

                                // lat = position.target.latitude;
                                // lng = position.target.longitude;
                                // printData("My Latitude : ",
                                //     position.target.latitude.toString());
                                // printData("My Longitude : ",
                                //     position.target.longitude.toString());

                                // getAddress(position.target.latitude,
                                //     position.target.longitude);
                                // });
                                //});
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CommonBlueButton(strContinue.toUpperCase(),
                            () async {
                          print('country----==>>${country}');
                          Get.to(() => AddRestoLocation(
                                countryName: country ?? "",
                                cityName: cityName ?? '',
                                state: state ?? '',
                                address: address ?? '',
                                pinCode: pinCode ?? '',
                                countryCode: countryCode ?? "",
                                lat: lat,
                                lang: long,
                              ));
                          // reqModel.action = "add_user_location";
                          // reqModel.country = country;
                          // reqModel.countryCode = countryCode;
                          // reqModel.cityName = cityName;
                          // reqModel.state = state;
                          // reqModel.address = address;
                          // reqModel.pincode = pinCode;
                          // reqModel.lat = lat;
                          // reqModel.lang = long;
                          // await getCityViewModel.userLocation(body: reqModel);
                          // UserLocationResModel response =
                          //     getCityViewModel.getUserLocationApiResponse.data;
                          // if (getCityViewModel
                          //         .getUserLocationApiResponse.status ==
                          //     Status.COMPLETE) {
                          //   if (response.status == true) {
                          //     await PreferenceManagerUtils.setIsLogin('true');
                          //     await PreferenceManagerUtils.setLatitude(
                          //         lat.toString());
                          //     await PreferenceManagerUtils.setLongitude(
                          //         long.toString());
                          //     Get.offAll(const BottomNavigationScreen());
                          //   } else {
                          //     Get.snackbar('', '${response.message}',
                          //         snackPosition: SnackPosition.BOTTOM,
                          //         colorText: Colors.white,
                          //         backgroundColor: blue_3d56f0);
                          //   }
                          // }
                        }, blue_3d56f0),
                      ),
                    ],
                  ),
                  // GetBuilder<GetCityViewModel>(
                  //   builder: (controller) {
                  //     if (controller.getUserLocationApiResponse.status ==
                  //             Status.LOADING ||
                  //         controller.getUserLocationApiResponse.status ==
                  //             Status.LOADING) {
                  //       return CircularIndicator();
                  //     }
                  //     return SizedBox();
                  //   },
                  // ),
                ],
              ),
            ),
    );
  }
}
