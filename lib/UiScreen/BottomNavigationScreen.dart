// /*
//  *  Copyright 2020 mailto:chaobinwu89@gmail.com
//  *
//  *  Licensed under the Apache License, Version 2.0 (the "License");
//  *  you may not use this file except in compliance with the License.
//  *  You may obtain a copy of the License at
//  *
//  *      http://www.apache.org/licenses/LICENSE-2.0
//  *
//  *  Unless required by applicable law or agreed to in writing, software
//  *  distributed under the License is distributed on an "AS IS" BASIS,
//  *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  *  See the License for the specific language governing permissions and
//  *  limitations under the License.
//  */
//
// import 'package:bluedip_restaurent/Styles/my_colors.dart';
// import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/DetailPage1.dart';
//
// import 'package:bluedip_restaurent/UiScreen/DetailPage5.dart';
// import 'package:bluedip_restaurent/UiScreen/DineIn/DineIn.dart';
// import 'package:bluedip_restaurent/UiScreen/Auth/ForgotPasswordScreen.dart';
// import 'package:bluedip_restaurent/UiScreen/home/Homepage.dart';
// import 'package:bluedip_restaurent/UiScreen/Auth/LoginScreen.dart';
// import 'package:bluedip_restaurent/UiScreen/TakeaWay/Takeaways.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../Styles/my_font.dart';
// import '../Styles/my_icons.dart';
// import 'Account/Account.dart';
// import 'Offers/BluedipDeal.dart';
//
// import 'Auth/RegisterScreen.dart';
// import 'TestOne.dart';
//
// class BottomNavigationScreen extends StatefulWidget {
//   const BottomNavigationScreen({super.key});
//
//   @override
//   State createState() => _State();
// }
//
// class _State extends State<BottomNavigationScreen> {
//   int _currentIndex = 0;
//   final tabs = [
//      Homepage(),
//     const Takeaways(),
//     const BluedipDeal(),
//     const DineIn(),
//     const Account(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: tabs[_currentIndex],
//         bottomNavigationBar: ConvexAppBar(
//           style: TabStyle.fixed,
//           backgroundColor: Colors.white,
//           activeColor: Blue_5468ff,
//           color: Color(0xff9db2ce),
//           items: [
//             TabItem(
//               icon: SvgPicture.asset(
//                 icon_offer,
//               ),
//               title: 'Offer',
//               fontFamily: fontMavenProMedium,
//               isIconBlend: true,
//             ),
//             TabItem(
//                 icon: SvgPicture.asset(
//                   icon_takeaway,
//                 ),
//                 title: 'Takeaway',
//                 fontFamily: fontMavenProMedium,
//                 isIconBlend: true),
//             TabItem(
//                 icon: Image.asset(
//               icon_logo_third,
//               fit: BoxFit.fill,
//             )),
//             TabItem(
//                 icon: SvgPicture.asset(icon_dinein),
//                 title: 'Dinein',
//                 fontFamily: fontMavenProMedium,
//                 isIconBlend: true),
//             TabItem(
//                 icon: SvgPicture.asset(icon_profile),
//                 title: 'Profile',
//                 fontFamily: fontMavenProMedium,
//                 isIconBlend: true),
//           ],
//           initialActiveIndex: 0,
//           onTap: (int i) => {
//             setState(() {
//               _currentIndex = i;
//             })
//           },
//         ),
//       ),
//     );
//   }
// }
