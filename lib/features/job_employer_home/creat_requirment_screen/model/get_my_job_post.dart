class GetMyJobPost {
  bool? success;
  int? statusCode;
  String? message;
  JobPostData? data;

  GetMyJobPost({this.success, this.statusCode, this.message, this.data});

  factory GetMyJobPost.fromJson(Map<String, dynamic> json) {
    return GetMyJobPost(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? JobPostData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class JobPostData {
  Meta? meta;
  List<JobData>? jobs;

  JobPostData({this.meta, this.jobs});

  factory JobPostData.fromJson(Map<String, dynamic> json) {
    return JobPostData(
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      jobs: json['data'] != null
          ? List<JobData>.from(json['data'].map((x) => JobData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta?.toJson(),
      'data': jobs?.map((x) => x.toJson()).toList(),
    };
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPage': totalPage,
    };
  }
}

class JobData {
  String? id;
  String? jobId;
  String? title;
  String? experience;
  String? deadline;
  String? location;
  String? workingTime;
  String? description;
  String? salaryType;
  String? jobIndustry;
  String? careerLevel;
  String? workArrangement;
  List<String>? jobFlexibility;
  String? salaryRange;
  List<String>? skills;
  List<String>? responsibilities;
  List<String>? requirements;
  List<String>? whyJoin;
  String? userId;
  String? companyId;
  String? jobType;
  String? status;
  int? noOfApplicants;
  String? createdAt;
  String? updatedAt;
  User? user;
  Company? company;

  JobData({
    this.id,
    this.jobId,
    this.title,
    this.experience,
    this.deadline,
    this.location,
    this.workingTime,
    this.description,
    this.salaryType,
    this.jobIndustry,
    this.careerLevel,
    this.workArrangement,
    this.jobFlexibility,
    this.salaryRange,
    this.skills,
    this.responsibilities,
    this.requirements,
    this.whyJoin,
    this.userId,
    this.companyId,
    this.jobType,
    this.status,
    this.noOfApplicants,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.company,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      id: json['id'],
      jobId: json['jobId'],
      title: json['title'],
      experience: json['experience'],
      deadline: json['deadline'],
      location: json['location'],
      workingTime: json['workingTime'],
      description: json['description'],
      salaryType: json['salaryType'],
      jobIndustry: json['jobIndustry'],
      careerLevel: json['careerLevel'],
      workArrangement: json['workArragement'] ?? json['workArrangement'],
      jobFlexibility: json['jobFlexibility'] != null
          ? List<String>.from(json['jobFlexibility'])
          : [],
      salaryRange: json['salaryRange'],
      skills:
      json['skills'] != null ? List<String>.from(json['skills']) : [],
      responsibilities: json['responsibilities'] != null
          ? List<String>.from(json['responsibilities'])
          : [],
      requirements:
      json['requirements'] != null ? List<String>.from(json['requirements']) : [],
      whyJoin:
      json['whyJoin'] != null ? List<String>.from(json['whyJoin']) : [],
      userId: json['userId'],
      companyId: json['companyId'],
      jobType: json['jobType'],
      status: json['status'],
      noOfApplicants: json['noOfApplicants'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'title': title,
      'experience': experience,
      'deadline': deadline,
      'location': location,
      'workingTime': workingTime,
      'description': description,
      'salaryType': salaryType,
      'jobIndustry': jobIndustry,
      'careerLevel': careerLevel,
      'workArrangement': workArrangement,
      'jobFlexibility': jobFlexibility,
      'salaryRange': salaryRange,
      'skills': skills,
      'responsibilities': responsibilities,
      'requirements': requirements,
      'whyJoin': whyJoin,
      'userId': userId,
      'companyId': companyId,
      'jobType': jobType,
      'status': status,
      'noOfApplicants': noOfApplicants,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user?.toJson(),
      'company': company?.toJson(),
    };
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? profilePic;
  String? role;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.profilePic,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      email: json['email'],
      profilePic: json['profilePic'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'profilePic': profilePic,
      'role': role,
    };
  }
}

class Company {
  String? companyName;
  String? logo;
  String? industryType;
  String? email;
  String? phoneNumber;

  Company({this.companyName, this.logo, this.industryType, this.email, this.phoneNumber});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['companyName'],
      logo: json['logo'],
      industryType: json['industryType'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'logo': logo,
      'industryType': industryType,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
