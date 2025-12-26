class SearchModel {
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

  SearchModel({
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
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
    workArrangement: json['workArrangement'] ?? json['workArragement'],
    jobFlexibility: json['jobFlexibility'] != null
        ? List<String>.from(json['jobFlexibility'])
        : [],
    salaryRange: json['salaryRange'],
    skills: json['skills'] != null ? List<String>.from(json['skills']) : [],
    responsibilities: json['responsibilities'] != null
        ? List<String>.from(json['responsibilities'])
        : [],
    requirements: json['requirements'] != null
        ? List<String>.from(json['requirements'])
        : [],
    whyJoin: json['whyJoin'] != null ? List<String>.from(json['whyJoin']) : [],
    userId: json['userId'],
    companyId: json['companyId'],
    jobType: json['jobType'],
    status: json['status'],
    noOfApplicants: json['noOfApplicants'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    company: json['company'] != null ? Company.fromJson(json['company']) : null,
  );

  Map<String, dynamic> toJson() => {
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
  };
}

class Company {
  String? companyName;
  String? industryType;
  String? logo;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? website;

  Company({
    this.companyName,
    this.industryType,
    this.logo,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.website,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companyName: json['companyName'],
    industryType: json['industryType'],
    logo: json['logo'],
    city: json['city'],
    state: json['state'],
    country: json['country'],
    zipCode: json['zipCode'],
    website: json['website'],
  );

  Map<String, dynamic> toJson() => {
    'companyName': companyName,
    'industryType': industryType,
    'logo': logo,
    'city': city,
    'state': state,
    'country': country,
    'zipCode': zipCode,
    'website': website,
  };
}
