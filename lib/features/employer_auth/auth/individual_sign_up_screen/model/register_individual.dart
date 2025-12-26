class RegisterIndividual {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  RegisterIndividual({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory RegisterIndividual.fromJson(Map<String, dynamic> json) {
    return RegisterIndividual(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final String? id;
  final bool? otpSent;
  final String? message;
  final String? type;

  Data({this.id, this.otpSent, this.message, this.type});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      otpSent: json['otpSent'],
      message: json['message'],
      type: json['type'],
    );
  }
}
