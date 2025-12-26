class RecommendationJobs {
  bool? success;
  int? statusCode;
  String? message;
  RecommendationData? data;

  RecommendationJobs({this.success, this.statusCode, this.message, this.data});

  RecommendationJobs.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null
        ? RecommendationData.fromJson(json['data'])
        : null;
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

class RecommendationData {
  Meta? meta;
  List<JobData>? data;

  RecommendationData({this.meta, this.data});

  RecommendationData.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(JobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta?.toJson(),
      'data': data?.map((v) => v.toJson()).toList(),
    };
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
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
  String? workArragement;
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
  Company? company;
  User? user;
  double? dMatchScore;

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
    this.workArragement,
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
    this.company,
    this.user,
    this.dMatchScore,
  });

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['jobId'];
    title = json['title'];
    experience = json['experience'];
    deadline = json['deadline'];
    location = json['location'];
    workingTime = json['workingTime'];
    description = json['description'];
    salaryType = json['salaryType'];
    jobIndustry = json['jobIndustry'];
    careerLevel = json['careerLevel'];
    workArragement = json['workArragement'];

    jobFlexibility =
        (json['jobFlexibility'] as List?)?.map((e) => e.toString()).toList();

    salaryRange = json['salaryRange'];

    skills = (json['skills'] as List?)?.map((e) => e.toString()).toList();
    responsibilities =
        (json['responsibilities'] as List?)?.map((e) => e.toString()).toList();
    requirements =
        (json['requirements'] as List?)?.map((e) => e.toString()).toList();
    whyJoin = (json['whyJoin'] as List?)?.map((e) => e.toString()).toList();

    userId = json['userId'];
    companyId = json['companyId'];
    jobType = json['jobType'];
    status = json['status'];
    noOfApplicants = json['noOfApplicants'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;

    user = json['user'] != null ? User.fromJson(json['user']) : null;

    dMatchScore = (json['_matchScore'] as num?)?.toDouble();
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
      'workArragement': workArragement,
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
      'company': company?.toJson(),
      'user': user?.toJson(),
      '_matchScore': dMatchScore,
    };
  }
}

class Company {
  String? companyName;
  String? industryType;
  String? city;
  String? state;
  String? country;
  String? address;
  String? zipCode;
  String? website;

  Company(
      {this.companyName,
        this.industryType,
        this.city,
        this.state,
        this.country,
        this.address,
        this.zipCode,
        this.website});

  Company.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    industryType = json['industryType'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    address = json['address'];
    zipCode = json['zipCode'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'industryType': industryType,
      'city': city,
      'state': state,
      'country': country,
      'address': address,
      'zipCode': zipCode,
      'website': website,
    };
  }
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? profilePic;
  String? role;

  User({this.id, this.fullName, this.email, this.profilePic, this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    profilePic = json['profilePic'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'profilePic': profilePic,
      'role': role,
    };
  }
}
