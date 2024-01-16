import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_icons.dart';
import '../TakeaWay/PickupTab.dart';
import '../TakeaWay/PreparingTab.dart';
import '../TakeaWay/ReadyTab.dart';
import '../TakeaWay/OrderList.dart';
import 'BottomSheetOrderLate.dart';

class BottomSheetTest extends StatefulWidget {
  const BottomSheetTest({Key? key}) : super(key: key);

  @override
  State<BottomSheetTest> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheetTest>
    with SingleTickerProviderStateMixin {
  List<String> animalNames = ['Elephant', 'Tiger', 'Kangaroo'];
  List<String> animalFamily = ['Elephantidae', 'Panthera', 'Macropodidae'];
  List<String> animalLifeSpan = ['60-70', '8-10', '15-20'];
  List<String> animalWeight = ['2700-6000', '90-310', '47-66'];
  int selectedTile = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.1),
    end: const Offset(0, -0.3),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: bg_f3f5f9,
        body: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 14),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0017191a),
                          offset: Offset(
                            0.0,
                            24.0,
                          ),
                          blurRadius: 21.0,
                          spreadRadius: 0.0,
                        )
                      ],
                    ),
                    child: Text("Takeaway",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontJosefinSansBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.sp),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 32.w,right: 0.w),
                    height: 35.h,
                    color: bg_f3f5f9,
                    width: double.infinity,
                    child: TabBar(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      labelPadding: EdgeInsets.zero,
                      isScrollable: true,
                      labelColor: Colors.white,

                      unselectedLabelColor: grey_969da8,

                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Blue_5468ff),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: const Tab(
                            child: Text("Incoming(3)"),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: const Text("Preparing(1)"),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: const Text("Ready (2)"),
                          ),
                        ),
                      ],
                      // indicatorWeight: 10,
                      labelStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: fontMavenProMedium), //For Selected tab
                      unselectedLabelStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily:
                              fontMavenProMedium), //For Un-selected Tabs
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      physics: ScrollPhysics(),
                      // controller: _tabController,
                      children: [
                        PreparingTab(),
                        ReadyTab(),
                        PickupTab(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: bottomDetailsSheet()),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            selectOrderLate(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            margin: EdgeInsets.only(bottom: 100.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                boxShadow: const [
                  BoxShadow(
                    color: grey_969da8,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                color: red_d9534f),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  icon_notification,
                  color: Colors.white,
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("2 Orders late",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontMavenProProSemiBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      )),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OrderListScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .12,
      minChildSize: .12,
      maxChildSize: .12,
      builder: (BuildContext context, ScrollController scrollController) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              icon_triangle_img,
              width: double.infinity,
              fit: BoxFit.fill,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text("You have 1 new order",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontMavenProProSemiBold,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp),
                  textAlign: TextAlign.center),
            ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: 25),
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment(0, 0),
            //           end: Alignment(0.9428571482093964, 0.9999999869113068),
            //           colors: [
            //             const Color(0xff73a5ff),
            //             const Color(0xff1e6af2)
            //           ]),
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25.r),
            //           topRight: Radius.circular(25.r))),
            //   child: ListView(
            //     controller: scrollController,
            //     children: [
            //       Column(
            //         children: [
            //           SizedBox(
            //             height: 40.h,
            //           ),
            //           Text("You have 1 new order",
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w600,
            //                   fontFamily: fontMavenProProSemiBold,
            //                   fontStyle: FontStyle.normal,
            //                   fontSize: 15.sp),
            //               textAlign: TextAlign.center),
            //           SizedBox(
            //             height: 30.h,
            //           ),
            //
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // CustomPaint(
            //   painter: TrianglePainter(
            //     strokeColor: Color(0xff73a5ff),
            //
            //     strokeWidth: 40,
            //     paintingStyle: PaintingStyle.fill,
            //   ),
            //   child: Container(
            //       width: 60.w,
            //       height: 60.h,
            //       // decoration: BoxDecoration(
            //       //   shape: BoxShape.circle,
            //       //   gradient: LinearGradient(
            //       //       begin: Alignment.topCenter,
            //       //       end: Alignment.bottomCenter,
            //       //       colors: [
            //       //         const Color(0xff73a5ff),
            //       //         const Color(0xff1e6af2)
            //       //       ]),
            //       // ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: SlideTransition(
            //             position: _offsetAnimation,
            //             child: SvgPicture.asset(icon_up_arrow)),
            //       )),
            // ),
          ],
        );
      },
    );
  }

  void selectOrderLate(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              decoration: BoxDecoration(
                  color: red_d9534f,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Orders Late
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 19.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(icon_warning),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("2 Orders Late",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontJosefinSansBold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.sp,
                                    height: 1.5),
                                textAlign: TextAlign.left),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context, false);
                            },
                            child: SvgPicture.asset(
                              icon_cancel,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.white,
                        child: const BottomSheetOrderLate())
                  ],
                ),
              ));
        });
  }
}
