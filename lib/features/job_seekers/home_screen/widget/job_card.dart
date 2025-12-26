import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';

class JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final bool isFav;
  final VoidCallback onHeartTap;
  final VoidCallback onApply;

  const JobCard({
    super.key,
    required this.job,
    required this.isFav,
    required this.onHeartTap,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    // Card width tuned to look like screenshot
    return SizedBox(
      width: 282.w,
      child: Stack(
        children: [
          // Card
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow:  [
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
                // Row with logo and title/company
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo circle
                    Image.asset(
                      'assets/images/post1.png',
                      width: 50.w,
                    ),
                    const SizedBox(width: 12),
                    // Title & Company
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job['title'] ?? '',
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff212121)
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            job['company'] ?? '',
                            style: GoogleFonts.inter(
                                color: Color(0xff8A8894),
                                fontSize: 12.sp
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),

                SizedBox(height: 12.h),

                // Salary
                Text(
                  job['salary'] ?? '',
                  style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),

                const SizedBox(height: 8),

                // Location row (icon + text)
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
                        job['location'] ?? '',
                        style:
                        TextStyle(
                            color: Color(0xff4B5563),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),
                CustomButton(text: 'Apply Now',onTap: onApply,)
              ],
            ),
          ),

          // Heart icon top-right
          Positioned(
            right: 15,
            top: 15,
            child: InkWell(
              onTap: onHeartTap,
              child: SizedBox(
                width: 28.w,
                height: 28.h,
                child: Center(
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? AppColors.primaryColor : Colors.grey[600],
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}