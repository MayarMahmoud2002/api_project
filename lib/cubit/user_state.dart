part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class SignInLoading extends UserState {}
class SignInSuccess extends UserState {}
class SignInFailure extends UserState
{
   final String errorMessage;

   SignInFailure({required this.errorMessage});
}
//--------------------------------------------
class SignUpLoading extends UserState {}
class SignUpSuccess extends UserState
{
   final String message;

   SignUpSuccess({required this.message});
}
class SignUpFailure extends UserState
{
   final String errorMessage;

   SignUpFailure({required this.errorMessage});
}

//---------------------------------------------
class UserProfileLoading extends UserState {}
class UserProfileSuccess extends UserState
{
   final UserModel user;

   UserProfileSuccess({required this.user});
}
class UserProfileFailure extends UserState
{
   final String errorMessage;

   UserProfileFailure({required this.errorMessage});
}

