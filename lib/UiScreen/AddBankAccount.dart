import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';
import '../Widget/toolbar_with_title_edit.dart';


class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {

  final _accholdernameController = TextEditingController();
  final _ifscController = TextEditingController();
  final _accnumController = TextEditingController();
  final _confaccnumController = TextEditingController();

  bool isBottomButton = false;

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:Colors.white, // navigation bar color
      statusBarColor:Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));
    return  SafeArea(

        child: Scaffold(
          backgroundColor: bg_f3f5f9,
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ToolbarWithTitleEdit("Add Bank Account",(){
               setState(() {
                 isBottomButton = true;
               });
              }),

              Padding(
                padding:  EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h,),

                          Text(
                              "Account Holder Name",
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          loginTextformField(
                            "Aakib",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller:_accholdernameController,
                            obscureText: true,
                            onChanged: (value) {},
                          ) ,
                          SizedBox(height: 22.h,),

                          Text(
                              "IFSC Code",
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          loginTextformField(
                            "SBI00fSBI",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller:_ifscController,
                            obscureText: true,
                            onChanged: (value) {},
                          ) ,

                          SizedBox(height: 22.h,),

                          Text(
                              "Account Number",
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          loginTextformField(
                            "52642582152",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller:_accnumController,
                            obscureText: true,
                            onChanged: (value) {},
                          ) ,

                          SizedBox(height: 22.h,),

                          Text(
                              "Confirm Account Number",
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          loginTextformField(
                            "52642582152",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            controller:_confaccnumController,
                            obscureText: true,
                            onChanged: (value) {},
                          ) ,

                          Visibility(
                            visible: isBottomButton,
                            child: Column(
                              children: [
                                SizedBox(height: 40.h,),

                                CommonBlueButton(
                                    strSave,(){},blue_3653f6
                                ),

                              ],
                            ),
                          ),





                        ],
                      ),
                    ),





                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
