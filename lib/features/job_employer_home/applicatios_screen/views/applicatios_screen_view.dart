import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../all_active_screen/views/all_active_screen_view.dart';
import '../../all_inactive_screen/views/all_inactive_screen_view.dart';
import '../../all_post_screen/views/all_post_screen_view.dart';
import '../../edit_employer_profile/controllers/edit_employer_profile_controller.dart';
import '../controllers/applicatios_screen_controller.dart';

class ApplicatiosScreenView extends GetView<ApplicatiosScreenController> {
  ApplicatiosScreenView({super.key});
  final EditEmployerProfileController editEmployerProfileController = Get.put(
    EditEmployerProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Obx(() {
            final String profilePic =
                editEmployerProfileController.showMe.value?.data
                    ?.profilePic ??
                    '';

            final String imageUrl = profilePic.isNotEmpty
                ? '${Urls.url}$profilePic'
                : '';

            return CircleAvatar(
              radius: 30.r,
              backgroundImage: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : const AssetImage("assets/images/post1.png")
              as ImageProvider,
              onBackgroundImageError: (_, __) {},
            );
          }),
        ),
        title: Text(
          "Applications",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  final jobs = controller.filteredJobs;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return ListTile(
                        title: Text(job.title ?? 'N/A'),
                        subtitle: Text("${job.user?.firstName ?? ''} ${job.user?.lastName ?? ''}"),
                      );
                    },
                  );
                }),
              ],
            ),
            SizedBox(height: 15.h),

            // Custom Filter Buttons
            Obx(
              () => Row(
                children: [
                  _buildFilterButton(
                    label: 'All Post',
                    isSelected: controller.selectedFilter.value == 'all',
                    onTap: () => controller.selectedFilter.value = 'all',
                  ),
                  SizedBox(width: 5.w),
                  _buildFilterButton(
                    label: 'Active',
                    isSelected: controller.selectedFilter.value == 'active',
                    onTap: () => controller.selectedFilter.value = 'active',
                  ),
                  SizedBox(width: 5.w),
                  _buildFilterButton(
                    label: 'Inactive',
                    isSelected: controller.selectedFilter.value == 'inactive',
                    onTap: () => controller.selectedFilter.value = 'inactive',
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            // Content based on selected filter
            Obx(() {
              return SizedBox(
                height: height * 0.55,
                child: _buildContent(controller.selectedFilter.value),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: CustomButton(
          text: "Add New Post",
          onTap: () => Get.toNamed(Routes.ADD_NEW_VACANCY),
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E3A8A) : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: const Color(0xFF1E3A8A), width: 2),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF1E3A8A),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String filter) {
    switch (filter) {
      case 'all':
        return AllPostScreenView();
      case 'active':
        return AllActiveScreenView();
      case 'inactive':
        return AllInactiveScreenView();
      default:
        return _buildEmptyState("No vacancies found");
    }
  }

  Widget _buildEmptyState(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
