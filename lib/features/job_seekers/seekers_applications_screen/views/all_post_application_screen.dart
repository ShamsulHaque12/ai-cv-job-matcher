import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/api_endpoints.dart';
import '../../../common/custom_button.dart';
import '../../application_detail_screens/views/pending_screen.dart';
import '../controllers/seekers_applications_screen_controller.dart';

class AllPostApplicationScreen extends StatelessWidget {
  final SeekersApplicationsScreenController controller = Get.put(
    SeekersApplicationsScreenController(),
  );
  AllPostApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemCount: controller.jobApplication.length,
        itemBuilder: (context, index) {
          final application = controller.jobApplication[index];

          Color bgColor;
          Color textColor;
          String buttonText = application.status ?? 'bo';

          if (application.status == "PENDING") {
            bgColor = Color(0xFFF59E0B).withOpacity(0.15);
            textColor = Color(0xFFF59E0B);
          } else if (application.status == "REJECTED") {
            bgColor = Color(0xFFDC2626).withOpacity(0.15);
            textColor = Color(0xFFDC2626);
          } else if (application.status == "SELECTED") {
            bgColor = Color(0xFF16A34A).withOpacity(0.15);
            textColor = Color(0xFF16A34A);
          } else {
            bgColor = Colors.grey.withOpacity(0.15);
            textColor = Colors.grey;
          }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    '${Urls.url}${application.logo}' ?? '',
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.position ?? '',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        application.companyName ?? '',
                        style: GoogleFonts.inter(
                          color: Color(0xff8A8894),
                          fontSize: 12.sp,
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
                    if (application.status == "PENDING") {
                      Get.to(() => PendingScreen(),arguments: application);
                    }/* else if (application.status == "REJECTED") {
                      Get.to(() => RejectedScreen(),arguments: application);
                    } else if (application.status == "SELECTED") {
                      Get.to(() => ApplicationDetailScreensView(),arguments: application);
                    } else {
                      Get.snackbar("Info", "No page assigned for this status");
                    }*/
                  },
                  text: buttonText,
                  backgroundColor: bgColor,
                  textColor: textColor,
                  borderColor: Colors.transparent,
                  radius: 60.r,
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
