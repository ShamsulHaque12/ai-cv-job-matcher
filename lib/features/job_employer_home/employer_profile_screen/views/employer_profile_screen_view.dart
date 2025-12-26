import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/shared_preferences_helper.dart';
import '../../../theme/app_colors.dart';
import '../../../employer_auth/auth/contact_information/controllers/employer_auth_contact_information_controller.dart';
import '../../edit_employer_profile/controllers/edit_employer_profile_controller.dart';
import '../../edit_employer_profile/views/edit_language_screen.dart';
import '../../edit_employer_profile/helps_faq/helps_screen.dart';
import '../controllers/employer_profile_screen_controller.dart';

class EmployerProfileScreenView
    extends GetView<EmployerProfileScreenController> {
  const EmployerProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final EditEmployerProfileController editEmployerProfileController = Get.put(
      EditEmployerProfileController(),
    );
    Get.put(EmployerAuthContactInformationController());
    Get.put(EmployerProfileScreenController());
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 12.w),
        //   child: CircleAvatar(
        //     backgroundColor: const Color(0xFF1E3A8A).withAlpha(10),
        //     child: Image.asset(
        //       "assets/images/splash_screen.png",
        //       height: 20.h,
        //       width: 30.w,
        //     ),
        //   ),
        // ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Obx(() {
                      final String profilePic =
                          editEmployerProfileController
                              .showMe
                              .value
                              ?.data
                              ?.profilePic ??
                          '';

                      final String imageUrl = profilePic.isNotEmpty
                          ? '${Urls.url}$profilePic'
                          : '';

                      return CircleAvatar(
                        radius: 50.r,
                        backgroundImage: imageUrl.isNotEmpty
                            ? NetworkImage(imageUrl)
                            : const AssetImage("assets/images/post1.png")
                                  as ImageProvider,
                        onBackgroundImageError: (_, __) {
                          // fallback image if error
                        },
                      );
                    }),
                  ],
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          editEmployerProfileController.showMe.value?.data?.fullName ??
                              '',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          editEmployerProfileController.showMe.value?.data?.email ??
                              '',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          editEmployerProfileController.showMe.value?.data?.country ??
                              '',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(30),
                    spreadRadius: 6,
                    blurRadius: 16,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileInfoItem(
                    label: 'Update Company Profile',
                    image: "assets/icons/edit2.png",
                    imageIcon: "assets/icons/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.EMPLOYER_AUTH_COMPANY_INFORMATION);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
                  // ProfileInfoItem(
                  //   label: 'Update Contact Profile',
                  //   image: "assets/icon/edit2.png",
                  //   imageIcon: "assets/icon/arrow.png",
                  //   onPressed: () {
                  //     Get.toNamed(Routes.EMPLOYER_AUTH_CONTACT_INFORMATION);
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Divider(color: Colors.grey, thickness: 1),
                  // ),
                  ProfileInfoItem(
                    label: 'Edit Profile',
                    image: "assets/icons/edit2.png",
                    imageIcon: "assets/icons/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.EDIT_EMPLOYER_PROFILE);
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: Divider(color: Color(0xffF3F4F6), thickness: 2),
                  // ),
                  // ProfileInfoItem(
                  //   label: 'Notifications',
                  //   image: "assets/icon/notification.png",
                  //   imageIcon: "assets/icon/arrow.png",
                  //   onPressed: () {
                  //     Get.to(() => EditNotificationScreen());
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Divider(color: Colors.grey, thickness: 1),
                  // ),
                  // ProfileInfoItem(
                  //   label: 'Security',
                  //   image: "assets/icon/security.png",
                  //   imageIcon: "assets/icon/arrow.png",
                  //   onPressed: () {
                  //     Get.to(() => EditSecurityScreen());
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
                  ProfileInfoItem(
                    label: 'Language',
                    value: "Language(US)",
                    image: "assets/icons/exchange.png",
                    imageIcon: "assets/icons/arrow.png",
                    onPressed: () {
                      Get.to(() => EditLanguageScreen());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
                  ProfileInfoItem(
                    label: 'Change Password',
                    image: "assets/icons/security.png",
                    imageIcon: "assets/icons/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
                  ProfileInfoItem(
                    label: 'Help',
                    image: "assets/icons/help.png",
                    imageIcon: "assets/icons/arrow.png",
                    onPressed: () {
                      Get.to(() => HelpsScreen());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _showSuccessDialog(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/logout.png",
                          width: 35.w,
                          height: 30.h,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/icons/arrow.png",
                          height: 20.h,
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/logout.png",
                width: 30.w,
                height: 30.h,
                color: Colors.black,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.h),
              Text(
                "Logout!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Are you sure you want to logout from the application?!",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPreferencesHelper.logout();
                      Get.offAllNamed(Routes.AUTH_LOGIN_SCREEN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text("Yes, Logout"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


}

class ProfileInfoItem extends StatelessWidget {
  final String label;
  final String? value;
  final String image;
  final String imageIcon;
  final VoidCallback? onPressed;

  const ProfileInfoItem({
    super.key,
    required this.label,
    this.value,
    required this.image,
    required this.imageIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(image, width: 35.w, height: 30.h, color: Colors.black),
              SizedBox(width: 5.w),
              Text(
                label,
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                value ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
              SizedBox(width: 5.w),
              Image.asset(imageIcon, width: 30.w, height: 30.h),
            ],
          ),
        ],
      ),
    );
  }
}
