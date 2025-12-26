import 'package:get/get.dart';

import '../../application_detail_screens/controllers/application_detail_screens_controller.dart';
import '../../home_screen/controllers/job_seekers_home_screen_controller.dart';
import '../../seekers_applications_screen/controllers/seekers_applications_screen_controller.dart';
import '../../seekers_profile_screen/controllers/seekers_profile_screen_controller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../controllers/job_seekers_bottom_navbar_screen_controller.dart';

class JobSeekersBottomNavbarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersBottomNavbarScreenController>(
      () => JobSeekersBottomNavbarScreenController(),
    );
    Get.lazyPut<SeekersApplicationsScreenController>(
      () => SeekersApplicationsScreenController(),
    );
    Get.lazyPut<ApplicationDetailScreensController>(
      () => ApplicationDetailScreensController(),
      fenix: true,
    );
    Get.lazyPut<SeekersProfileScreenController>(
      () => SeekersProfileScreenController(),
    );
    Get.lazyPut<JobSeekersHomeScreenController>(
      () => JobSeekersHomeScreenController(),
    );
    Get.put(SeekersSavedJobsController());
    Get.put(SeekersApplicationsScreenController());
  }
}
