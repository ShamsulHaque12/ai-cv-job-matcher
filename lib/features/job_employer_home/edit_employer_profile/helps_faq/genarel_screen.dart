import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/faq_screen_controller.dart';


class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FaqScreenController controller = Get.put(FaqScreenController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Obx(() => _FAQTile(
            question: 'What is DMVJOBS.ai?',
            answer: 'Gawean is greatest job portal platform in this century',
            isExpanded: controller.expandedIndex.value == 0,
            onTap: () => controller.toggleExpansion(0),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'How to use DMVJOBS.ai?',
            answer: 'You can browse jobs, apply for positions, and manage your profile easily through our platform.',
            isExpanded: controller.expandedIndex.value == 1,
            onTap: () => controller.toggleExpansion(1),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'Is DMVJOBS.ai is safe for me?',
            answer: 'Yes, DMVJOBS.ai uses industry-standard security measures to protect your personal information.',
            isExpanded: controller.expandedIndex.value == 2,
            onTap: () => controller.toggleExpansion(2),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'How to apply a job on DMVJOBS.ai?',
            answer: 'Simply browse available jobs, click on the position you are interested in, and click the apply button.',
            isExpanded: controller.expandedIndex.value == 3,
            onTap: () => controller.toggleExpansion(3),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'How to logout from DMVJOBS.ai?',
            answer: 'Go to your profile settings and click on the logout button at the bottom of the page.',
            isExpanded: controller.expandedIndex.value == 4,
            onTap: () => controller.toggleExpansion(4),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'Is there a tips for get a better job?',
            answer: 'Keep your profile updated, tailor your resume to each job, and apply early to increase your chances.',
            isExpanded: controller.expandedIndex.value == 5,
            onTap: () => controller.toggleExpansion(5),
          )),
          SizedBox(height: 12.h),
          Obx(() => _FAQTile(
            question: 'Is DMVJOBS.ai free to use?',
            answer: 'Yes, DMVJOBS.ai is completely free for job seekers to browse and apply for jobs.',
            isExpanded: controller.expandedIndex.value == 6,
            onTap: () => controller.toggleExpansion(6),
          )),
        ],
      ),
    );
  }
}

class _FAQTile extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FAQTile({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: SizedBox.shrink(),
            secondChild: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF4B5563),
                    height: 1.5,
                  ),
                ),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}