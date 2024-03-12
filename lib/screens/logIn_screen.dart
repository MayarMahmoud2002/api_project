import 'package:flutter/material.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/dont_have_an_account.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      // key: context.read<UserCubit>().signInFormKey,
                      child: Column(
                        children: [
                          // const PageHeading(title: 'Sign-in'),
                          //!Email
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email',

                          ),
                          const SizedBox(height: 16),
                          //!Password
                          CustomInputField(
                            labelText: 'Password',
                            hintText: 'Your password',
                            obscureText: true,
                            suffixIcon: true,

                          ),
                          const SizedBox(height: 16),
                          //! Forget password?
                          // ForgetPasswordWidget(size: size),
                          const SizedBox(height: 20),
                          //!Sign In Button
                          CustomFormButton(
                            innerText: 'Sign In',
                            onPressed: () {
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

  }
}
