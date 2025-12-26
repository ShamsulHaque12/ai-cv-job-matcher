import 'package:get/get.dart';

class JobSeekersJobFilterScreenController extends GetxController {
  final RxString selectedEmployment = ''.obs;
  final RxString selectedWork = ''.obs;
  final RxString selectedCareer = ''.obs;
  final RxString selectedSalery = ''.obs;
  final RxString selectedSFlexibility = ''.obs;
  final RxString selectedSpecailOporinity = ''.obs;

  final employmentTypes = [
    "All Type",
    "Full-time",
    "Part-time",
    "Temporary",
    "Contractual",
    "Freelance",
    "Internship"
  ];

  final workArrangements = ["Remote", "Hybrid", "On-Site"];

  final careerLevels = [
    "Entry-Level",
    "Mid-Level",
    "Senior-Level",
    "Director",
    "Student"
  ];
  final salleryRange = [
    "10k-20k",
    "20k-40k",
    "40k-50k",
    "50k-60k",
    "60k-70k"
  ];
  final jobTypes = [
    "Technology & IT",
    "Healthcare",
    "Education",
    "Creative",
    "Customer Service",
    "Retail & Sales"
  ];
  final flexibility = [
    "Flexible Hours",
    "Shift Work",
    "Weekend Only",
    "Night Shift",
  ];
  final specailOporinity = [
    "Volunteer",
    "Returnship",
    "Diversity & Inclusion Programs",
  ];
}
