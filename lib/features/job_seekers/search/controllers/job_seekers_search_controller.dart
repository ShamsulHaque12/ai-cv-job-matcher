import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../job_filter_screen/controllers/job_seekers_job_filter_screen_controller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../model/search_categories_model.dart';
import '../model/search_model.dart';

class JobSeekersSearchController extends GetxController {
  final jobFilterIsloading = false.obs;
  final jobfilter = Get.find<JobSeekersJobFilterScreenController>();
  var suggestions = <String>[].obs;
  var filteredJobs = <SearchModel>[].obs;
  final jobs = <SearchModel>[].obs;
  final hasMore = false.obs;
  int currentPage = 1;
  int jobCurrentPage = 1;
  //// search filter
  // Selected filters
  final RxString selectedEmployment = ''.obs;
  final RxString selectedWork = ''.obs;
  final RxString selectedCareer = ''.obs;
  final RxString selectedSalery = ''.obs;
  final RxString selectedIndustry = ''.obs;
  final RxString selectedFlexibility = ''.obs;
  final RxString selectedSpecialOpportunity = ''.obs;
  final RxString selectedLocation = 'f'.obs;
  final scrollController = ScrollController();
  // Dropdown items
  final jobCategories = <SearchCategoriesModel>[];
  final employmentTypes = ["Remote", "Hybrid", "On-Site"];
/*
  final workArrangements = [
    "Fulltime",
    "Parttime",
    "Temporary",
    "Contract",
    "Freelance",
    "Intern",
  ];

  final careerLevels = [
    "Intern",
    "Entrylevel",
    "Midlavel",
    "Seniorlevel",
    "Management",
    "Executive",
  ];

  final salaryRange = ["Hourly", "Daily", "Weekly", "Monthly", "Yearly"];
  final industry = [
    "Industryandit",
    "Eduaction",
    "Healthcare",
    "Creative",
    "Finance",
    "Marketing",
    "Retailsandsales",
    "Customerservice",
    "Transportation",
    "Engineering",
    "Hospitality",
    "Construction",
    "Other",
  ];
  final flexibility = [
    "FlexibleHours",
    "Shiftwork",
    "Compressedweek",
    "Jobsharing",
    "Remotework",
    "Nightshift",
    "Weekendwork",
  ];*/

