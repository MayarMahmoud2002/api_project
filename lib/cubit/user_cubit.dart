import 'dart:math';

import 'package:api_app_project/cache/cache_helper.dart';
import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/core/api/end_points.dart';
import 'package:api_app_project/core/errors/exceptions.dart';
import 'package:api_app_project/models/signIn_model.dart';
import 'package:api_app_project/models/signUp_model.dart';
import 'package:api_app_project/models/user_model.dart';
import 'package:api_app_project/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api, this.userRepository) : super(UserInitial());
  final UserRepository userRepository;

  final DioConsumer api;
  SignInModel? user;
  SignUpModel? userSignUp;

  GlobalKey<FormState> signInForm = GlobalKey();
  TextEditingController emailSignIn = TextEditingController();
  TextEditingController passwordSignIn = TextEditingController();

  //******************************************************************
  GlobalKey<FormState> signUpForm = GlobalKey();
  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneNumberSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController confirmPasswordSignUp = TextEditingController();

  Future SignIn() async {
    emit(SignUpLoading());
    final response = await userRepository.SignIn(
        email: emailSignIn.text, password: passwordSignIn.text);
    response.fold((SignInModel) => emit(SignInSuccess()),
            (errorMessage) => emit(SignInFailure(errorMessage: errorMessage)));
  }

  Future SignUp() async {
    emit(SignUpLoading());
    final response = await userRepository.SignUp(
        name: nameSignUp.text,
        email: emailSignUp.text,
        phone: phoneNumberSignUp.text,
        password: passwordSignUp.text,
        confirmPassword: confirmPasswordSignUp.text);
    response.fold((SignUpModel) =>
        emit(SignUpSuccess(message: SignUpModel.message)), (
        errorMessage) => emit(SignInFailure(errorMessage: errorMessage)));
  }

  Future UserProfile() async {
  userRepository.UserProfile();
  }
}
