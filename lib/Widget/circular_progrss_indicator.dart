import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white.withOpacity(0.5),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Server error"));
  }
}

class NoDataFound extends StatelessWidget {
  NoDataFound({Key? key, this.title}) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title ?? "No data found!"));
  }
}

SnackbarController snackBar({String? title}) {
  return Get.snackbar('', '$title',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: blue_3d56f0);
}
