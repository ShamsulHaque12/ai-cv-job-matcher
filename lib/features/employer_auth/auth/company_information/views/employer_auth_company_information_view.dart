
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobly_ai/features/theme/image_path.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/leading_button_app_bar.dart';
import '../../../../common/sign_up_title_small.dart';
import '../controllers/employer_auth_company_information_controller.dart';

class EmployerAuthCompanyInformationView
    extends GetView<EmployerAuthCompanyInformationController> {
  const EmployerAuthCompanyInformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: SafeArea(
            child: LeadingButtonAppbar(text: 'Edit Company Profile'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company Information',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff101010),
                ),
              ),

              Center(
                child: Obx(() {
                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: controller.selectedImage.value != null
                            ? FileImage(controller.selectedImage.value!)
                            : Image.asset(ImagePath.profileIcone).image,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -5,
                        child: GestureDetector(
                          onTap: () => _openBottomSheet(context),
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: Image.asset(ImagePath.editColor),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),

              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Company name'),
              SizedBox(height: 12.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter company name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: controller.companyNameController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Industry Type'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Your Industry'),
                controller: controller.industryController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Company Role'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter company role'),
                controller: controller.roleController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Zip code'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter zip code'),
                controller: controller.zipCodeController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Website'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter website'),
                controller: controller.websiteController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Phone number'),
              SizedBox(height: 10.h),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'Enter phone number'),
                controller: controller.phoneController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Email'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter email'),
                controller: controller.emailController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Company Country/Region'),
              SizedBox(height: 10.h),
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
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Address'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter address'),
                controller: controller.addressController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Enter State'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'your state'),
                controller: controller.stateController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Enter City'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'your City'),
                controller: controller.cityController,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Description'),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Description'),
                controller: controller.descriptionController,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              Obx(() {
                return controller.isLoading.value
                    ? Center(
                        child: SpinKitWave(color: Colors.green, size: 40.0),
                      )
                    : CustomButton(
                        text: 'Continue',
                        onTap: () async {
                          controller.isLoading.value = true;

                          try {
                            await controller.createCompany();
                            await controller.uploadLogo();
                          } catch (e) {
                            debugPrint("Error: $e");
                          }
                        },
                      );
              }),
            ],
          ),
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
                  child: Image.asset(ImagePath.fileIcone),
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
