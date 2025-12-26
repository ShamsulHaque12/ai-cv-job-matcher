import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../common/custom_button.dart';
import '../../application_detail_screens/views/application_detail_screens_view.dart';
import '../../application_detail_screens/views/pending_screen.dart';
import '../../application_detail_screens/views/rejected_screen.dart';
import '../controllers/seekers_applications_screen_controller.dart';

class SeekersApplicationsScreenView
    extends GetView<SeekersApplicationsScreenController> {
  SeekersApplicationsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Applications")),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Search by title",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 15.h),

            // Filter Tabs
            SizedBox(
              height: 35.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterButton("all", "All Post"),
                  SizedBox(width: 8.w),
                  _buildFilterButton("Pending", "Pending"),
                  SizedBox(width: 8.w),
                  _buildFilterButton("Rejected", "Rejected"),
                  SizedBox(width: 8.w),
                  _buildFilterButton("Selected", "Interview"),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            // List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.filteredApplications.isEmpty) {
                  return Center(
                    child: Text(
                      'No applications found',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemCount: controller.filteredApplications.length,
                  itemBuilder: (context, index) {
                    final application = controller.filteredApplications[index];

                    return GestureDetector(
                      onTap: (){
                      Get.toNamed(Routes.APPLICATION_DETAIL_SCREENS,arguments: application);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey.withOpacity(.3)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Company Logo
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child:
                              application.logo != null &&
                                  application.logo!.isNotEmpty
                                  ? Image.network(
                                '${Urls.url}${application.logo}',
                                width: 60.w,
                                height: 70.w,
                                fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/default_image.jpg',
                                      width: 50.w,
                                      height: 50.w,
                                      fit: BoxFit.cover,
                                    );
                                  }
                              ): Image.asset(
                                'assets/images/find_jobs.png',
                                width: 60.w,
                                height: 70.w,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(width: 12.w),

                            /// Job Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    application.position ?? "Unknown Position",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    application.companyName ?? "Unknown Company",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),

                                  /// Status
                                  Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: controller.getStatusColor(
                                          application.status ?? ''),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      application.status ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String filterValue, String label) {
    return Obx(() {
      final isSelected = controller.selectedFilter.value == filterValue;
      return GestureDetector(
        onTap: () => controller.applyFilter(filterValue),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
            ),
          ),
        ),
      );
    });
  }
}
