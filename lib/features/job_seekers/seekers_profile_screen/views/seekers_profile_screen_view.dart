
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobly_ai/features/job_seekers/seekers_profile_screen/views/privacy_policy_screen.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/shared_preferences_helper.dart';
import '../../../theme/app_colors.dart';
import '../../bottom_navbar_screen/controllers/job_seekers_bottom_navbar_screen_controller.dart';
import '../controllers/seekers_profile_screen_controller.dart';

class SeekersProfileScreenView extends GetView<SeekersProfileScreenController> {
  const SeekersProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final profileInfoController = Get.find<JobSeekersBottomNavbarScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Obx(() {
        final user = profileInfoController.profileInfo.value;
        final localFile = controller.pickedImage.value;

        ImageProvider avatarImage;

        if (localFile != null) {
          // Local file picked
          avatarImage = FileImage(localFile);
        } else if (user?.profilePic != null && user!.profilePic!.isNotEmpty) {
          final pic = user.profilePic!;

          // Check if URL is Google full URL (starts with http)
          if (pic.startsWith("http")) {
            avatarImage = NetworkImage(pic);
          } else {
            // Backend relative path
            avatarImage = NetworkImage('${Urls.url}$pic');
          }
        } else {
          // Default avatar
          avatarImage = const AssetImage('assets/icon/avatar.png');
        }

        return CircleAvatar(
          backgroundColor: const Color(0xFF1E3A8A).withAlpha(10),
          radius: 40,
          backgroundImage: avatarImage,
        );
      }),
    ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx((){
              final user = profileInfoController.profileInfo.value;
              return Row(
                children: [
                  Stack(
                    children: [
                  Obx(() {
                final picked = controller.pickedImage.value;
                final pic = user?.profilePic;

                ImageProvider avatarImage;

                if (picked != null) {
                  avatarImage = FileImage(picked);
                }
                else if (pic != null && pic.isNotEmpty) {

                  // If full URL (Google, Facebook or any http)
                  if (pic.startsWith("http")) {
                    avatarImage = NetworkImage(pic);
                  }
                  // If backend relative path
                  else {
                    avatarImage = NetworkImage('${Urls.url}$pic');
                  }

                }
                else {
                  avatarImage = const AssetImage('assets/icon/avatar.png');
                }

                return GestureDetector(
                  onTap: () {
                    _openBottomSheet(context);
                  },
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: avatarImage,
                  ),
                );
              }),
                      Positioned(
                        bottom: 0,
                        right: -5,
                        child: GestureDetector(
                          onTap: () {
                            _openBottomSheet(context);
                          },
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: Image.asset("assets/icon/edit.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.fullName ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        Text(
                          user?.email ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        Text(
                          user?.city ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.transparent, width: 1),
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
                    label: 'Edit Profile',
                    image: "assets/icon/edit2.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.SEEKERS_EDIT_PROFILE_SCREEN);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
/*                  ProfileInfoItem(
                    label: 'Cv Upload',
                    image: "assets/icon/upload.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.AUTH_UPLOAD_RESUME);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),*/
                  ProfileInfoItem(
                    label: 'Favourite',
                    image: "assets/icon/love.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.SEEKERS_SAVED_JOBS);
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
/*                  ProfileInfoItem(
                    label: 'Notifications',
                    image: "assets/icon/notification.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      Get.toNamed(Routes.SEEKERS_NOTIFICATION_SCREEN);
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),*/
                  ProfileInfoItem(
                    label: 'Privacy Policy',
                    image: "assets/icon/privacy.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      Get.to(() => PrivacyPolicyScreen());
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),
/*                  ProfileInfoItem(
                    label: 'Delete my data',
                    image: "assets/icon/delete.png",
                    imageIcon: "assets/icon/arrow.png",
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.h),
                    child: Divider(color: Color(0xffF3F4F6), thickness: 1),
                  ),*/
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _showSuccessDialog(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon/logout.png",
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
                          "assets/icon/arrow.png",
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

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Change Logo Company",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () async {
                  Get.back();
                  await controller.pickImage();
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A1A).withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/icon/file1.png"),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "From Gallery",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icon/logout.png",
                width: 30.w,
                height: 30.h,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              Text(
                "Logout!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
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
                    onPressed: ()async {
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icon/delets.png",
                width: 30.w,
                height: 30.h,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              Text(
                "Delete my data!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Are you sure you want to data Delete from the application?!",
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
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text("Yes, Delete"),
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
          // Right part: value + action icon
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
