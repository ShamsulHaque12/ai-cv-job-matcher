import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';

class featuresJobCard extends StatelessWidget {
  final Map<String, dynamic> featuresJob;
  final bool isFav;
  final VoidCallback onHeartTap;
  final VoidCallback onApply;

  const featuresJobCard({
    super.key,
    required this.featuresJob,
    required this.isFav,
    required this.onHeartTap,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    // Card width tuned to look like screenshot
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xff8E8DD0).withAlpha(16),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/post1.png',
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featuresJob['title'] ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff212121),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      featuresJob['company'] ?? '',
                      style: GoogleFonts.inter(
                        color: Color(0xff8A8894),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: onHeartTap,
                    child: SizedBox(
                      width: 28.w,
                      height: 28.h,
                      child: Center(
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav
                              ? AppColors.primaryColor
                              : Colors.grey[600],
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            featuresJob['salary'] ?? '',
            style: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14.sp,
                color: Color(0xff64748B),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  featuresJob['location'] ?? '',
                  style: TextStyle(
                    color: Color(0xff4B5563),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomButton(text: 'Apply Now', onTap: (){
            Get.toNamed(Routes.SEEKERS_JOB_DETAILS_SCREEN);
          }),
        ],
      ),
    );
  }
}
