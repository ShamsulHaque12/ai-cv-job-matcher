import 'package:get/get.dart';

import '../model/all_post_model.dart';

class AllPostScreenController extends GetxController {
  RxList<AllPostModel> postList = <AllPostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllPost();
  }

  void getAllPost() async {
    postList.value = [
      AllPostModel(
        title: "UI/UX Designer",
        subtitle: "AirBNB",
        state: "United states - Full Time",
        image: "assets/images/post1.png",
        salary: "10.0K",
        activeText: "Active",
      ),
      AllPostModel(
        title: "Flutter Developer",
        subtitle: "AirBNB",
        state: "United states - Full Time",
        image: "assets/images/post1.png",
        salary: "15.0K",
        activeText: "Active",
      ),
    ];
  }
}
