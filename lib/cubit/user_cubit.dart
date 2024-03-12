import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  //SignIn
  GlobalKey <FormState> signInFormKey = GlobalKey();
  TextEditingController emailSignIn = TextEditingController();
  TextEditingController password = TextEditingController();
  //SignUp
  GlobalKey <FormState> signUpFormKey   = GlobalKey();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController nameSgnUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController ConfirmPasswordSignUp = TextEditingController();

}

SignIn()
{
  

}