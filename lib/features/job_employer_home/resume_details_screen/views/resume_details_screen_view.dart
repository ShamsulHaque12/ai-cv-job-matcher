import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/resume_details_screen_controller.dart';

class ResumeDetailsScreenView extends GetView<ResumeDetailsScreenController> {
  ResumeDetailsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final seeker = args['seeker'];
    final job = args['job'];
    final candidateId = args['candidate'];
    debugPrint("Candidate ID: $candidateId");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Resume Details")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: seeker?.profilePic != null
                              ? NetworkImage("${Urls.url}${seeker.profilePic}")
                              : const AssetImage(
                                      "assets/images/profile_placeholder.png",
                                    )
                                    as ImageProvider,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${seeker?.firstName ?? ''} ${seeker?.lastName ?? ''}",
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              job?.title ?? 'N/A',
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: Colors.grey, thickness: 1),
                    SizedBox(height: 5.h),
                    // See Resume Button
                    CustomButton(
                      onTap: () {
                        Get.toNamed(Routes.SHOW_RESUME_SCREEN);
                      },
                      text: "See Resume",
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 10.h),
                    // Job Status Dropdown
                    Text(
                      "Select Job Status*",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("Select Job Status"),
                        value: controller.statusController.value.isEmpty
                            ? null
                            : controller.statusController.value,
                        items: ["PENDING", "REJECTED", "SELECTED"]
                            .map(
                              (status) => DropdownMenuItem<String>(
                                value: status,
                                child: Text(status),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.statusController.value = value ?? '';
                          controller.isInterviewSelected.value =
                              value == "SELECTED";
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Calendar & Time Row
                    if (controller.isInterviewSelected.value)
                      Column(
                        children: [
                          CustomTextField(
                            controllerTag: "level",
                            hintText: "Interview type",
                            isDropdown: true,
                            dropdownItems: [
                              "GOOGLE_MEET",
                              "ZOOM",
                              "TEAMS",
                              "SKYPE",
                              "OTHER",
                            ],
                            textEditingController:
                                controller.platfromController,
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Calendar
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    );
                                    if (picked != null) {
                                      controller.selectedDate.value =
                                          "${picked.day}-${picked.month}-${picked.year}";
                                    }
                                  },
                                  child: Container(
                                    width: 150.w,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.selectedDate.value.isEmpty
                                              ? "Select Date"
                                              : controller.selectedDate.value,
                                        ),
                                        Icon(Icons.calendar_today_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              // Time
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    TimeOfDay? picked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      controller.selectedTime.value = picked
                                          .format(context);
                                    }
                                  },
                                  child: Container(
                                    width: 150.w,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.selectedTime.value.isEmpty
                                              ? "Select Time"
                                              : controller.selectedTime.value,
                                        ),
                                        Icon(Icons.access_time_filled),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            textEditingController: controller.linkController,
                            hintText: "Link",
                          ),
                          // Message Field
                          Text(
                            "Message*",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          TextFormField(
                            controller: controller.textController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: "Enter Message",
                              hintStyle: GoogleFonts.inter(color: Colors.grey),
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return controller.isLoading.value
                          ? Center(
                              child: SpinKitWave(
                                color: Colors.green,
                                size: 40.0,
                              ),
                            )
                          : CustomButton(
                              onTap: () {
                                controller.sendApplicationByUser();
                              },
                              text: "Send to Applicants",
                              backgroundColor: AppColors.primaryColor,
                              textColor: Colors.white,
                            );
                    }),
                    SizedBox(height: 15),
                    Obx(() {
                      return controller.isLoading.value
                          ? Center(
                              child: SpinKitWave(
                                color: Colors.green,
                                size: 40.0,
                              ),
                            )
                          : CustomButton(
                              onTap: () {
                                controller.rejectApplications();
                              },
                              text: "Pending & Rejected",
                              backgroundColor: AppColors.primaryColor,
                              textColor: Colors.white,
                            );
                    }),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
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
              Lottie.asset("assets/icon/success.json"),
              SizedBox(height: 5.h),
              Text(
                "Success!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Message sent successfully!",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
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
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
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
              Lottie.asset("assets/icon/success.json"),
              SizedBox(height: 5.h),
              Text(
                "Success!",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Message sent successfully!",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
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
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }
}
