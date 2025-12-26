class showMeResult {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  showMeResult({this.success, this.statusCode, this.message, this.data});

  showMeResult.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  Null? businessEmail;
  String? city;
  String? country;
  String? state;
  String? zipCode;
  String? address;
  String? phone;
  String? profilePic;
  String? role;
  bool? isVerified;
  bool? isSubscribed;
  String? status;
  Null? planExpiration;
  Null? subscriptionType;
  Null? planId;
  int? totalPayPerJobCount;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.businessEmail,
        this.city,
        this.country,
        this.state,
        this.zipCode,
        this.address,
        this.phone,
        this.profilePic,
        this.role,
        this.isVerified,
        this.isSubscribed,
        this.status,
        this.planExpiration,
        this.subscriptionType,
        this.planId,
        this.totalPayPerJobCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    email = json['email'];
    businessEmail = json['businessEmail'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    zipCode = json['zipCode'];
    address = json['address'];
    phone = json['phone'];
    profilePic = json['profilePic'];
    role = json['role'];
    isVerified = json['isVerified'];
    isSubscribed = json['isSubscribed'];
    status = json['status'];
    planExpiration = json['planExpiration'];
    subscriptionType = json['subscriptionType'];
    planId = json['planId'];
    totalPayPerJobCount = json['totalPayPerJobCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['businessEmail'] = this.businessEmail;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['isVerified'] = this.isVerified;
    data['isSubscribed'] = this.isSubscribed;
    data['status'] = this.status;
    data['planExpiration'] = this.planExpiration;
    data['subscriptionType'] = this.subscriptionType;
    data['planId'] = this.planId;
    data['totalPayPerJobCount'] = this.totalPayPerJobCount;
    return data;
  }
}
