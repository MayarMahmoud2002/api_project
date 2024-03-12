import 'package:flutter/material.dart';

import '../screens/signUp_screen.dart';

class DontHaveAnAccountWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account ? ',
            style: TextStyle(
                fontSize: 13,
                color: Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              )
            },
            child: const Text(
              'Sign-up',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff748288),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

