import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? email;
  final String? username;
  final String? name;
  final String? birthday;
  final String? horoscope;
  final String? zodiac;
  final int? height;
  final int? weight;
  final List<dynamic>? interests;

  const Data({
    this.email,
    this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    this.interests,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json['email'] as String?,
    username: json['username'] as String?,
    name: json['name'] as String?,
    birthday: json['birthday'] as String?,
    horoscope: json['horoscope'] as String?,
    zodiac: json['zodiac'] as String?,
    height: json['height'] as int?,
    weight: json['weight'] as int?,
    interests: (json['interests'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'username': username,
    'name': name,
    'birthday': birthday,
    'horoscope': horoscope,
    'zodiac': zodiac,
    'height': height,
    'weight': weight,
    'interests': interests,
  };

  @override
  List<Object?> get props {
    return [
      email,
      username,
      name,
      birthday,
      horoscope,
      zodiac,
      height,
      weight,
      interests,
    ];
  }
}