  @override
  void onInit() {
    super.onInit();
    fetchAllJobCategories();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        searchFilterJobs();
        fetchJobsFromApi();
      }
    });
    fetchJobsFromApi();
  }

  // fetch all job categories
  Future<void> fetchAllJobCategories() async {
    try {
      NetworkResponse response = await NetworkCaller().getRequest(
        url: Urls.allJobCategoriesFind,
      );
      if (response.isSuccess) {
        final dataList = response.responseData?["data"];
        if (dataList != null) {
          jobCategories.clear();
          jobCategories.add(SearchCategoriesModel.fromJson(dataList));
          print("Total categories: ${jobCategories.length}");
          print("First category industries: ${jobCategories[0].jobIndustries}");
        }
      } else {
        Get.snackbar("Error", "Failed to fetch jobs");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // favorite screen job save
  Future<void> saveJobs(jobId) async {
    try {
      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.saveJobs,
        body: {"jobId": jobId},
      );
      if (response.isSuccess) {
        final favoriteJobsController = Get.find<SeekersSavedJobsController>();
        await favoriteJobsController.getSavedJobs();
      } else {
        throw "Save failed";
        // showSnackBar(false, 'Save Failed');
      }
    } catch (e) {
      print("JOB SAVE UNSUCCESSFUL: ${e.toString()}");
      // showSnackBar(false, 'Job Save Unsuccessful');
    }
  }

  Future<void> fetchJobsFromApi() async {
    try {
      NetworkResponse response = await NetworkCaller().getRequest(
        url: Urls.searchFilterData,
        queryParams: {"page": currentPage, "limit": 10},
      );
      if (response.isSuccess) {
        final dataList = response.responseData?["data"]["data"] as List;

        if (dataList.isEmpty) {
          hasMore.value = false;
        } else {
          final jobList = dataList
              .map((job) => SearchModel.fromJson(job))
              .toList();
          for (var job in jobList) {
            if (!jobs.any((j) => j.id == job.id)) {
              jobs.add(job);
            }
          }
          currentPage++;
        }
      } else {
        Get.snackbar("Error", "Failed to fetch jobs");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> searchFilterJobs() async {
    try {
      jobFilterIsloading.value = true;
      jobCurrentPage = 1;
      jobs.clear();
      filteredJobs.clear();

      // Optional query params handle
      Map<String, String> queryParams = {
        "page": jobCurrentPage.toString(),
        "limit": "10",
      };

      if (selectedEmployment.value.isNotEmpty) {
        queryParams["jobType"] = selectedEmployment.value.toLowerCase();
      }

      if (selectedWork.value.isNotEmpty) {
        queryParams["workArragement"] = selectedWork.value.toUpperCase();
      }

      if (selectedCareer.value.isNotEmpty) {
        queryParams["careerLevel"] = selectedCareer.value.toUpperCase();
      }

      if (selectedSalery.value.isNotEmpty) {
        queryParams["salaryType"] = selectedSalery.value.toLowerCase();
      }

      if (selectedIndustry.value.isNotEmpty) {
        queryParams["jobIndustry"] = selectedIndustry.value.toUpperCase();
      }

      if (selectedFlexibility.isNotEmpty) {
        queryParams["jobFlexibility"] = selectedFlexibility.value.toUpperCase();
      }

      if (selectedLocation.value.isNotEmpty) {
        queryParams["location"] = selectedLocation.value;
      }
      // API call
      NetworkResponse response = await NetworkCaller().getRequest(
        url: Urls.searchFilterData,
        queryParams: queryParams,
      );

      if (response.isSuccess) {
        final dataList = response.responseData?["data"]["data"] as List;
        if (dataList.isEmpty) {
          hasMore.value = false;
        } else {
          final jobList = dataList
              .map((job) => SearchModel.fromJson(job))
              .toList();
          for (var job in jobList) {
            if (!jobs.any((j) => j.id == job.id)) {
              filteredJobs.add(job);
            }
          }
          jobCurrentPage++;
        }
      } else {
        /*Get.snackbar(
          "Error",
          response.responseData?["message"] ?? "Something went wrong",
        );*/
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      jobFilterIsloading.value = false;
    }
  }

  /// ---------------------- SEARCH + SUGGESTION ----------------------

  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty) {
        fetchSuggestions(query);
      } else {
        // initial state: show nothing
        suggestions.clear();
        filteredJobs.clear();
      }
    });
  }

  void fetchSuggestions(String query) {
    if (query.isEmpty) {
      suggestions.clear();
      filteredJobs.clear();
      return;
    }

    final lowerQuery = query.toLowerCase();

    final matchedJobs = jobs.where((job) {
      final title = (job.title ?? '').toLowerCase();
      int commonLength = 0;

      // matching characters count
      for (int i = 0; i < title.length && i < lowerQuery.length; i++) {
        if (title[i] == lowerQuery[i]) commonLength++;
      }

      // 50% match condition
      return commonLength >= (lowerQuery.length / 2);
    }).toList();

    // suggestion list
    suggestions.assignAll(matchedJobs.map((job) => job.title ?? '').toList());
  }

  void onSuggestionTap(String value) {
    final result = jobs.where((job) {
      final title = (job.title ?? '').toLowerCase();
      return title.contains(value.toLowerCase());
    }).toList();

    filteredJobs.assignAll(result);

    // hide suggestions
    suggestions.clear();
  }

  void toggleFavorite(BuildContext context) {
    showModalBottomSheet(
      barrierColor: Color(0xff1E3A8A).withAlpha(128),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
      ),
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 70.h,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  /// ✅ This Job Info will show in bottomsheet
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employment Type",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Obx(() {
                          if (jobCategories.isEmpty) {
                            return Text("No Employment categories found");
                          }
                          final types = jobCategories[0].jobTypes ?? [];
                          return Wrap(
                            spacing: 5,
                            children: types.map((type) {
                              return ChoiceChip(
                                label: Text(
                                  type.name ?? '',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: selectedEmployment.value == type.name
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  ),
                                ),
                                selected: selectedEmployment.value == (type.name ?? ""),
                                onSelected: (_) {
                                  selectedEmployment.value =
                                  selectedEmployment.value == (type.name ?? "") ? "" : (type.name ?? "");
                                },
                                backgroundColor: Colors.white,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                selectedColor: AppColors.primaryColor,
                              );
                            }).toList(),
                          );
                        }),
                        const SizedBox(height: 20),

                        Text(
                          "Work Arrangement",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        Obx(
                          () {
                            if (jobCategories.isEmpty) {
                              return Text("No Work Arrangements found");
                            }
                            final workArrangements = jobCategories[0].workArrangements ?? [];
                              return Wrap(
                                spacing: 8,
                                children: workArrangements.map((type) {
                                  return ChoiceChip(
                                    label: Text(
                                      type.name ?? '',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: selectedWork.value == type
                                            ? Colors.white
                                            : AppColors.primaryColor,
                                      ),
                                    ),
                                    selected: selectedWork.value == (type.name ?? ""),
                                    onSelected: (_) {
                                      selectedWork.value =
                                      selectedWork.value == (type.name ?? "") ? '' : (type.name ?? "");
                                    },
                                    backgroundColor: Colors.white,
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    selectedColor: AppColors.primaryColor,
                                  );
                                }).toList(),
                              );
                          },
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Career Level",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        Obx(
                          () {
                            if (jobCategories.isEmpty) {
                              return Text("No Career Levels found");
                            }
                            final careerLevels = jobCategories[0].careerLevels ?? [];
                            return Wrap(
                              spacing: 8,
                              children: careerLevels.map((type) {
                                return ChoiceChip(
                                  label: Text(
                                    type.name ?? '',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: selectedCareer.value == type
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                    ),
                                  ),
                                  selected: selectedCareer.value == (type.name ?? ""),
                                  onSelected: (_) {
                                    selectedCareer.value =
                                    selectedCareer.value == (type.name ?? "") ? '' : (type.name ?? "");
                                  },
                                  backgroundColor: Colors.white,
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  selectedColor: AppColors.primaryColor,
                                );
                              }).toList(),
                            );
                          },
                        ),
