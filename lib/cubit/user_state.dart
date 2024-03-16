part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class SignInLoading extends UserState {}
class SignInSuccess extends UserState {}
class SignInFailure extends UserState
{
  final String error;

  SignInFailure({required this.error});
}

class SignUpSuccess extends UserState
{

}
class SignUpLoading extends UserState {}
class SignUpFailure extends UserState
{
  final String error;

  SignUpFailure({required this.error});
}



