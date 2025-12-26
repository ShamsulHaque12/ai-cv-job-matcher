import 'package:get/get.dart';

import '../controllers/add_new_vacancy_controller.dart';

class AddNewVacancyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewVacancyController>(
      () => AddNewVacancyController(),
    );
  }
}
