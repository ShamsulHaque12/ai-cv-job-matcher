class ShowMeProfileData {
  final bool? success;
  final int? statusCode;
  final String? message;
  final UserData? data;

  ShowMeProfileData({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ShowMeProfileData.fromJson(Map<String, dynamic> json) {
    return ShowMeProfileData(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    if (data != null) 'data': data!.toJson(),
  };
}

class UserData {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? businessEmail;
  final String? city;
  final String? address;
  final String? state;
  final String? country;
  final String? zipCode;
  final String? password;
  final String? profilePic;
  final String? phone;
  final String? preferredContactMethod;
  final bool? isVerified;
  final bool? isResetPassword;
  final bool? canResetPassword;
  final bool? isResentOtp;
  final String? role;
  final bool? isSubscribed;
  final String? status;
  final int? totalPayPerJobCount;
  final String? createdAt;
  final String? updatedAt;
  final bool? isEmailVerified;
  final bool? isDelete;
  final Profile? profile;
  final dynamic company;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.businessEmail,
    this.city,
    this.address,
    this.state,
    this.country,
    this.zipCode,
    this.password,
    this.profilePic,
    this.phone,
    this.preferredContactMethod,
    this.isVerified,
    this.isResetPassword,
    this.canResetPassword,
    this.isResentOtp,
    this.role,
    this.isSubscribed,
    this.status,
    this.totalPayPerJobCount,
    this.createdAt,
    this.updatedAt,
    this.isEmailVerified,
    this.isDelete,
    this.profile,
    this.company,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      email: json['email'],
      businessEmail: json['businessEmail'],
      city: json['city'],
      address: json['address'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
      password: json['password'],
      profilePic: json['profilePic'],
      phone: json['phone'],
      preferredContactMethod: json['preferredContactMethod'],
      isVerified: json['isVerified'],
      isResetPassword: json['isResetPassword'],
      canResetPassword: json['canResetPassword'],
      isResentOtp: json['isResentOtp'],
      role: json['role'],
      isSubscribed: json['isSubscribed'],
      status: json['status'],
      totalPayPerJobCount: json['totalPayPerJobCount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isEmailVerified: json['isEmailVerified'],
      isDelete: json['isDelete'],
      profile:
      json['Profile'] != null ? Profile.fromJson(json['Profile']) : null,
      company: json['Company'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'fullName': fullName,
    'email': email,
    'businessEmail': businessEmail,
    'city': city,
    'address': address,
    'state': state,
    'country': country,
    'zipCode': zipCode,
    'password': password,
    'profilePic': profilePic,
    'phone': phone,
    'preferredContactMethod': preferredContactMethod,
    'isVerified': isVerified,
    'isResetPassword': isResetPassword,
    'canResetPassword': canResetPassword,
    'isResentOtp': isResentOtp,
    'role': role,
    'isSubscribed': isSubscribed,
    'status': status,
    'totalPayPerJobCount': totalPayPerJobCount,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'isEmailVerified': isEmailVerified,
    'isDelete': isDelete,
    if (profile != null) 'Profile': profile!.toJson(),
    'Company': company,
  };
}

class Profile {
  final String? id;
  final String? countryRegion;
  final String? address;
  final String? email;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? jobTitle;
  final String? phoneNumber;
  final String? jobDescription;
  final List<Education>? education;
  final List<Certifications>? certifications;
  final List<SocialMedia>? socialMedia;
  final List<String>? skills;
  final List<String>? languages;
  final String? aboutMe;
  final int? presentSalary;
  final int? expectedSalary;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;

  Profile({
    this.id,
    this.countryRegion,
    this.address,
    this.email,
    this.city,
    this.state,
    this.zipCode,
    this.jobTitle,
    this.phoneNumber,
    this.jobDescription,
    this.education,
    this.certifications,
    this.socialMedia,
    this.skills,
    this.languages,
    this.aboutMe,
    this.presentSalary,
    this.expectedSalary,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      countryRegion: json['countryRegion'],
      address: json['address'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      jobTitle: json['JobTitle'],
      phoneNumber: json['phoneNumber'],
      jobDescription: json['jobDescription'],
      education: (json['education'] as List?)
          ?.map((e) => Education.fromJson(e))
          .toList(),
      certifications: (json['certifications'] as List?)
          ?.map((e) => Certifications.fromJson(e))
          .toList(),
      socialMedia: (json['socialMedia'] as List?)
          ?.map((e) => SocialMedia.fromJson(e))
          .toList(),
      skills: (json['skills'] as List?)?.cast<String>(),
      languages: (json['languages'] as List?)?.cast<String>(),
      aboutMe: json['aboutMe'],
      presentSalary: json['presentSalary'],
      expectedSalary: json['expectedSalary'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'countryRegion': countryRegion,
    'address': address,
    'email': email,
    'city': city,
    'state': state,
    'zipCode': zipCode,
    'JobTitle': jobTitle,
    'phoneNumber': phoneNumber,
    'jobDescription': jobDescription,
    'education': education?.map((e) => e.toJson()).toList(),
    'certifications': certifications?.map((e) => e.toJson()).toList(),
    'socialMedia': socialMedia?.map((e) => e.toJson()).toList(),
    'skills': skills,
    'languages': languages,
    'aboutMe': aboutMe,
    'presentSalary': presentSalary,
    'expectedSalary': expectedSalary,
    'userId': userId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class Education {
  final String? degree;
  final String? institution;
  final String? startYear;
  final String? endYear;

  Education({
    this.degree,
    this.institution,
    this.startYear,
    this.endYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    degree: json['degree'],
    institution: json['institution'],
    startYear: json['startYear'],
    endYear: json['endYear'],
  );

  Map<String, dynamic> toJson() => {
    'degree': degree,
    'institution': institution,
    'startYear': startYear,
    'endYear': endYear,
  };
}

class Certifications {
  final String? title;
  final String? issuer;
  final String? year;

  Certifications({this.title, this.issuer, this.year});

  factory Certifications.fromJson(Map<String, dynamic> json) =>
      Certifications(
        title: json['title'],
        issuer: json['issuer'],
        year: json['year'],
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'issuer': issuer,
    'year': year,
  };
}

class SocialMedia {
  final String? linkType;
  final String? url;

  SocialMedia({this.linkType, this.url});

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
    linkType: json['link_type'],
    url: json['url'],
  );

  Map<String, dynamic> toJson() => {
    'link_type': linkType,
    'url': url,
  };
}
