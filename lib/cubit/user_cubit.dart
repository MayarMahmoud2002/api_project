import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/core/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../core/api/end_points.dart';
import '../models/signIn_model.dart';
import 'package:images_picker/images_picker.dart';

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
      final response = await api.post(EndPoints.signInUrl, data:
      {
        ApiKeys.emailKey: signInEmail.text,
        ApiKeys.passwordKey: signInPassword.text,
      });
      print(response);
      emit(SignInSuccess());
    } on ServerExceptions catch (e) {
      emit(SignInFailure(error: e.errorModel.toString()));
    }
  }

  Future SignUp() async {
    try {
      emit(SignInLoading());
     final response =  await api.post(EndPoints.signUpUrl,
        isFormData: true,
        data :
        {
          ApiKeys.nameKey : signUpName.text,
          ApiKeys.emailKey : signUpEmail.text,
          ApiKeys.phoneKey : signUpPhone.text,
          ApiKeys.passwordKey : signUpPassword.text,
          ApiKeys.confirmPasswordKey : signUpPassword.text,
          ApiKeys.locationKey : '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',

        }
      );
      // final SignUpModel = SignInModel.fromJson(response);
      emit(SignUpSuccess());
    }
    on ServerExceptions catch (e)
    {
      emit(SignUpFailure(error: e.errorModel.toString()));
    }
  }

}

//    final DecodedToken = JwtDecoder.decode(user!.token);
//    print (DecodedToken['id']);
//    CacheHelper().saveData(key: ApiKeys.tokenKey, value: user!.token);
//    CacheHelper().saveData(key: ApiKeys.userIdKey, value:DecodedToken[ApiKeys.userIdKey]);
//if (response !=null)
//       {
//         user =  SignInModel.fromJson(response);
//         print (user);
//         emit(SignInSuccess());
//       }
