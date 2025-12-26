import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../services/api_endpoints.dart';
import '../../../common/custom_button.dart';
import '../controllers/seekers_applications_screen_controller.dart';

class AllPendingPostScreen extends StatelessWidget {
   AllPendingPostScreen({super.key});
   final controller = Get.find<SeekersApplicationsScreenController>();


   @override
   Widget build(BuildContext context) {
     return Obx(() {
       if (controller.isLoading.value) {
         return Center(child: CircularProgressIndicator());
       }

       final activeApplications = controller.jobApplication
           .where((app) => (app.status ?? '').toUpperCase() == "REJECTED").toList();

       return ListView.separated(
         shrinkWrap: true,
         padding: EdgeInsets.zero,
         separatorBuilder: (_, __) => SizedBox(height: 12.h),
         itemCount: activeApplications.length,
         itemBuilder: (context, index) {
           final application = activeApplications[index];
           final logo = application.logo;

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
                   offset: Offset(0, 3),
                 )
               ],
             ),
             child: Column(
               children: [
                 Row(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.circular(8.r),
                       child: (logo != null && logo.isNotEmpty)
                           ? Image.network(
                         '${Urls.url}$logo',
                         height: 60.h,
                         width: 70.w,
                         fit: BoxFit.cover,
                       )
                           : Image.asset(
                         'assets/images/find_jobs.png',
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
                               color: Color(0xFF2C3E50),
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
                   onTap: () {},
                   borderColor: Colors.transparent,
                   radius: 60.r,
                   text: 'Pending',
                   backgroundColor: Color(0xFFF59E0B).withOpacity(0.15),
                   textColor: Color(0xFFF59E0B),
                 ),
                 SizedBox(height: 20.h),
               ],
             ),
           );
         },
       );
     });
   }

}
