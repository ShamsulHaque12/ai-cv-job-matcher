class JobModel {
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

  JobModel({
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

  JobModel.fromJson(Map<String, dynamic> json) {
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

    jobFlexibility = (json['jobFlexibility'] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];

    salaryRange = json['salaryRange'];

    skills = (json['skills'] as List?)?.map((e) => e.toString()).toList() ?? [];
    responsibilities = (json['responsibilities'] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];
    requirements =
        (json['requirements'] as List?)?.map((e) => e.toString()).toList() ?? [];
    whyJoin =
        (json['whyJoin'] as List?)?.map((e) => e.toString()).toList() ?? [];

    userId = json['userId'];
    companyId = json['companyId'];
    jobType = json['jobType'];
    status = json['status'];

    // int or double both handle
    if (json['noOfApplicants'] is double) {
      noOfApplicants = (json['noOfApplicants'] as double).toInt();
    } else {
      noOfApplicants = json['noOfApplicants'];
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    // double/int both safe
    dMatchScore = (json['_matchScore'] is int)
        ? (json['_matchScore'] as int).toDouble()
        : (json['_matchScore'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['jobId'] = jobId;
    data['title'] = title;
    data['experience'] = experience;
    data['deadline'] = deadline;
    data['location'] = location;
    data['workingTime'] = workingTime;
    data['description'] = description;
    data['salaryType'] = salaryType;
    data['jobIndustry'] = jobIndustry;
    data['careerLevel'] = careerLevel;
    data['workArragement'] = workArragement;
    data['jobFlexibility'] = jobFlexibility;
    data['salaryRange'] = salaryRange;
    data['skills'] = skills;
    data['responsibilities'] = responsibilities;
    data['requirements'] = requirements;
    data['whyJoin'] = whyJoin;
    data['userId'] = userId;
    data['companyId'] = companyId;
    data['jobType'] = jobType;
    data['status'] = status;
    data['noOfApplicants'] = noOfApplicants;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }

    data['_matchScore'] = dMatchScore;
    return data;
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

  Company({
    this.companyName,
    this.industryType,
    this.city,
    this.state,
    this.country,
    this.address,
    this.zipCode,
    this.website,
  });

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

  User({
    this.id,
    this.fullName,
    this.email,
    this.profilePic,
    this.role,
  });

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