/*                        Text(
                          "Salary Range",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: salaryRange.map((type) {
                              return ChoiceChip(
                                label: Text(
                                  type,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: selectedSalery.value == type
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  ),
                                ),
                                selected: selectedSalery.value == type,
                                onSelected: (_) {
                                  selectedSalery.value =
                                      selectedSalery.value == type ? '' : type;
                                },
                                backgroundColor: Colors.white,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                selectedColor: AppColors.primaryColor,
                              );
                            }).toList(),
                          ),
                        ),*/
                        Text(
                          "Industry",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        Obx(() {
                          if (jobCategories.isEmpty) {
                            return Text("No Industry categories found");
                          }
                          final industries =
                              jobCategories[0].jobIndustries ?? [];
                          return Wrap(
                            spacing: 8,
                            children: industries.map((type) {
                              return ChoiceChip(
                                label: Text(
                                  type.name ?? '',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: selectedIndustry.value == type.name
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  ),
                                ),
                                selected: selectedIndustry.value == type.name,
                                onSelected: (_) {
                                  selectedIndustry.value =
                                      selectedIndustry.value ==
                                          (type.name ?? "")
                                      ? ""
                                      : (type.name ?? "");
                                },
                                backgroundColor: Colors.white,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                selectedColor: AppColors.primaryColor,
                              );
                            }).toList(),
                          );
                        }),
/*                        SizedBox(height: 10.h),
                        Text(
                          "Flexibility",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: flexibility.map((type) {
                              return ChoiceChip(
                                label: Text(
                                  type,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: selectedFlexibility.value == type
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  ),
                                ),
                                selected: selectedFlexibility.value == type,
                                onSelected: (_) {
                                  selectedFlexibility.value =
                                      selectedFlexibility.value == type
                                      ? ''
                                      : type;
                                },
                                backgroundColor: Colors.white,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                selectedColor: AppColors.primaryColor,
                              );
                            }).toList(),
                          ),
                        ),*/
                        SizedBox(height: 10.h),
                        Text(
                          "Location",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2C3E50),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          onChanged: (value) {
                            selectedLocation.value = value;
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.location_on_outlined),
                            hintText: "New York,US",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: Color(0xff2C3E50),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                text: 'Clear',
                                onTap: () {
                                  clearFilters();
                                },
                                backgroundColor: Colors.white,
                                textColor: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: CustomButton(
                                text: 'Apply filter',
                                onTap: () async {
                                  Get.back();
                                  await searchFilterJobs();
                                  clearFilters();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void clearFilters() {
    selectedEmployment.value = '';
    selectedWork.value = '';
    selectedCareer.value = '';
    selectedSalery.value = '';
    selectedFlexibility.value = '';
    selectedSpecialOpportunity.value = '';
    selectedLocation.value = '';
  }
}
