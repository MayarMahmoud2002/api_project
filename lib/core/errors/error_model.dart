import 'package:api_app_project/core/api/end_points.dart';

class ErrorModel
{
  int status;
  String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map <String , dynamic> jsonData)
  {
    return ErrorModel(
        status: jsonData[ApiKeys.status],
        errorMessage: jsonData[ApiKeys.errorMessage],
    );
  }
}