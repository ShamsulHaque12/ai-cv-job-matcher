class FavoriteModel {
  String? id;
  String? jobId;
  String? userId;
  String? savedAt;
  String? createdAt;
  String? updatedAt;
  Job? job;

  FavoriteModel({
    this.id,
    this.jobId,
    this.userId,
    this.savedAt,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id']?.toString(),
      jobId: json['jobId']?.toString(),
      userId: json['userId']?.toString(),
      savedAt: json['savedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      job: json['job'] != null ? Job.fromJson(json['job']) : null,
    );
  }
}

class Job {
  String? id;
  String? title;
  String? experience;
  String? location;
  String? salaryRange;
  String? jobType;
  String? status;
  Company? company;

  Job({
    this.id,
    this.title,
    this.experience,
    this.location,
    this.salaryRange,
    this.jobType,
    this.status,
    this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id']?.toString(),
      title: json['title'],
      experience: json['experience'],
      location: json['location'],
      salaryRange: json['salaryRange'],
      jobType: json['jobType'],
      status: json['status'],
      company: json['company'] != null
          ? Company.fromJson(json['company'])
          : null,
    );
  }
}

class Company {
  String? companyName;
  String? logo;

  Company({
    this.companyName,
    this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['companyName'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'logo': logo,
    };
  }
}
