import 'dart:developer';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../home_screen/model/job_model.dart';
import '../../seekers_apply_screen/views/failed_screens.dart';
import '../../seekers_apply_screen/views/successful_screen.dart';
import '../model/single_job_model.dart';

class SeekersJobDetailsScreenController extends GetxController {
  final isLoading = false.obs;
  final singleJob = Rx<SingleJobModel?>(null);
  final id = ''.obs;
  @override
  void onInit() {
    super.onInit();
     id.value = Get.arguments.toString();
    fetchSingleJob();
  }
  Future<void> jobApply(jobId)async{
   try{
     isLoading.value = true;
     NetworkResponse response =await NetworkCaller().postRequest(url: Urls.jobApply,body: {
       "jobId": jobId
     });
     if(response.isSuccess){
       Get.offAll(SuccessfulScreen());
     }else{
       Get.offAll(FailedScreens());
     }
   }catch(e){
     showSnackBar(false, 'Job apply Unsuccessful');
   }finally{
     isLoading.value = false;
   }
}
  Future<void> saveJobs(jobId)async{
    try{
      NetworkResponse response =await NetworkCaller().postRequest(url: Urls.saveJobs,body: {
        "jobId": jobId
      });
      if(response.isSuccess){
        showSnackBar(true, 'Save Job ');
      }else{
        showSnackBar(false, 'Not Save Job ');
      }
    }catch(e){
      showSnackBar(false, 'Job apply Unsuccessful');
    }
  }
  Future<void> fetchSingleJob() async {
    try {
      isLoading.value = true;

      NetworkResponse response =
      await NetworkCaller().getRequest(
        url: Urls.singleJob(id.value),
      );

      if (response.isSuccess) {

        final dataList = response.responseData?['data'];
        if (dataList != null && dataList is Map<String, dynamic>) {
           singleJob.value = SingleJobModel.fromJson(dataList);
        } else {
          log("Expected Map but got something else");
        }
        print('MY data $singleJob');
      } else {
         Get.toNamed(Routes.AUTH_UPLOAD_RESUME);
      }
    } catch (e) {
      log("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }

}
