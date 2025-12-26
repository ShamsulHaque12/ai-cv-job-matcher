class JobApplication {
  final String? id;
  final String? jobId;
  final String? candidateId;
  final String? candidateEmail;
  final String? appliedDate;
  final String? companyName;
  final String? companyContact;
  final String? salaryRange;
  final String? position;
  final String? status;
  final String? logo;
  final String? jobType;
  final String? location;

  JobApplication({
    this.id,
    this.jobId,
    this.candidateId,
    this.candidateEmail,
    this.appliedDate,
    this.companyName,
    this.companyContact,
    this.salaryRange,
    this.position,
    this.status,
    this.logo,
    this.jobType,
    this.location,
  });

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      id: json['id']?.toString(),
      jobId: json['jobId']?.toString(),
      candidateId: json['candidateId']?.toString(),
      candidateEmail: json['candidateEmail'],
      appliedDate: json['appliedDate'],
      companyName: json['companyName'],
      companyContact: json['companyContact'],
      salaryRange: json['salaryRange'],
      position: json['position'],
      status: json['status'],
      logo: json['logo'],
      jobType: json['jobType'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'candidateId': candidateId,
      'candidateEmail': candidateEmail,
      'appliedDate': appliedDate,
      'companyName': companyName,
      'companyContact': companyContact,
      'salaryRange': salaryRange,
      'position': position,
      'status': status,
      'logo': logo,
      'jobType': jobType,
      'location': location,
    };
  }
}
