class ProfileModel {
  final String? name;
  final String? profileDetailedInformation;
  final String? designation;
  final List<ContactInfo>? contactInfo;
  final List<OtherLink>? otherLinks;
  final List<Education>? education;
  final List<Experience>? experience;
  final List<Certification>? certifications;
  final List<String>? skills;
  final List<String>? languages;
  final String? presentSalary;
  final String? expectedSalary;
  final String? countryRegion;
  final String? city;
  final String? state;
  final String? zipCode;

  ProfileModel({
    this.name,
    this.profileDetailedInformation,
    this.designation,
    this.contactInfo,
    this.otherLinks,
    this.education,
    this.experience,
    this.skills,
    this.languages,
    this.presentSalary,
    this.expectedSalary,
    this.certifications,
    this.countryRegion,
    this.city,
    this.state,
    this.zipCode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      profileDetailedInformation: json['profile_detailed_information'] ?? '',
      designation: json['designation'] ?? '',
      contactInfo: (json['contact_info'] as List?)
          ?.map((e) => ContactInfo.fromJson(e))
          .toList() ??
          [],
      otherLinks: (json['other_links'] as List?)
          ?.map((e) => OtherLink.fromJson(e))
          .toList() ??
          [],
      education: (json['education'] as List?)
          ?.map((e) => Education.fromJson(e))
          .toList() ??
          [],
      experience: (json['experience'] as List?)
          ?.map((e) => Experience.fromJson(e))
          .toList() ??
          [],
      skills: (json['skills'] as List?)?.map((e) => e.toString()).toList() ?? [],
      languages:
      (json['languages'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'aboutMe': profileDetailedInformation,
      'JobTitle': designation,
      'contact_info': contactInfo?.map((e) => e.toJson()).toList(),
      'other_links': otherLinks?.map((e) => e.toJson()).toList(),
      'education': education?.map((e) => e.toJson()).toList(),
      'jobExperience': experience?.map((e) => e.toJson()).toList(),
      'skills': skills,
      'languages': languages,
      'presentSalary': presentSalary,
      'expectedSalary': expectedSalary,
      'certifications': certifications?.map((e) => e.toJson()).toList(),
      'countryRegion': countryRegion,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    };
  }
}
class Certification {
  final String? title;
  final String? issuer;
  final String? year;

  Certification({this.title, this.issuer, this.year});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'issuer': issuer,
      'year': year,
    };
  }
}

class ContactInfo {
  final String? email;
  final String? phone;
  final String? address;

  ContactInfo({this.email, this.phone, this.address});

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phone,
      'address': address,
    };
  }
}

class OtherLink {
  final String? linkType;
  final String? url;

  OtherLink({this.linkType, this.url});

  factory OtherLink.fromJson(Map<String, dynamic> json) {
    return OtherLink(
      linkType: json['link_type'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link_type': linkType,
      'url': url,
    };
  }
}

class Education {
  final String? institution;
  final String? degree;
  final String? fieldOfStudy;
  final String? results;
  final String? startDate;
  final String? endDate;

  Education({
    this.institution,
    this.degree,
    this.fieldOfStudy,
    this.results,
    this.startDate,
    this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'] ?? '',
      degree: json['degree'] ?? '',
      fieldOfStudy: json['field_of_study'] ?? '',
      results: json['results'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'education': institution,
      'degree': degree,
      'institution': fieldOfStudy,
      'startYear': startDate,
      'endYear': endDate,
    };
  }
}

class Experience {
  final String? company;
  final String? designation;
  final String? details;
  final String? startDate;
  final String? endDate;

  Experience({
    this.company,
    this.designation,
    this.details,
    this.startDate,
    this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'] ?? '',
      designation: json['designation'] ?? '',
      details: json['details'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'position': designation,
      'description': details,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
