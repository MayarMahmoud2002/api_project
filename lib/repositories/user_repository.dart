import 'package:api_app_project/core/api/api_consumer.dart';
import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../cache/cache_helper.dart';
import '../core/api/end_points.dart';
import '../core/errors/exceptions.dart';
import '../models/signIn_model.dart';
import '../models/signUp_model.dart';
import '../models/user_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  // make this method return more than one Return Type => using dartz

  Future<Either<SignInModel, String>> SignIn(
      {required String email, required String password}) async {
    try {
      final response = await api.post(EndPoints.signInUrl, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });
      print(response);
      final user = SignInModel.fromJson(response);
      final DecodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKeys.token, value: user!.token);
      CacheHelper().saveData(key: ApiKeys.id, value: DecodedToken[ApiKeys.id]);

      final id = DecodedToken['id'];
      final role = DecodedToken['role'];
      print("your id is ${id}");
      print("your role is ${role}");
      return Left(user);
    } on ServerExceptions catch (e) {
      return right(e.errorModel.errorMessage);
    }
  }

  Future<Either<SignUpModel, String>> SignUp( {required String name, required String email,
      required String phone,
      required String password,
      required String confirmPassword}) async {
    try {
      final response =
          await api.post(EndPoints.signUpUrl, isFormData: true, data: {
        ApiKeys.name = name,
        ApiKeys.email = email,
        ApiKeys.phone = phone,
        ApiKeys.password = password,
        ApiKeys.confirmPassword = confirmPassword,
        ApiKeys.location =
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
      });
      print(response);
      final userSignUp = SignUpModel.fromJson(response);
      print('the user for SignUp ${userSignUp}');
      return Left(userSignUp);
    } on ServerExceptions catch (e) {
      return Right(e.errorModel.errorMessage);
    }
  }
  Future<Either <UserModel , String>> UserProfile () async
  {
    try {
      final response = api.get(EndPoints.getUserData(CacheHelper().getData(key: ApiKeys.id)),

      );
      return left(UserModel.fromJson(response as Map<String, dynamic>));
    }on ServerExceptions catch(e)
    {
      return right(e.errorModel.errorMessage);
    }
  }

}
