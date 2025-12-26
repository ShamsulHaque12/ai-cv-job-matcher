import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import '../../../auth/upload_resume/widget/certification_contrller.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../controllers/seekers_edit_profile_screen_controller.dart';

class SeekersEditProfileScreenView
    extends GetView<SeekersEditProfileScreenController> {
   SeekersEditProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Obx((){
          if(controller.isLoading.value){
            return Center(child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: 50.sp,
              duration: Duration(seconds: 3),
            ));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main fields
              _buildTextField('Email', controller.emailController),
              _buildTextField('Phone', controller.phoneController),
              _buildTextField('Address', controller.addressController),
              _buildTextField('Country/Region', controller.countryRegionController),
              _buildTextField('City', controller.cityController),
              _buildTextField('State', controller.stateController),
              _buildTextField('Zip Code', controller.zipCodeController),
              _buildTextField('Designation', controller.designationController),
              _buildTextField('Profile Info', controller.profileInfoController, maxLines: 4),
              _buildTextField('About Me', controller.aboutMe, maxLines: 3),
              SizedBox(height: 12.h),
              _buildTextField('Present Salary', controller.presentSalary),
              _buildTextField('Expected alary', controller.expectedSalary),
              SizedBox(height: 12.h),
              Text('Certifications'),
              SizedBox(height: 12.h),
              Obx(() => Column(
                children: [
                  ...controller.certificationControllers.map((cert) => Column(
                    children: [
                      _buildTextField('Title', cert.titleController),
                      _buildTextField('Issuer', cert.issuerController),
                      _buildTextField('Year', cert.yearController),
                      Divider(),
                    ],
                  )),
                  CustomButton(
                    text: 'Add Certification',
                    onTap: () => controller.certificationControllers.add(CertificationController()),
                    width: 200.w,
                    suffixIcon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              )),
              SizedBox(height: 12.h),
              Text('Skills'),
              Obx(() => Column(
                children: [
                  ...controller.skillControllers.map((c) => _buildTextField('', c)),
                  CustomButton(
                    text: 'Add Skill',
                    onTap: () => controller.skillControllers.add(TextEditingController()),
                    width: 190.w,
                    suffixIcon: Icon(Icons.add,color: Colors.white),
                  ),
                ],
              )),

              SizedBox(height: 12.h),
              Text('Languages'),
              Obx(() => Column(
                children: [
                  ...controller.languageControllers.map((c) => _buildTextField('', c)),
                  CustomButton(
                    text: 'Add Language',
                    onTap: () => controller.languageControllers.add(TextEditingController()),
                    width: 190.w,
                    suffixIcon: Icon(Icons.add,color: Colors.white),
                  ),
                ],
              )),

              SizedBox(height: 12.h),
              Text('Education'),
              SizedBox(height: 12.h),
              Obx(() => Column(
                children: controller.educationControllers.map((edu) => Column(
                  children: [
                    _buildTextField('Institution', edu.institutionController),
                    _buildTextField('Degree', edu.degreeController),
                    _buildTextField('Start Date', edu.startController),
                    _buildTextField('End Date', edu.endController),
                    Divider(),
                  ],
                )).toList(),
              )),

              SizedBox(height: 12.h),
              Text('Experience'),
              Obx(() => Column(
                children: controller.experienceControllers.map((exp) => Column(
                  children: [
                    _buildTextField('Company', exp.companyController),
                    _buildTextField('Designation', exp.designationController),
                    _buildTextField('Details', exp.detailsController, maxLines: 3),
                    _buildTextField('Start Date', exp.startController),
                    _buildTextField('End Date', exp.endController),
                    Divider(),
                  ],
                )).toList(),
              )),

              SizedBox(height: 12.h),
              Text('socialMedia'),
              SizedBox(height: 8.h,),
              Obx(() => Column(
                children: controller.otherLinkControllers.map((link) => Column(
                  children: [
                    _buildTextField('Link Type', link.linkTypeController),
                    _buildTextField('URL', link.urlController),
                    Divider(),
                  ],
                )).toList(),
              )),

              SizedBox(height: 20),
              Obx((){
                if(controller.isSubmitButton.value) {
                  return Center(child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.sp,
                    duration: Duration(seconds: 3),
                  ));
                }
                return CustomButton(
                  text: 'Submit',
                  onTap: ()async {
                     controller.updateMYProfile();
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
