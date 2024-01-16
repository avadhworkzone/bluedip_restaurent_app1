import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/DetailPage1.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/MaterialDesignIndicator.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/search_bar.dart';
import 'IncomingTab.dart';
import 'TakeaWay/PreparingTab.dart';
import 'TakeaWay/ReadyTab.dart';

class TakeawaysTesting extends StatefulWidget {
  const TakeawaysTesting({Key? key}) : super(key: key);

  @override
  State<TakeawaysTesting> createState() => _TakeawaysState();
}

class _TakeawaysState extends State<TakeawaysTesting>
    with TickerProviderStateMixin {
  ScrollController? _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
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
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bg_f3f5f9,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: bg_f3f5f9,
                  titleSpacing: 0,
                  title: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0017191a),
                          offset: Offset(
                            0.0,
                            3.0,
                          ),
                          blurRadius: 21.0,
                          spreadRadius: 0.0,
                        )
                      ],
                    ),
                    child: Text("Takeaway",
                        style: TextStyle(
                            color: black_354356,
                            fontWeight: FontWeight.w700,
                            fontFamily: fontJosefinSansBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.sp),
                        textAlign: TextAlign.left),
                  ),
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
                  snap:
                      true, // <--- this is required if I want the application bar to show when I scroll up
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(
                      screenHeight / 15.07,
                    ),
                    child: Container(
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
                  ), // <-- total of 2 tabs
                ),
              ];
            },
            body: Expanded(
              flex: 1,
              child: TabBarView(
                physics: ScrollPhysics(),
                // controller: _tabController,
                children: [
                  IncomingTab(),
                  PreparingTab(),
                  ReadyTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
