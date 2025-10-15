class LoginResponse {
  final int statusCode;
  final UserData data;
  final String message;
  final bool success;

  LoginResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'] ?? 0,
      data: UserData.fromJson(json['data']),
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }
}

class UserData {
  final String id;
  final String email;
  final bool isEmailVerified;
  final String username;
  final String phoneNumber;
  final String fullName;
  final DateTime dob;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserData({
    required this.id,
    required this.email,
    required this.isEmailVerified,
    required this.username,
    required this.phoneNumber,
    required this.fullName,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      isEmailVerified: json['isEmailVerified'] ?? false,
      username: json['username'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      fullName: json['fullName'] ?? '',
      dob: DateTime.tryParse(json['DOB'] ?? '') ?? DateTime(1970),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime(1970),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime(1970),
      v: json['__v'] ?? 0,
    );
  }
}
