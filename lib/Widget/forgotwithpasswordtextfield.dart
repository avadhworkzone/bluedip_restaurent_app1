import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../UiScreen/Auth/ForgotPasswordScreen.dart';
import '../utils/validation_utils.dart';
import 'box_shadow.dart';

class ForgotWithPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  // String? Function(dynamic value) validator;

  late final TextInputAction textInputAction;

  ForgotWithPasswordTextField({this.controller, required this.textInputAction});

  @override
  State<ForgotWithPasswordTextField> createState() =>
      _ForgotWithPasswordTextFieldState();
}

class _ForgotWithPasswordTextFieldState
    extends State<ForgotWithPasswordTextField> {
  // Initially password is obscure
  bool _passwordVisible = false;

  bool isforgot = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //  height: 52.h,
          decoration: boxDecoration,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: widget.validator,
            controller: widget.controller,
            obscureText: !_passwordVisible,

            validator: (value) {
              ValidationMethod.validateIsRequired(value);
            },
            style: TextStyle(
                color: black_354356,
                fontWeight: FontWeight.w500,
                fontFamily: fontMavenProMedium,
                fontStyle: FontStyle.normal,
                fontSize: 15.sp),
            decoration: InputDecoration(
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 20, minWidth: 80),
              suffixIcon: IconButton(
                // icon: Icon(
                //   // Based on passwordVisible state choose the icon
                //   _passwordVisible
                //       ? Icons.visibility
                //       : Icons.visibility_off,
                //   color: Theme.of(context).primaryColorDark,
                // ),
                padding: EdgeInsets.zero,
                icon: isforgot == true
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Text("Forgot?".toUpperCase(),
                              style: TextStyle(
                                color: grey_969da8,
                                fontFamily: fontMavenProMedium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.left),
                        ),
                      )
                    : Text(
                        _passwordVisible
                            ? "Hide".toUpperCase()
                            : "Show".toUpperCase(),
                        style: TextStyle(
                          color: grey_969da8,
                          fontFamily: fontMavenProMedium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.left),

                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),

              isDense: true,
              //  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              border: InputBorder.none,

              labelStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                  fontFamily: fontMavenProMedium,
                  fontWeight: FontWeight.w600),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: blue_3653f6),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            keyboardType: TextInputType.text,
            cursorColor: blue_3653f6,
            textInputAction: widget.textInputAction,
            onChanged: (value) {
              print("Checking" + value.length.toString());
              if (value.length > 0) {
                setState(() {
                  isforgot = false;
                });
              } else {
                setState(() {
                  isforgot = true;
                });
              }
            },
          ),
        )
      ],
    );
  }
}
