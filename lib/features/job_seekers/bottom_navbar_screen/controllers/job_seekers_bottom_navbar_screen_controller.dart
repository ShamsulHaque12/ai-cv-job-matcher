
import 'package:get/get.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../model/profile_model.dart';

class JobSeekersBottomNavbarScreenController extends GetxController {
  final isselectedIndex = 0.obs;
  final isLoading = false.obs;
  final profileInfo = Rxn<UserModel>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchProfileInfo();
    if (Get.arguments != null) {
      isselectedIndex.value = Get.arguments as int;
    }
  }
  Future<void> _fetchProfileInfo()async{
    try{
      isLoading.value = true;
      NetworkResponse response = await NetworkCaller().getRequest(url: Urls.authMe);
      if(response.isSuccess){
        final data = response.responseData?['data'];
        profileInfo.value = UserModel.fromJson(data);
      }
    }catch(e){
      showSnackBar(true, '$e');
    }finally{
      isLoading.value = false;
    }
  }

}
