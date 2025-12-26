class SingleJobModel {
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
  Company? company;
  User? user;

  SingleJobModel({
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
    this.company,
    this.user,
  });

  factory SingleJobModel.fromJson(Map<String, dynamic> json) {
    return SingleJobModel(
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
      workArrangement: json['workArrangement'],
      jobFlexibility: json['jobFlexibility'] != null
          ? List<String>.from(json['jobFlexibility'])
          : null,
      salaryRange: json['salaryRange'],
      skills: json['skills'] != null ? List<String>.from(json['skills']) : null,
      responsibilities: json['responsibilities'] != null
          ? List<String>.from(json['responsibilities'])
          : null,
      requirements: json['requirements'] != null
          ? List<String>.from(json['requirements'])
          : null,
      whyJoin: json['whyJoin'] != null ? List<String>.from(json['whyJoin']) : null,
      userId: json['userId'],
      companyId: json['companyId'],
      jobType: json['jobType'],
      status: json['status'],
      noOfApplicants: json['noOfApplicants'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
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
      'company': company?.toJson(),
      'user': user?.toJson(),
    };
  }
}

class Company {
  String? companyName;
  String? industryType;
  String? logo;
  String? roleInCompany;
  String? description;
  String? email;
  String? phoneNumber;
  String? country;
  String? city;
  String? state;
  String? address;
  String? zipCode;
  String? website;

  Company({
    this.companyName,
    this.industryType,
    this.logo,
    this.roleInCompany,
    this.description,
    this.email,
    this.phoneNumber,
    this.country,
    this.city,
    this.state,
    this.address,
    this.zipCode,
    this.website,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['companyName'],
      industryType: json['industryType'],
      logo: json['logo'],
      roleInCompany: json['roleInCompany'],
      description: json['description'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      country: json['country'],
      city: json['city'],
      state: json['state'],
      address: json['address'],
      zipCode: json['zipCode'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'industryType': industryType,
      'logo': logo,
      'roleInCompany': roleInCompany,
      'description': description,
      'email': email,
      'phoneNumber': phoneNumber,
      'country': country,
      'city': city,
      'state': state,
      'address': address,
      'zipCode': zipCode,
      'website': website,
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
  bool? isSubscribed;
  String? planExpiration;
  String? subscriptionType;
  int? totalPayPerJobCount;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.profilePic,
    this.role,
    this.isSubscribed,
    this.planExpiration,
    this.subscriptionType,
    this.totalPayPerJobCount,
    this.createdAt,
    this.updatedAt,
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
      isSubscribed: json['isSubscribed'],
      planExpiration: json['planExpiration']?.toString(),
      subscriptionType: json['subscriptionType']?.toString(),
      totalPayPerJobCount: json['totalPayPerJobCount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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
      'isSubscribed': isSubscribed,
      'planExpiration': planExpiration,
      'subscriptionType': subscriptionType,
      'totalPayPerJobCount': totalPayPerJobCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
