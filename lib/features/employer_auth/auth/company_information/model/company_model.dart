class CompanyModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  CompanyModel({this.success, this.statusCode, this.message, this.data});

  CompanyModel.fromJson(Map<String, dynamic> json) {
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
        this.updatedAt});

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
    return data;
  }
}
