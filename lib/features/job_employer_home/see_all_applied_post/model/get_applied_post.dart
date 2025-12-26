class GetAppliedPost {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List<AppliedData>? data;

  GetAppliedPost({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetAppliedPost.fromJson(Map<String, dynamic> json) {
    return GetAppliedPost(
      success: json['success'] ?? false,
      statusCode: json['statusCode'],
      message: json['message'],
      data: (json['data'] as List?)
          ?.map((e) => AppliedData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class AppliedData {
  final String? id;
  final String? jobId;
  final Job? job;
  final String? profileId;
  final String? status;
  final String? jobSeekerId;
  final String? appliedAt;
  final Profile? profile;
  final JobSeeker? jobSeeker;
  final dynamic interviewScheduler;

  AppliedData({
    this.id,
    this.jobId,
    this.job,
    this.profileId,
    this.status,
    this.jobSeekerId,
    this.appliedAt,
    this.profile,
    this.jobSeeker,
    this.interviewScheduler,
  });

  factory AppliedData.fromJson(Map<String, dynamic> json) {
    return AppliedData(
      id: json['id'],
      jobId: json['jobId'],
      job: json['job'] != null ? Job.fromJson(json['job']) : null,
      profileId: json['profileId'],
      status: json['status'],
      jobSeekerId: json['jobSeekerId'],
      appliedAt: json['appliedAt'],
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : null,
      jobSeeker:
      json['jobSeeker'] != null ? JobSeeker.fromJson(json['jobSeeker']) : null,
      interviewScheduler: json['interviewScheduler'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'job': job?.toJson(),
      'profileId': profileId,
      'status': status,
      'jobSeekerId': jobSeekerId,
      'appliedAt': appliedAt,
      'profile': profile?.toJson(),
      'jobSeeker': jobSeeker?.toJson(),
      'interviewScheduler': interviewScheduler,
    };
  }
}

class Job {
  final String? id;
  final String? title;
  final Company? company;

  Job({this.id, this.title, this.company});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      company:
      json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company?.toJson(),
    };
  }
}

class Company {
  final String? id;
  final String? companyName;
  final String? industryType;
  final String? roleInCompany;
  final String? description;
  final String? logo;
  final String? country;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? website;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;

  Company({
    this.id,
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
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      companyName: json['companyName'],
      industryType: json['industryType'],
      roleInCompany: json['roleInCompany'],
      description: json['description'],
      logo: json['logo'],
      country: json['country'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      website: json['website'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'industryType': industryType,
      'roleInCompany': roleInCompany,
      'description': description,
      'logo': logo,
      'country': country,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'website': website,
      'userId': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Profile {
  final String? id;

  Profile({this.id});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}

class JobSeeker {
  final String? id;
  final String? email;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? profilePic;
  final String? phone;
  final String? preferredContactMethod;

  JobSeeker({
    this.id,
    this.email,
    this.fullName,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.phone,
    this.preferredContactMethod,
  });

  factory JobSeeker.fromJson(Map<String, dynamic> json) {
    return JobSeeker(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
      phone: json['phone'],
      preferredContactMethod: json['preferredContactMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'profilePic': profilePic,
      'phone': phone,
      'preferredContactMethod': preferredContactMethod,
    };
  }
}
