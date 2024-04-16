class EndPoints
{
  static String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static String signInUrl = '${baseUrl}user/signin';
  static String signUpUrl = '${baseUrl}user/signup';
  static String checkEmailUrl = '${baseUrl}user/check-email';
  static String updateUserUrl = '${baseUrl}user/update';
  static String deleteUserUrl = '${baseUrl}user/delete?id=64a1fa760db6e1f0ad3c52e6';
  static String logOutUrl = '${baseUrl}user/logout';

  static getUserData(id)
  {
    return '${baseUrl}user/get-user/$id';
  }
}

class ApiKeys
{
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";







}