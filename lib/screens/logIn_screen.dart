import 'dart:math';
import 'package:api_app_project/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/dont_have_an_account.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success')));
        }else if (state is SignInFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: Column(
              children: [
                Image.asset('assets/images/image.png'),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: context.read<UserCubit>().signInFormKey,
                          child: Column(
                            children: [
                              // const PageHeading(title: 'Sign-in'),
                              //!Email
                              CustomInputField(
                                labelText: 'Email',
                                hintText: 'Your email',
                                controller: context.read<UserCubit>().signInEmail,

                              ),
                              const SizedBox(height: 16),
                              //!Password
                              CustomInputField(
                                labelText: 'Password',
                                hintText: 'Your password',
                                obscureText: true,
                                suffixIcon: true,
                                controller: context.read<UserCubit>().signInPassword,
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(height: 20),
                              state is SignInLoading ? CircularProgressIndicator() : CustomFormButton(
                                innerText: 'Sign In',
                                onPressed: ()
                                {
                                  context.read<UserCubit>().SignIn();
                                },
                              ),
                              const SizedBox(height: 18),
                              DontHaveAnAccountWidget(),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
