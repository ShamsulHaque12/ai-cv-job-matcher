import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/edit_employer_profile_controller.dart';

class EditEmployerProfileView extends GetView<EditEmployerProfileController> {
  const EditEmployerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Edit Profile")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(() {
                return Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: controller.selectedImage.value != null
                          ? FileImage(controller.selectedImage.value!)
                          : Image.asset("assets/icon/profile.png").image,
                    ),
                    Positioned(
                      bottom: 0,
                      right: -5,
                      child: GestureDetector(
                        onTap: () => _openBottomSheet(context),
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset("assets/icon/edit.png"),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              titleText: "Name*",
              textEditingController: controller.nameController,
              hintText: "Enter Name",
            ),
            SizedBox(height: 7.h),
            CustomTextField(
              titleText: "Company Email*",
              textEditingController: controller.emailController,
              hintText: "xyz@gmail.com",
              suffixIcon: Icon(Icons.email_outlined),
            ),
            // SizedBox(height: 6.h),
            // Text(
            //   "Established date*",
            //   style: GoogleFonts.inter(
            //       fontWeight: FontWeight.w600, fontSize: 16.sp),
            // ),
            // SizedBox(height: 5.h),
            // TextField(
            //   controller: controller.dateController,
            //   readOnly: true,
            //   onTap: () async {
            //     DateTime? pickedDate = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(1900),
            //       lastDate: DateTime(2100),
            //     );
            //
            //     if (pickedDate != null) {
            //       String formattedDate =
            //           "${pickedDate.day.toString().padLeft(2, '0')}/"
            //           "${pickedDate.month.toString().padLeft(2, '0')}/"
            //           "${pickedDate.year}";
            //       controller.dateController.text = formattedDate;
            //     }
            //   },
            //   decoration: InputDecoration(
            //     hintText: "00/00/0000",
            //     suffixIcon: Icon(Icons.date_range),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.r),
            //       borderSide: BorderSide(color: Colors.grey, width: 1.w),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.r),
            //       borderSide: BorderSide(color: Colors.grey, width: 1.w),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10.h),
            Text(
              "Country*",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            SizedBox(height: 5.h),
            TextField(
              controller: controller.countryController,
              readOnly: true,
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false,
                  onSelect: (Country country) {
                    controller.countryController.text = country.name;
                  },
                );
              },
              decoration: InputDecoration(
                hintText: "Select Country",
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              titleText: "Company Address*",
              textEditingController: controller.addressController,
              hintText: "Enter address",
            ),
            SizedBox(height: 20.h),
           Obx((){
             return controller.isLoading.value
                 ? Center(child: SpinKitWave(
               color: Colors.green,
               size: 40.r,
             ))
                 :  CustomButton(
               text: "Update",
               onTap: () {
                 controller.submitProfileSection();
               },
               backgroundColor: AppColors.primaryColor,
               textColor: Colors.white,
             );
           }),
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
}
