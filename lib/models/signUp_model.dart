import 'package:api_app_project/core/api/end_points.dart';
import 'package:api_app_project/models/signIn_model.dart';

class SignUpModel
{
  final String message;

  SignUpModel({required this.message});
  factory SignUpModel.fromJson(Map<String , dynamic> jsonData)
  {
    return SignUpModel(message: jsonData[ApiKeys.message]);
  }
}