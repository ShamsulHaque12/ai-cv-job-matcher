import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final TextStyle interLargeTitle = GoogleFonts.inter(
    color: Color(0xff101010),
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle interSmallTitle = GoogleFonts.inter(
    color: Color(0xff4B5563),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle interAuthTitle = GoogleFonts.inter(
    color: AppColors.primarytextColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );
}
