import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class TextformTitle extends StatelessWidget {
  const TextformTitle({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: GoogleFonts.epilogue(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primarytextColor,
      ),
    );
  }
}