import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Widget/ChipLayout.dart';


class TestChecking extends StatefulWidget {


  const TestChecking({Key? key}) : super(key: key);

  @override
  State<TestChecking> createState() => _TestCheckingState();
}

class _TestCheckingState extends State<TestChecking> {

  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  String  tempString = "";

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  int? valuesss;
  /// This is just an example for using `TextEditingController` to manipulate
  /// the the `TextField` just like a normal `TextField`.
  _onPressedModifyTextField() {
    final text = 'Test';
    _textEditingController.text = text;
    _textEditingController.value = _textEditingController.value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  DateTime time = DateTime(2016, 5, 10, 22, 35);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
  String? _title;
  TimeOfDay? _timeOfDay;
  Function? _updateTimeFunction;
  SfRangeValues _sfvalues = SfRangeValues(4.0, 8.0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            // Container(
            //   margin: EdgeInsets.only(top: 4.h, right: 24.w, left: 24.w),
            //   padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
            //   decoration: BoxDecoration(
            //       border: Border.all(color: grey_969da8, width: 1),
            //       borderRadius: BorderRadius.all(Radius.circular(8.r)),
            //       color: grey_969da8),
            //   child: Container(
            //     child: TagEditor(
            //       length: _values.length,
            //       hasAddButton: false,
            //       resetTextOnSubmitted: false,
            //
            //       delimiters: [',', ' '],
            //       inputFormatters: <TextInputFormatter>[
            //         FilteringTextInputFormatter.allow(
            //           RegExp(r'^[a-z A-Z]+$'),
            //         ),
            //       ],
            //       inputDecoration: InputDecoration(
            //           border: InputBorder.none,
            //           hintText: 'Add Tags...',
            //           helperStyle: TextStyle(
            //               fontSize: 14.sp,
            //               fontFamily: fontMavenProMedium,
            //               color: grey_969da8)),
            //       onTagChanged: (newValue) {
            //         setState(() {
            //           print("Tags onchange : " + newValue);
            //           if (newValue != "") {
            //             _values.add(newValue);
            //             print(_values);
            //           }
            //         });
            //       },
            //       onSubmitted: (newValue) {
            //         setState(() {
            //           print("Tags onsubmitted :" + newValue);
            //
            //           if (newValue != "") {
            //             _values.add(newValue);
            //             print(_values);
            //           }
            //         });
            //       },
            //       tagBuilder: (context, index) => ChipLayout(
            //         index: index,
            //         label: _values[index],
            //         onDeleted: _onDelete,
            //       ),
            //     ),
            //   ),
            // ),


            // Container(
            //   height: 150,
            //   child: CupertinoDatePicker(
            //     initialDateTime: time,
            //     mode: CupertinoDatePickerMode.time,
            //     use24hFormat: false,
            //     // This is called when the user changes the time.
            //     onDateTimeChanged: (DateTime newTime) {
            //       setState(() => time = newTime);
            //     },
            //   ),
            // ),

            // _DatePickerItem(
            //   children: <Widget>[
            //     const Text('Time'),
            //     CupertinoButton(
            //       // Display a CupertinoDatePicker in time picker mode.
            //       onPressed: () => _showDialog(
            //         CupertinoDatePicker(
            //           initialDateTime: time,
            //           mode: CupertinoDatePickerMode.time,
            //           use24hFormat: false,
            //           // This is called when the user changes the time.
            //           onDateTimeChanged: (DateTime newTime) {
            //             setState(() => time = newTime);
            //           },
            //         ),
            //       ),
            //       // In this example, the time value is formatted manually.
            //       // You can use the intl package to format the value based on
            //       // the user's locale settings.
            //       child: Text(
            //         '${time.hour}:${time.minute}',
            //         style: const TextStyle(
            //           fontSize: 22.0,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),




            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    TagEditor(
                      length: _values.length,
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      delimiters: [',', ' ','Add'],
                      hasAddButton: false,
                      resetTextOnSubmitted: true,
                      // This is set to grey just to illustrate the `textStyle` prop
                      textStyle: const TextStyle(color: Colors.grey),
                      onSubmitted: (outstandingValue) {
                        //print(outstandingValue);
                        setState(() {
                          _values.add(outstandingValue);
                        });
                      },
                      inputDecoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Hint Text...',

                        suffixIcon: IconButton(

                          padding: EdgeInsets.zero,
                          icon: Text(
                              "Add",
                              style:  TextStyle(
                                  color:  Blue_5468ff,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 15.sp
                              ),
                              textAlign: TextAlign.left
                          ),
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
                      tagBuilder: (context, index) =>
                          _Chip(
                            index: index,
                            label: _values[index],
                            onDeleted: _onDelete,
                          ),
                      // InputFormatters example, this disallow \ and /
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                      // ],
                    ),
                    const Divider(),
                    // This is just a button to illustrate how to use
                    // TextEditingController to set the value
                    // or do whatever you want with it
                    ElevatedButton(
                      onPressed: _onPressedModifyTextField,
                      child: const Text('Use Controlelr to Set Value'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

}


// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
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
      label: Text(label,style: TextStyle(
          color:  black_354356,
          fontFamily: fontMavenProMedium,
          fontStyle:  FontStyle.normal,
          fontSize: 15.sp
      ),),
      deleteIcon: SvgPicture.asset(icon_cancel_with_circle),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}