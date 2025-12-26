class GetDashboard {
  final bool success;
  final int statusCode;
  final String message;
  final DashboardData? data;

  const GetDashboard({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory GetDashboard.fromJson(Map<String, dynamic> json) => GetDashboard(
    success: json['success'] ?? false,
    statusCode: json['statusCode'] ?? 0,
    message: json['message'] ?? '',
    data: json['data'] != null
        ? DashboardData.fromJson(json['data'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    if (data != null) 'data': data!.toJson(),
  };
}

class DashboardData {
  final Stats? stats;
  final List<RecentJob> recentJobs;
  final List<RecentCandidate> recentCandidates;
  final CompanyInfo? companyInfo;

  const DashboardData({
    this.stats,
    this.recentJobs = const [],
    this.recentCandidates = const [],
    this.companyInfo,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
    stats:
    json['stats'] != null ? Stats.fromJson(json['stats']) : null,
    recentJobs: json['recentJobs'] != null
        ? List<RecentJob>.from(
        json['recentJobs'].map((v) => RecentJob.fromJson(v)))
        : [],
    recentCandidates: json['recentCandidates'] != null
        ? List<RecentCandidate>.from(
        json['recentCandidates'].map((v) => RecentCandidate.fromJson(v)))
        : [],
    companyInfo: json['companyInfo'] != null
        ? CompanyInfo.fromJson(json['companyInfo'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (stats != null) 'stats': stats!.toJson(),
    'recentJobs': recentJobs.map((v) => v.toJson()).toList(),
    'recentCandidates': recentCandidates.map((v) => v.toJson()).toList(),
    if (companyInfo != null) 'companyInfo': companyInfo!.toJson(),
  };
}

class Stats {
  final int totalJobs;
  final int totalCandidates;
  final int totalActiveJobs;

  const Stats({
    this.totalJobs = 0,
    this.totalCandidates = 0,
    this.totalActiveJobs = 0,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    totalJobs: json['totalJobs'] ?? 0,
    totalCandidates: json['totalCandidates'] ?? 0,
    totalActiveJobs: json['totalActiveJobs'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'totalJobs': totalJobs,
    'totalCandidates': totalCandidates,
    'totalActiveJobs': totalActiveJobs,
  };
}

class RecentJob {
  final String? id;
  final String? title;
  final String? createdAt;
  final String? jobId;
  final String? salaryRange;
  final String? status;
  final String? deadline;
  final String? location;
  final String? jobIndustry;

  const RecentJob({
    this.id,
    this.title,
    this.createdAt,
    this.jobId,
    this.salaryRange,
    this.status,
    this.deadline,
    this.location,
    this.jobIndustry,
  });

  factory RecentJob.fromJson(Map<String, dynamic> json) => RecentJob(
    id: json['id'],
    title: json['title'],
    createdAt: json['createdAt'],
    jobId: json['jobId'],
    salaryRange: json['salaryRange'],
    status: json['status'],
    deadline: json['deadline'],
    location: json['location'],
    jobIndustry: json['jobIndustry'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'createdAt': createdAt,
    'jobId': jobId,
    'salaryRange': salaryRange,
    'status': status,
    'deadline': deadline,
    'location': location,
    'jobIndustry': jobIndustry,
  };
}

class RecentCandidate {
  final String? id;
  final String? appliedAt;
  final String? status;
  final JobSeeker? jobSeeker;
  final Job? job;
  final Profile? profile;

  const RecentCandidate({
    this.id,
    this.appliedAt,
    this.status,
    this.jobSeeker,
    this.job,
    this.profile,
  });

  factory RecentCandidate.fromJson(Map<String, dynamic> json) =>
      RecentCandidate(
        id: json['id'],
        appliedAt: json['appliedAt'],
        status: json['status'],
        jobSeeker: json['jobSeeker'] != null
            ? JobSeeker.fromJson(json['jobSeeker'])
            : null,
        job: json['job'] != null ? Job.fromJson(json['job']) : null,
        profile:
        json['profile'] != null ? Profile.fromJson(json['profile']) : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appliedAt': appliedAt,
    'status': status,
    if (jobSeeker != null) 'jobSeeker': jobSeeker!.toJson(),
    if (job != null) 'job': job!.toJson(),
    if (profile != null) 'profile': profile!.toJson(),
  };
}

class JobSeeker {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profilePic;

  const JobSeeker({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
  });

  factory JobSeeker.fromJson(Map<String, dynamic> json) => JobSeeker(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    profilePic: json['profilePic'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'profilePic': profilePic,
  };
}

class Job {
  final String? title;
  final String? jobId;

  const Job({this.title, this.jobId});

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    title: json['title'],
    jobId: json['jobId'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'jobId': jobId,
  };
}

class Profile {
  final String? jobTitle;
  final int? presentSalary;

  const Profile({this.jobTitle, this.presentSalary});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    jobTitle: json['JobTitle'],
    presentSalary: json['presentSalary'],
  );

  Map<String, dynamic> toJson() => {
    'JobTitle': jobTitle,
    'presentSalary': presentSalary,
  };
}

class CompanyInfo {
  final String? id;
  final String? name;

  const CompanyInfo({this.id, this.name});

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
