import 'package:api_app_project/core/api/end_points.dart';

class ErrorModel {
  int error;
  String errorMessage;

  ErrorModel({required this.error, required this.errorMessage});

  factory ErrorModel.fromJson(Map <String, dynamic> jsonData)
  {
    return ErrorModel(
        error:jsonData[ApiKey.status],
        errorMessage: jsonData [ApiKey.errorMessage],
    );
  }
}