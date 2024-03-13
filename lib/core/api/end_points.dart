class EndPoints
{
  static String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static String signInUrl = '${baseUrl}user/signin';
  static String signUpUrl = '${baseUrl}user/signup';
  static String checkEmail = '${baseUrl}user/check-email';
  static String updateUserUrl = '${baseUrl}user/update';
  static String logOutUrl = '${baseUrl}user/logout';
}

class ApiKey
{
  static String status = 'status';
  static String errorMessage = 'ErrorMessage';
  static String token = 'token';
  static String id = 'id';
}