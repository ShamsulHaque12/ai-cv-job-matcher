// class GetAllActivePost {
//   bool? success;
//   int? statusCode;
//   String? message;
//   JobDataContainer? data;
//
//   GetAllActivePost({this.success, this.statusCode, this.message, this.data});
//
//   GetAllActivePost.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//     data = json['data'] != null ? JobDataContainer.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = success;
//     map['statusCode'] = statusCode;
//     map['message'] = message;
//     if (data != null) map['data'] = data!.toJson();
//     return map;
//   }
// }
//
// class JobDataContainer {
//   Meta? meta;
//   List<JobData>? jobs;
//
//   JobDataContainer({this.meta, this.jobs});
//
//   JobDataContainer.fromJson(Map<String, dynamic> json) {
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//     if (json['data'] != null) {
//       jobs = <JobData>[];
//       json['data'].forEach((v) {
//         jobs!.add(JobData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (meta != null) map['meta'] = meta!.toJson();
//     if (jobs != null) map['data'] = jobs!.map((v) => v.toJson()).toList();
//     return map;
//   }
// }
//
// class Meta {
//   int? page;
//   int? limit;
//   int? total;
//   int? totalPage;
//
//   Meta({this.page, this.limit, this.total, this.totalPage});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     limit = json['limit'];
//     total = json['total'];
//     totalPage = json['totalPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'page': page,
//       'limit': limit,
//       'total': total,
//       'totalPage': totalPage,
//     };
//   }
// }
//
// class JobData {
//   String? id;
//   String? jobId;
//   String? title;
//   String? experience;
//   String? deadline;
//   String? location;
//   String? workingTime;
//   String? description;
//   String? salaryType;
//   String? jobIndustry;
//   String? careerLevel;
//   String? workArrangement;
//   List<String>? jobFlexibility;
//   String? salaryRange;
//   List<String>? skills;
//   List<String>? responsibilities;
//   List<String>? requirements;
//   List<String>? whyJoin;
//   String? userId;
//   String? companyId;
//   String? jobType;
//   String? status;
//   int? noOfApplicants;
//   String? createdAt;
//   String? updatedAt;
//   Company? company;
//   User? user;
//
//   JobData({
//     this.id,
//     this.jobId,
//     this.title,
//     this.experience,
//     this.deadline,
//     this.location,
//     this.workingTime,
//     this.description,
//     this.salaryType,
//     this.jobIndustry,
//     this.careerLevel,
//     this.workArrangement,
//     this.jobFlexibility,
//     this.salaryRange,
//     this.skills,
//     this.responsibilities,
//     this.requirements,
//     this.whyJoin,
//     this.userId,
//     this.companyId,
//     this.jobType,
//     this.status,
//     this.noOfApplicants,
//     this.createdAt,
//     this.updatedAt,
//     this.company,
//     this.user,
//   });
//
//   JobData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     jobId = json['jobId'];
//     title = json['title'];
//     experience = json['experience'];
//     deadline = json['deadline'];
//     location = json['location'];
//     workingTime = json['workingTime'];
//     description = json['description'];
//     salaryType = json['salaryType'];
//     jobIndustry = json['jobIndustry'];
//     careerLevel = json['careerLevel'];
//     workArrangement = json['workArragement'];
//     jobFlexibility = json['jobFlexibility'] != null
//         ? List<String>.from(json['jobFlexibility'])
//         : [];
//     salaryRange = json['salaryRange'];
//     skills = json['skills'] != null ? List<String>.from(json['skills']) : [];
//     responsibilities = json['responsibilities'] != null
//         ? List<String>.from(json['responsibilities'])
//         : [];
//     requirements =
//     json['requirements'] != null ? List<String>.from(json['requirements']) : [];
//     whyJoin = json['whyJoin'] != null ? List<String>.from(json['whyJoin']) : [];
//     userId = json['userId'];
//     companyId = json['companyId'];
//     jobType = json['jobType'];
//     status = json['status'];
//     noOfApplicants = json['noOfApplicants'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     company = json['company'] != null ? Company.fromJson(json['company']) : null;
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['jobId'] = jobId;
//     map['title'] = title;
//     map['experience'] = experience;
//     map['deadline'] = deadline;
//     map['location'] = location;
//     map['workingTime'] = workingTime;
//     map['description'] = description;
//     map['salaryType'] = salaryType;
//     map['jobIndustry'] = jobIndustry;
//     map['careerLevel'] = careerLevel;
//     map['workArragement'] = workArrangement;
//     map['jobFlexibility'] = jobFlexibility;
//     map['salaryRange'] = salaryRange;
//     map['skills'] = skills;
//     map['responsibilities'] = responsibilities;
//     map['requirements'] = requirements;
//     map['whyJoin'] = whyJoin;
//     map['userId'] = userId;
//     map['companyId'] = companyId;
//     map['jobType'] = jobType;
//     map['status'] = status;
//     map['noOfApplicants'] = noOfApplicants;
//     map['createdAt'] = createdAt;
//     map['updatedAt'] = updatedAt;
//     if (company != null) map['company'] = company!.toJson();
//     if (user != null) map['user'] = user!.toJson();
//     return map;
//   }
// }
//
// class Company {
//   String? companyName;
//   String? industryType;
//   String? logo;
//   String? description;
//   String? city;
//   String? state;
//   String? country;
//   String? zipCode;
//   String? website;
//
//   Company({
//     this.companyName,
//     this.industryType,
//     this.logo,
//     this.description,
//     this.city,
//     this.state,
//     this.country,
//     this.zipCode,
//     this.website,
//   });
//
//   Company.fromJson(Map<String, dynamic> json) {
//     companyName = json['companyName'];
//     industryType = json['industryType'];
//     logo = json['logo'];
//     description = json['description'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     zipCode = json['zipCode'];
//     website = json['website'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'companyName': companyName,
//       'industryType': industryType,
//       'logo': logo,
//       'description': description,
//       'city': city,
//       'state': state,
//       'country': country,
//       'zipCode': zipCode,
//       'website': website,
//     };
//   }
// }
//
// class User {
//   String? id;
//   String? fullName;
//   String? email;
//   String? profilePic;
//   String? role;
//   bool? isSubscribed;
//
//   User({
//     this.id,
//     this.fullName,
//     this.email,
//     this.profilePic,
//     this.role,
//     this.isSubscribed,
//   });
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['fullName'];
//     email = json['email'];
//     profilePic = json['profilePic'];
//     role = json['role'];
//     isSubscribed = json['isSubscribed'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'fullName': fullName,
//       'email': email,
//       'profilePic': profilePic,
//       'role': role,
//       'isSubscribed': isSubscribed,
//     };
//   }
// }
