import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../services/api_endpoints.dart';
import '../../../common/custom_button.dart';
import '../controllers/seekers_applications_screen_controller.dart';

class AllRejectedPostScreen extends StatelessWidget {
   AllRejectedPostScreen({super.key});
  final controller = Get.find<SeekersApplicationsScreenController>();


  @override
  Widget build(BuildContext context) {
    return  Obx((){
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      final rejectedApplications = controller.jobApplication
          .where((app) => app.status == "REJECTED")
          .toList();
      return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemCount: rejectedApplications.length,
        itemBuilder: (context, index) {
          final application = rejectedApplications[index];


          return Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        '${Urls.url}${application.logo}' ?? '',
                        height: 60.h,
                        width: 70.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            application.position ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2C3E50),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            application.companyName ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Divider(thickness: 1, color: Colors.grey.shade300),
                SizedBox(height: 5.h),

                CustomButton(
                    height: 35.h,
                    onTap: () {
                      if (application.status == "REJECTED") {
                        // Get.to(() => RejectedScreen(),arguments: application);
                      }
                    },
                    borderColor: Colors.transparent,
                    radius: 60.r, text: 'Rejected',
                    backgroundColor: Color(0xFFDC2626).withOpacity(0.15),
                    textColor: Color(0xFFDC2626)
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          );
        },
      );
    });
  }
}
