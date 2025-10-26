import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? email;
  final String? username;
  final List<dynamic>? interests;

  const Data({this.email, this.username, this.interests});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json['email'] as String?,
    username: json['username'] as String?,
    interests: json['interests'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'username': username,
    'interests': interests,
  };

  @override
  List<Object?> get props => [email, username, interests];
}
