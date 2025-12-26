import 'package:get/get.dart';

class FaqScreenController extends GetxController {
  var selectedFilter = 'General'.obs;

  @override
  void onInit() {
    super.onInit();
    selectedFilter.value = 'General';
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  //..........Genarel Screen.............
  RxInt expandedIndex = (-1).obs;

  void toggleExpansion(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }
}