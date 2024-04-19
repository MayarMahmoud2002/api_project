import 'package:api_app_project/core/api/end_points.dart';

class UserModel {
  final String profileImage;
  final String name;
  final String phone;
  final String email;
  final Map<String, dynamic> location;

  UserModel({required this.profileImage,
      required this.name,
      required this.phone,
      required this.email,
      required this.location});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        profileImage : jsonData[ApiKeys.profilePic],
        name: jsonData['user'][ApiKeys.name],
        phone: jsonData['user'][ApiKeys.phone],
        email: jsonData['user'][ApiKeys.email],
        location: jsonData['user'][ApiKeys.location]);
  }

}
