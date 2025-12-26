class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? businessEmail;
  final String? city;
  final String? country;
  final String? state;
  final String? zipCode;
  final String? address;
  final String? phone;
  final String? profilePic;
  final String? role;
  final bool? isVerified;
  final bool? isSubscribed;
  final String? status;
  final String? planExpiration;
  final String? subscriptionType;
  final String? planId;
  final int? totalPayPerJobCount;

  UserModel({
    this.id,
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
    this.totalPayPerJobCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      email: json['email'],
      businessEmail: json['businessEmail'],
      city: json['city'],
      country: json['country'],
      state: json['state'],
      zipCode: json['zipCode'],
      address: json['address'],
      phone: json['phone'],
      profilePic: json['profilePic'],
      role: json['role'],
      isVerified: json['isVerified'],
      isSubscribed: json['isSubscribed'],
      status: json['status'],
      planExpiration: json['planExpiration'],
      subscriptionType: json['subscriptionType'],
      planId: json['planId'],
      totalPayPerJobCount: json['totalPayPerJobCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'businessEmail': businessEmail,
      'city': city,
      'country': country,
      'state': state,
      'zipCode': zipCode,
      'address': address,
      'phone': phone,
      'profilePic': profilePic,
      'role': role,
      'isVerified': isVerified,
      'isSubscribed': isSubscribed,
      'status': status,
      'planExpiration': planExpiration,
      'subscriptionType': subscriptionType,
      'planId': planId,
      'totalPayPerJobCount': totalPayPerJobCount,
    };
  }
}
