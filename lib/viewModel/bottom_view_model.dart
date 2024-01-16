import 'package:get/get.dart';

class BottomViewModel extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    update();
  }

  /// tab change
  int _tabActiveIndex = 0;

  int get tabActiveIndex => _tabActiveIndex;

  set tabActiveIndex(int value) {
    _tabActiveIndex = value;
    update();
  }

  /// tack away index

  int _takeawayIndex = 0;

  int get takeawayIndex => _takeawayIndex;

  set takeawayIndex(int value) {
    _takeawayIndex = value;
    update();
  }

  setTakeawayIndex({int? index}) {
    _takeawayIndex = index!;
    update();
  }

  /// dine in index
  int _dineInIndex = 0;

  int get dineInIndex => _dineInIndex;

  set dineInIndex(int value) {
    _dineInIndex = value;
    update();
  }

  setDineInIndex({int? index}) {
    _dineInIndex = index!;
    update();
  }
}
