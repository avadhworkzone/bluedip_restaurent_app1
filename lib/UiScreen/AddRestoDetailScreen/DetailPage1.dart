import 'dart:io';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/Textfield.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/add_resto_details_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/upload_profile_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_category_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/upload_profile_pic_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:bluedip_restaurent/utils/utility.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:bluedip_restaurent/viewModel/add_resto_detail_view_model.dart';
import 'package:bluedip_restaurent/viewModel/upload_image_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'dart:ui' as ui;
import '../../Styles/my_constant.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_blue_border_button.dart';
import 'package:http/http.dart' as http;

final formKey = GlobalKey<FormState>();

class DetailPage1 extends StatefulWidget {
  const DetailPage1({Key? key}) : super(key: key);

  @override
  State<DetailPage1> createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  bool selected = false;
  PageController controller = PageController();
  final restoNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  UploadProfilePicReqModel uploadProfilePicReqModel =
      UploadProfilePicReqModel();
  UploadImageViewModel uploadImageViewModel = Get.find();
  File? selectedImage;
  List<String> _values = [];

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  List<String> text = [];

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  AddRestaurantsViewModel addRestaurantsViewModel = Get.find();
  AddRestaurantsDetailsReqModel addRestaurantsDetailsReqModel =
      AddRestaurantsDetailsReqModel();

  String tempString = "";
  late ui.Image customImage;
  double sliderValue = 0.0;

  Future<ui.Image> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  // bool selectedsecond = false;
  // List<OfferModel> onOfferModel = [];
  // List<OfferModel> selectedList = [];
  List<String> selectedList = [];

