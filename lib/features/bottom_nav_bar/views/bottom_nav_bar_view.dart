import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../job_employer_home/applicatios_screen/views/applicatios_screen_view.dart';
import '../../job_employer_home/employer_profile_screen/views/employer_profile_screen_view.dart';
import '../../job_employer_home/job_home_employer_screen/views/job_home_seker_screen_view.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      JobHomeSekerScreenView(),
      ApplicatiosScreenView(),
      EmployerProfileScreenView(),
    ];
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Obx(() => screens[controller.isselectedIndex.value]),
        bottomNavigationBar: Container(
          height: 60.h,
          margin: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withAlpha(10),
                blurRadius: 4,
                spreadRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => bottomNavItem(
                  Icons.home,
                  'Home',
                  controller.isselectedIndex.value == 0,
                  () {
                    controller.isselectedIndex.value = 0;
                  },
                ),
              ),
              Obx(
                () => bottomNavItem(
                  Icons.list,
                  'Applications',
                  controller.isselectedIndex.value == 1,
                  () {
                    controller.isselectedIndex.value = 1;
                  },
                ),
              ),
              Obx(
                () => bottomNavItem(
                  Icons.person_2,
                  'Profile',
                  controller.isselectedIndex.value == 2,
                  () {
                    controller.isselectedIndex.value = 2;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavItem(
    IconData icon,
    String title,
    bool isSelected,
    VoidCallback ontap,
  ) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withAlpha(10),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryColor),
                SizedBox(width: 4.w),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        : IconButton(
            onPressed: ontap,
            icon: Icon(icon, color: AppColors.primaryColor),
          );
  }
}
