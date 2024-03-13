import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/core/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../core/api/end_points.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.api}) : super(UserInitial());
  final DioConsumer api;

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();


  Future SignIn()async
  {
    try
    {
      emit(SignInLoading());
      final response = await api.post(EndPoints.signInUrl , data:
      {
        ApiKey.email : signInEmail.text,
        ApiKey.password : signInPassword.text,
      });
      emit(SignInSuccess());
      print(response.toString());
    }on ServerExceptions catch (e)
    {
      emit(SignInFailure(error: e.errorModel.toString()));
    }



  }

}


