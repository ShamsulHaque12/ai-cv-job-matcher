import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/api_endpoints.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../job_home_employer_screen/controllers/job_home_seker_screen_controller.dart';
import '../controllers/show_resume_screen_controller.dart';

class ShowResumeScreenView extends GetView<ShowResumeScreenController> {
  final JobHomeSekerScreenController jobHomeSekerScreenController = Get.put(
    JobHomeSekerScreenController(),
  );
  ShowResumeScreenView({super.key});

  Widget title(String text) => Text(
    text,
    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  );

  Widget value(String? text) => Text(
    text ?? "Not available",
    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
  );

  Widget space() => SizedBox(height: 10.h);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Show Profile")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          if (jobHomeSekerScreenController.isLoading.value) {
            return Center(child: SpinKitWave(color: Colors.green, size: 40));
          }

          if (jobHomeSekerScreenController.showMeProfile.value == null) {
            return const Center(child: Text("No Profile Data Found"));
          }

          final profileData = jobHomeSekerScreenController.showMeProfile.value!;
          final p = profileData.profile; // shortcut

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- PROFILE HEADER ----------------
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: profileData.profilePic != null
                        ? NetworkImage("${Urls.url}${profileData.profilePic!}")
                        : const AssetImage("assets/images/default_profile.png")
                    as ImageProvider,
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileData.fullName ??
                              "${profileData.firstName} ${profileData.lastName}",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        space(),
                        value(profileData.email),
                        value(profileData.phone),
                      ],
                    ),
                  ),
                ],
              ),
              space(),
              Divider(),

              // ---------------- JOB TITLE ----------------
              if (p != null) ...[
                title("Job Title"),
                space(),
                value(p.jobTitle),
                space(),

                // ---------------- CURRENT SALARY ----------------
                title("Current Salary"),
                space(),
                value(p.presentSalary != null
                    ? "\$${p.presentSalary}"
                    : "Not specified"),
                space(),

                // ---------------- EXPECTED SALARY ----------------
                title("Expected Salary"),
                space(),
                value(p.expectedSalary != null
                    ? "\$${p.expectedSalary}"
                    : "Not specified"),
                space(),
                Divider(),
              ],

              // ---------------- ADDRESS SECTION ----------------
              if (p != null) ...[
                title("Address"),
                space(),
                value(p.address),
                space(),

                title("City"),
                space(),
                value(p.city),
                space(),

                title("State"),
                space(),
                value(p.state),
                space(),

                Divider(),
              ],

              // ---------------- ABOUT ME ----------------
              if (p?.aboutMe != null && p!.aboutMe!.isNotEmpty) ...[
                title("About Me"),
                space(),
                value(p.aboutMe),
                space(),
                Divider(),
              ],

              // ---------------- JOB DESCRIPTION ----------------
              if (p?.jobDescription != null &&
                  p!.jobDescription!.isNotEmpty) ...[
                title("Job Description"),
                space(),
                value(p.jobDescription),
                space(),
                Divider(),
              ],

              // ---------------- PHONE NUMBER ----------------
              if (p?.phoneNumber != null) ...[
                title("Phone Number"),
                space(),
                value(p!.phoneNumber),
                space(),
                Divider(),
              ],

              // ---------------- EDUCATION ----------------
              if (p?.education != null && p!.education!.isNotEmpty) ...[
                title("Education"),
                SizedBox(height: 10.h),
                Column(
                  children: p.education!.map((edu) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          value("${edu.degree} - ${edu.institution}"),
                          Text(
                            "${edu.startYear ?? ""} - ${edu.endYear ?? ""}",
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.black54),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Divider(),
              ],

              // ---------------- CERTIFICATIONS ----------------
              if (p?.certifications != null &&
                  p!.certifications!.isNotEmpty) ...[
                title("Certifications"),
                SizedBox(height: 10.h),
                Column(
                  children: p.certifications!.map((cert) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: value("${cert.title} - ${cert.issuer} (${cert.year})"),
                    );
                  }).toList(),
                ),
                Divider(),
              ],

              // ---------------- SKILLS ----------------
              if (p?.skills != null && p!.skills!.isNotEmpty) ...[
                title("Skills"),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 5.h,
                  children: p.skills!.map((skill) {
                    return Chip(
                      label: Text(skill),
                      backgroundColor: Colors.blue.shade100,
                    );
                  }).toList(),
                ),
                Divider(),
              ],

              // ---------------- LANGUAGES ----------------
              if (p?.languages != null && p!.languages!.isNotEmpty) ...[
                title("Languages"),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 5.h,
                  children: p.languages!.map((lang) {
                    return Chip(
                      label: Text(lang),
                      backgroundColor: Colors.green.shade100,
                    );
                  }).toList(),
                ),
                Divider(),
              ],

              // ---------------- SOCIAL LINKS ----------------
              if (p?.socialMedia != null && p!.socialMedia!.isNotEmpty) ...[
                title("Social Media"),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: p.socialMedia!.map((social) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        value("${social.linkType}: ${social.url}"),
                        SizedBox(height: 5.h),
                      ],
                    );
                  }).toList(),
                ),
              ],
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}