  @override
  void initState() {
    getCategoryApiCall();
    loadImage('assets/images/icon_thumb.svg').then((image) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          customImage = image;
        });
      });
    });

    super.initState();
  }

  GetCategoryResModel? response;

  getCategoryApiCall() async {
    await addRestaurantsViewModel.getCategoryViewModel(action: 'get_category');
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bg_f3f5f9,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: const Color(0xFFE5E5E5),
                        child: selectedImage != null
                            ? ClipOval(
                                child: Image.file(
                                  selectedImage!,
                                  width: Get.width * 0.600,
                                  height: Get.height * 0.200,
                                  fit: BoxFit.fitWidth,
                                  // width: Get.width * 0.500,
                                ),
                              )
                            : ClipOval(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // isOnTap = true;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            insetPadding: EdgeInsets.all(40.w),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Get.height * 0.05),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                    "Choose Profile photo",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        ElevatedButton.icon(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                blue_3653f6,
                                                          ),
                                                          icon: const Icon(
                                                              Icons.image),
                                                          onPressed: () {
                                                            _openImagePicker();
                                                          },
                                                          label: const Text(
                                                              "gallery"),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Get.width * 0.05,
                                                        ),
                                                        ElevatedButton.icon(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary:
                                                                      blue_3653f6,
                                                                  alignment:
                                                                      Alignment
                                                                          .center),
                                                          icon: const Icon(
                                                              Icons.camera),
                                                          onPressed: () {
                                                            _openCameraPicker();
                                                          },
                                                          label: const Text(
                                                              "camera"),
                                                        ),
                                                      ])
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: Get.height * 0.05,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text("Restaurant Name",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontMavenProProSemiBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),
                    loginTextformField("Restaurant Name",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: restoNameController,
                        validationType: ValidationType.FirstLastName,
                        obscureText: true, onChanged: (value) {
                      Utility.restoName = value.toString();
                    },
                        regularExpression:
                            RegularExpression.alphabetSpacePattern),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Mobile Number",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontMavenProProSemiBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),
                    loginTextformField("Mobile Number",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: mobileNoController,
                        inputLength: 10,
                        validationType: ValidationType.PNumber,
                        obscureText: true, onChanged: (value) {
                      Utility.mobileNo = value.toString();
                    }, regularExpression: RegularExpression.digitsPattern),
                    SizedBox(
                      height: 20.h,
                    ),

                    // Title
                    Text("Select Restaurant Category",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontMavenProProSemiBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),
                    /*Drop Down Menu*/
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        selectCategory(context);
                        setState(() {});

                        // });
                      },
                      child: Container(
                        decoration: boxDecoration,
                        padding: EdgeInsets.all(14.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Select
                            Expanded(
                              flex: 1,
                              child: Text(
                                  MyConstant.strdays.isNotEmpty
                                      ? MyConstant.strdays
                                      : "Select",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProMedium,
                                      fontSize: 15.sp,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.left),
                            ),
                            SvgPicture.asset(
                              icon_down_arrow,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    /*Add cuisine*/
                    Container(
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add Cuisine
                          Text("Add Cuisine",
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontMavenProProSemiBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 12.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(width: 1, color: grey_d9dde3)),
                            child: TagEditor(
                              length: _values.length,
                              controller: _textEditingController,
                              focusNode: _focusNode,
                              delimiters: const [',', 'Add'],
                              hasAddButton: false,
                              resetTextOnSubmitted: true,
                              // This is set to grey just to illustrate the `textStyle` prop
                              textStyle: TextStyle(
                                  fontFamily: fontMavenProMedium,
                                  fontSize: 15.sp,
                                  color: black_354356),
                              onSubmitted: (outstandingValue) {
                                //print(outstandingValue);
                                setState(() {
                                  if (outstandingValue.isNotEmpty) {
                                    _values.add(outstandingValue);
                                    Utility.addCuisine = _values;
                                    print('_values====${_values}');
                                  }
                                });
                              },
                              inputDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'e.g Sea food',
                                contentPadding: EdgeInsets.only(top: 15),
                                hintStyle: TextStyle(
                                  fontFamily: fontMavenProMedium,
                                  fontSize: 15.sp,
                                  color: grey_969da8,
                                ),
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.only(right: 10.w),
                                  icon: Text("Add",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),
                                  onPressed: () {
                                    setState(() {
                                      print(_textEditingController.text);
                                      _values.add(_textEditingController.text);
                                      _textEditingController.clear();
                                    });
                                  },
                                ),
                              ),
                              onTagChanged: (newValue) {
                                setState(() {
                                  _values.add(newValue);
                                });
                              },
                              tagBuilder: (context, index) => _Chip(
                                index: index,
                                label: _values[index],
                                onDeleted: _onDelete,
                              ),
                              // InputFormatters example, this disallow \ and /
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                              // ],
                            ),
                          ),
                          // Container(
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     border: Border.all(
                          //       width: 1,
                          //       color: grey_d9dde3
                          //     )
                          //   ),
                          //   child: TextField(
                          //     controller: _controller,
                          //     decoration: InputDecoration(
                          //       suffixIconConstraints: const BoxConstraints(
                          //           minHeight: 5,
                          //           minWidth: 55
                          //       ),
                          //       hintText: "e.g Sea food",
                          //       hintStyle: TextStyle(
                          //           color:  grey_969da8,
                          //           fontWeight: FontWeight.w500,
                          //           fontFamily: fontMavenProMedium,
                          //           fontStyle:  FontStyle.normal,
                          //           fontSize: 15.sp
                          //       ),
                          //
                          //       suffixIcon: IconButton(
                          //         // icon: Icon(
                          //         //   // Based on passwordVisible state choose the icon
                          //         //   _passwordVisible
                          //         //       ? Icons.visibility
                          //         //       : Icons.visibility_off,
                          //         //   color: Theme.of(context).primaryColorDark,
                          //         // ),
                          //         padding: EdgeInsets.zero,
                          //
                          //         icon: // Add
                          //         Text(
                          //             "Add",
                          //             style:  TextStyle(
                          //                 color:  Blue_5468ff,
                          //                 fontFamily: fontMavenProMedium,
                          //                 fontStyle:  FontStyle.normal,
                          //                 fontSize: 15.sp
                          //             ),
                          //             textAlign: TextAlign.right
                          //         ),
                          //         onPressed: () {
                          //           setState(() {
                          //             if(_controller.text.length>0){
                          //               text.add(_controller.text);
                          //               _controller.clear();
                          //             } else{
                          //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //                 content: Text("Text is empty"),
                          //               ));
                          //             }
                          //           });
                          //         },
                          //       ),
                          //
                          //       isDense: true,
                          //       contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.5),
                          //      //  contentPadding: EdgeInsets.zero,
                          //       border: InputBorder.none,
                          //     ),
                          //
                          //   ),
                          // ),
                          // SizedBox(height: 10.h,),
                          //
                          // Text(text.isNotEmpty?text.toString():"",
                          //   style: TextStyle(
                          //     color:   black_354356,
                          //     fontWeight: FontWeight.w500,
                          //     fontFamily: fontMavenProMedium,
                          //     fontStyle:  FontStyle.normal,
                          //     fontSize: 15.sp
                          // ),
                          //   textAlign: TextAlign.left
                          //   ,),
                        ],
                      ),
                    ),
                    /*Average Cost*/
                    Container(
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Average Cost for 2
                              Text("Average Cost for 2",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.left),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Cost:
                                  Text("Cost:",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.right),

                                  // 2500
                                  Text("₹${Utility.addAverageCost}",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.right)
                                ],
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              // here
                              trackHeight: 6,
                              thumbColor: Blue_5468ff,

                              //    thumbShape: SliderThumbImage(customImage,context),
                              // overlayShape: RoundSliderOverlayShape(overlayRadius: 1),
                              // thumbShape: const CircleThumbShape(thumbRadius: 20),
                              trackShape: CustomTrackShape(),
                            ),
                            child: Slider(
                                value: Utility.addAverageCost.toDouble(),
                                min: 500.0,
                                max: 5000.0,
                                activeColor: Blue_5468ff,
                                inactiveColor: unselected_greey_e7e9ff,
                                label: 'Set volume value',
                                onChanged: (double newValue) {
                                  setState(() {
                                    Utility.addAverageCost = newValue.toInt();

                                    print(
                                        'addAverageCost${Utility.addAverageCost}');
                                  });
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars';
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 500
                              Text("₹500",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right),

                              Text("₹5000+",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right)
                            ],
                          )
                        ],
                      ),
                    ),

                    /*Menu Items*/
                    Container(
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Average Cost for 2
                              Text("Menu Items",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.left),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Cost:
                                  Text(
                                      "Range:${Utility.menuItemsMin.toStringAsFixed(0)} to ${Utility.menuItemsMax.toStringAsFixed(0)}",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.right),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              overlayShape: SliderComponentShape.noOverlay,
                            ),
                            child: RangeSlider(
                              values: RangeValues(
                                  Utility.menuItemsMin, Utility.menuItemsMax),
                              min: 10.0,
                              max: 250.0,
                              labels: RangeLabels(
                                  Utility.menuItemsMin.toString(),
                                  Utility.menuItemsMax.toString()),
                              activeColor: Blue_5468ff,
                              inactiveColor: unselected_greey_e7e9ff,
                              // labels: RangeLabels(
                              //   _currentRangeValues.start.round().toString(),
                              //   _currentRangeValues.end.round().toString(),
                              // ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  Utility.menuItemsMin = values.start;
                                  Utility.menuItemsMax = values.end;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 500
                              Text("10",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right),

                              Text("250",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right)
                            ],
                          )
                        ],
                      ),
                    ),

                    /*Seating Capacity*/
                    Container(
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Average Cost for 2
                              Text("Seating Capacity",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.left),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Cost:
                                  Text(
                                      "Range:${Utility.seatingCapacityMin.toStringAsFixed(0)} to ${Utility.seatingCapacityMax.toStringAsFixed(0)}",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.right),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              thumbColor: Colors.white,
                              overlayShape: SliderComponentShape.noOverlay,
                            ),
                            child: RangeSlider(
                              values: RangeValues(Utility.seatingCapacityMin,
                                  Utility.seatingCapacityMax),
                              min: 10.0,
                              max: 150.0,
                              labels: RangeLabels(
                                  Utility.seatingCapacityMin.toString(),
                                  Utility.seatingCapacityMax.toString()),
                              activeColor: Blue_5468ff,
                              inactiveColor: unselected_greey_e7e9ff,
                              // labels: RangeLabels(
                              //   _currentRangeValues.start.round().toString(),
                              //   _currentRangeValues.end.round().toString(),
                              // ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  Utility.seatingCapacityMin = values.start;
                                  Utility.seatingCapacityMax = values.end;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 500
                              Text("10",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right),

                              Text("150",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.right)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),

            // CommonBlueButton(strNext.toUpperCase(), () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const BottomNavigationScreen(),
            //       ));
            // }, blue_3653f6),
          ],
        ),
      ),
    );
  }

  selectCategory(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            return Container(
                margin: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r),
                        bottomRight: Radius.circular(13.r),
                        bottomLeft: Radius.circular(13.r))),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Column(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Daily Opportunities
                                    // Title
                                    Center(
                                      child: Text("Select Restaurant Category",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.sp),
                                          textAlign: TextAlign.center),
                                    ),

                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: divider_d4dce7,
                                    ),

                                    GetBuilder<AddRestaurantsViewModel>(
                                      builder: (controller) {
                                        if (controller.getCategoryApiResponse
                                                .status ==
                                            Status.LOADING) {
                                          return const Center(
                                              child: CircularIndicator());
                                        }
                                        if (controller.getCategoryApiResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          response = addRestaurantsViewModel
                                              .getCategoryApiResponse.data;
                                          if (response!.status == false) {
                                            Text('${response!.status}');
                                          }
                                        }
                                        if (controller.getCategoryApiResponse
                                                .status ==
                                            Status.ERROR) {
                                          return const Center(
                                              child: ServerError());
                                        }
                                        return response == null ||
                                                response!.getCategory == null ||
                                                response!.getCategory!.rows ==
                                                    null ||
                                                response!
                                                    .getCategory!.rows!.isEmpty
                                            ? Center(
                                                child: NoDataFound(
                                                title: 'Category Not Available',
                                              ))
                                            : ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                primary: false,
                                                shrinkWrap: true,
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                // itemCount: onOfferModel.length,
                                                itemCount: response!
                                                    .getCategory!.rows!.length,
                                                itemBuilder: (context, i) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        setModalState(
                                                          () {
                                                            if (selectedList
                                                                .contains(response!
                                                                    .getCategory!
                                                                    .rows![i]
                                                                    .categoryName)) {
                                                              selectedList.remove(
                                                                  response!
                                                                      .getCategory!
                                                                      .rows![i]
                                                                      .categoryName);
                                                            } else {
                                                              selectedList.add(
                                                                  response!
                                                                      .getCategory!
                                                                      .rows![i]
                                                                      .categoryName!);
                                                            }
                                                            print(
                                                                'selectedList===${selectedList}');
                                                          },
                                                        );
                                                        setState(() {
                                                          final removedBrackets =
                                                              selectedList
                                                                  .toString()
                                                                  .substring(
                                                                      1,
                                                                      selectedList
                                                                              .toString()
                                                                              .length -
                                                                          1);
                                                          final parts =
                                                              removedBrackets
                                                                  .split(', ');

                                                          var joined = parts
                                                              .map((part) =>
                                                                  "$part")
                                                              .join(', ');

                                                          print(joined);
                                                          MyConstant.strdays =
                                                              joined;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16,
                                                                top: 11,
                                                                bottom: 11),
                                                        child: Container(
                                                          color: Colors.white,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              SvgPicture.asset(selectedList
                                                                      .contains(response!
                                                                          .getCategory!
                                                                          .rows![
                                                                              i]
                                                                          .categoryName)
                                                                  ? icon_selected_checkbox
                                                                  : icon_unselected_checkbox),
                                                              SizedBox(
                                                                width: 12.w,
                                                              ),
                                                              // Value Selected
                                                              Text(
                                                                  response!
                                                                      .getCategory!
                                                                      .rows![i]
                                                                      .categoryName!,
                                                                  style: TextStyle(
                                                                      color:
                                                                          black_354356,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 15
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CommonBlueBorderButton(
                                strCancel.toUpperCase(), () {
                              selectedList.clear();
                              MyConstant.strdays = "";
                              setState(() {});
                              Navigator.pop(context, false);
                            }, Colors.white, Colors.white, Blue_5468ff),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: CommonBlueBorderButton(
                                "Confirm".toUpperCase(), () {
                              Utility.selectCategory = selectedList;
                              print(
                                  'resto category====${addRestaurantsDetailsReqModel.restaurantCategory}');
                              print('=== selected list====${selectedList}');
                              Navigator.pop(context, false);
                            }, Colors.white, Colors.white, Blue_5468ff),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          });
        });
  }

  Future<void> _openImagePicker() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      print("=======_selectedImage========${selectedImage}");
      Get.back();
      setState(() {});
      uploadProfilePicReqModel.folder = "images";
      uploadProfilePicReqModel.fileName = "test";
      uploadProfilePicReqModel.contentType =
          "image/${pickedImage.path.split('.').last}";
      await uploadImageViewModel.uploadImage(body: uploadProfilePicReqModel);

      if (uploadImageViewModel.uploadImageApiResponse.status ==
          Status.COMPLETE) {
        UploadProfilePicResModel res =
            uploadImageViewModel.uploadImageApiResponse.data;

        var response = await http.put(
          Uri.parse(res.uploadURL!),
          headers: {
            'Content-Type': "image/${pickedImage.path.split('.').last}",
            'Accept': "*/*",
            'Content-Length': File(pickedImage.path).lengthSync().toString(),
            'Connection': 'keep-alive',
          },
          body: File(pickedImage.path).readAsBytesSync(),
        );
        if (response.statusCode == 200) {
          await PreferenceManagerUtils.setRestoImage(
              'https://bluedip.s3.ap-south-1.amazonaws.com/${res.key}');

          print('response put--${response.statusCode}');
          Get.back();
        }
      }
      // await uploadImage(file: selectedImage!);
    }
  }

  Future<void> _openCameraPicker() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      print("=======_selectedImage========${selectedImage}");
      Get.back();
      setState(() {});
      uploadProfilePicReqModel.folder = "images";
      uploadProfilePicReqModel.fileName = "test";
      uploadProfilePicReqModel.contentType =
          "image/${pickedImage.path.split('.').last}";
      await uploadImageViewModel.uploadImage(body: uploadProfilePicReqModel);

      if (uploadImageViewModel.uploadImageApiResponse.status ==
          Status.COMPLETE) {
        UploadProfilePicResModel res =
            uploadImageViewModel.uploadImageApiResponse.data;

        var response = await http.put(
          Uri.parse(res.uploadURL!),
          headers: {
            'Content-Type': "image/${pickedImage.path.split('.').last}",
            'Accept': "*/*",
            'Content-Length': File(pickedImage.path).lengthSync().toString(),
            'Connection': 'keep-alive',
          },
          body: File(pickedImage.path).readAsBytesSync(),
        );
        if (response.statusCode == 200) {
          await PreferenceManagerUtils.setRestoImage(
              'https://bluedip.s3.ap-south-1.amazonaws.com/${res.key}');

          print('response put--${response.statusCode}');
          Get.back();
        }
      }
      // await uploadImage(file: selectedImage!);
    }
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 1.3;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: bg_f3f5f9,
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(
        label,
        style: TextStyle(
            color: black_354356,
            fontFamily: fontMavenProMedium,
            fontStyle: FontStyle.normal,
            fontSize: 15.sp),
      ),
      deleteIcon: SvgPicture.asset(icon_cancel_with_circle),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
