import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme/app_colors.dart';
import '../controllers/onboarding_screen_controller.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              controller.selectedPageIndex.value = value;
              debugPrint(value.toString());
            },
            children: [Onboarding1(), Onboarding2()],
          ),
          Positioned(
            left: 152.w,
            bottom: 115.h,
            child: Obx(
                  () => AnimatedSmoothIndicator(
                activeIndex: controller.selectedPageIndex.value,
                count: 2,
                effect: WormEffect(
                  dotColor: Color(0xff1E3A8A).withAlpha(30),
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 15.h,
                  dotWidth: 15.w,
                    spacing: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
