import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/core/api/end_points.dart';
import 'package:api_app_project/core/errors/exceptions.dart';
import 'package:api_app_project/models/signIn_model.dart';
import 'package:api_app_project/models/signUp_model.dart';
import 'package:api_app_project/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final DioConsumer api;
  SignInModel? user;
  SignUpModel? userSignUp;

  GlobalKey <FormState> signInForm =  GlobalKey();
  TextEditingController emailSignIn = TextEditingController();
  TextEditingController passwordSignIn = TextEditingController();
  //******************************************************************
  GlobalKey <FormState> signUpForm =  GlobalKey();
  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneNumberSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController confirmPasswordSignUp = TextEditingController();



  Future SignIn() async
  {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoints.signInUrl, data:
      {
        ApiKeys.email: emailSignIn.text,
        ApiKeys.password : passwordSignIn.text,
      });
      emit(SignInSuccess());
      print (response);

      user = SignInModel.fromJson(response);
     final DecodedToken = JwtDecoder.decode(user!.token);
     final id = DecodedToken['id'];
      final role = DecodedToken['role'];
      print ("your id is ${id}");
      print ("your role is ${role}");

    }on ServerExceptions catch (e)
    {
      emit(SignInFailure(errorMessage: e.errorModel.errorMessage));
      print (e.toString());
    }
  }
  Future SignUp() async
  {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoints.signUpUrl,
          isFormData: true,
          data:
          {
            ApiKeys.name = nameSignUp.text,
            ApiKeys.email = emailSignUp.text,
            ApiKeys.phone = phoneNumberSignUp.text,
            ApiKeys.password = passwordSignUp.text,
            ApiKeys.confirmPassword = confirmPasswordSignUp.text,
            ApiKeys.location = '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          }
      );
      emit(SignInSuccess());
      print(response);
      userSignUp = SignUpModel.fromJson(response) ;
      print ('the user for SignUp ${userSignUp}');
    } on ServerExceptions catch (e)
    {
      emit(SignInFailure(errorMessage: e.errorModel.errorMessage));
      print (e.toString());

    }}
  Future UserProfile () async
  {
    try {
      emit(UserProfileLoading());
      //put cache helper for id
      final response = api.get(EndPoints.getUserData(id),
          data:
          {

          }
      );
      emit(UserProfileSuccess(user: UserModel.fromJson(response as Map<String, dynamic>)));
    }on ServerExceptions catch(e)
    {
      emit(UserProfileFailure(errorMessage: e.errorModel.errorMessage));
    }


    
  }

}


