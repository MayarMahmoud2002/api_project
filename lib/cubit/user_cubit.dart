import 'package:api_app_project/cache/cache_helper.dart';
import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/core/errors/exceptions.dart';
import 'package:api_app_project/models/signIn_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import '../core/api/end_points.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
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

  SignInModel? user;

  Future SignIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoints.signInUrl, data: {
        ApiKeys.emailKey: signInEmail.text,
        ApiKeys.passwordKey: signInPassword.text,
      });
      if (response != null)
      {
        user =  SignInModel.fromJson(response);
        final DecodedToken = JwtDecoder.decode(user!.token);
        CacheHelper().saveData(key: ApiKeys.tokenKey, value: user!.token);
        CacheHelper().saveData(key: ApiKeys.userIdKey, value:DecodedToken[ApiKeys.userIdKey]);
        emit(SignInSuccess());
      }else
      {
        emit(SignInFailure(error: "Response is null"));
      }

    } on ServerExceptions catch (e) {
      emit(SignInFailure(error: e.errorModel.toString()));
    }
  }
}
