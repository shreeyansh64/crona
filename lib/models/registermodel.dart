class RegisterModel {
  final int statusCode;
  final RegisterData? data;
  final String message;
  final bool success;

  RegisterModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        statusCode: json['statusCode'],
        data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
        message: json['message'],
        success: json['success'],
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'data': data?.toJson(),
        'message': message,
        'success': success,
      };
}

class RegisterData {
  final String id, email, fullName, username;
  final bool isEmailVerified;
  final int v;
  final DateTime createdAt, updatedAt;

  RegisterData({
    required this.id,
    required this.email,
    required this.isEmailVerified,
    required this.v,
    required this.createdAt,
    required this.fullName,
    required this.updatedAt,
    required this.username,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        id: json['_id'],
        email: json['email'],
        isEmailVerified: json['isEmailVerified'],
        v: json['__v'],
        createdAt: DateTime.parse(json['createdAt']),
        fullName: json['fullName'],
        updatedAt: DateTime.parse(json['updatedAt']),
        username: json['username'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'isEmailVerified': isEmailVerified,
        '__v': v,
        'createdAt': createdAt.toIso8601String(),
        'fullName': fullName,
        'updatedAt': updatedAt.toIso8601String(),
        'username': username,
      };
}
