import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../core/api/api_consumer.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();

  Future SignIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post('https://food-api-omega.vercel.app/api/v1/user/signin', data: {
        'email': signInEmail.text,
        'password': signInPassword.text,
      });
      emit(SignInSuccess());
      print (response);
    }catch (e)
    {
      emit(SignInFailure(error: e.toString()));
      print (e.toString());
    }

  }
}
