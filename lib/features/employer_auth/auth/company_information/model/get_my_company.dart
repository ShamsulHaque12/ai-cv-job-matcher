class GetMyCompany {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetMyCompany({this.success, this.statusCode, this.message, this.data});

  GetMyCompany.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? companyName;
  String? industryType;
  String? roleInCompany;
  String? description;
  String? logo;
  String? country;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? website;
  String? userId;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<JobPost>? jobPost;

  Data(
      {this.id,
        this.companyName,
        this.industryType,
        this.roleInCompany,
        this.description,
        this.logo,
        this.country,
        this.email,
        this.phoneNumber,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.website,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.jobPost});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    industryType = json['industryType'];
    roleInCompany = json['roleInCompany'];
    description = json['description'];
    logo = json['logo'];
    country = json['country'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    website = json['website'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['JobPost'] != null) {
      jobPost = <JobPost>[];
      json['JobPost'].forEach((v) {
        jobPost!.add(new JobPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['industryType'] = this.industryType;
    data['roleInCompany'] = this.roleInCompany;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['country'] = this.country;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['website'] = this.website;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.jobPost != null) {
      data['JobPost'] = this.jobPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  String? profilePic;
  String? role;

  User(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.fullName,
        this.profilePic,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    profilePic = json['profilePic'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    return data;
  }
}

class JobPost {
  String? id;
  String? title;
  String? experience;
  String? deadline;
  String? status;
  String? createdAt;

  JobPost(
      {this.id,
        this.title,
        this.experience,
        this.deadline,
        this.status,
        this.createdAt});

  JobPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    experience = json['experience'];
    deadline = json['deadline'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['experience'] = this.experience;
    data['deadline'] = this.deadline;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
