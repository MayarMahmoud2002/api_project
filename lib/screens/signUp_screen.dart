import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../widgets/already_have_an_account_widget.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/page_header.dart';
import '../widgets/page_heading.dart';
import '../widgets/pick_image_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text (e.toString())));
        }else if (state is SignUpSuccess)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text ('Sign Up Success')));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<UserCubit>().signUpFormKey,
                child: Column(
                  children: [
                    // const PageHeader(),
                    const PageHeading(title: 'Sign-up'),
                    const PickImageWidget(),
                    const SizedBox(height: 16),
                    //! Name
                    CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your name',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpName,

                    ),
                    const SizedBox(height: 16),
                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpEmail,

                    ),
                    const SizedBox(height: 16),
                    //! Phone Number
                    CustomInputField(
                      labelText: 'Phone number',
                      hintText: 'Your phone number ex:01234567890',
                      isDense: true,
                      controller: context.read<UserCubit>().signUpPhone,

                    ),
                    const SizedBox(height: 16),
                    //! Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<UserCubit>().signUpPassword,

                    ),
                    CustomInputField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<UserCubit>().signUpConfirmPassword,

                    ),
                    const SizedBox(height: 22),
                    state is SignInLoading?CircularProgressIndicator() :
                    CustomFormButton(
                      innerText: 'Signup',
                      onPressed: () {
                        context.read<UserCubit>().SignUp();
                      },
                    ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
