import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_events.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_states.dart';
import 'package:shop_fblock/pages/sign_in/sign_in_controller.dart';
import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(title: 'Log In'),
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildThirdPartyLogin(context),
                        Center(
                            child: reusableText(
                                'Or use you email acount to login')),
                        Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          margin: EdgeInsets.only(
                            top: 36.h,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText('Email'),
                                SizedBox(
                                  height: 5.h,
                                ),
                                buildTextField(
                                    'Enter your email adsress', 'email', 'user',
                                    (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(EmailEvent(value));
                                }),
                                reusableText('Password'),
                                SizedBox(
                                  height: 5.h,
                                ),
                                buildTextField(
                                  'Enter your password adsress',
                                  'password',
                                  'lock',
                                  (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(PasswordEvent(value));
                                  },
                                ),
                              ]),
                        ),
                        forgotPassword(),
                        buildLogInAndRegButton('Log in', 'login', () {
                          SignInController(context: context)
                              .handlerSignIn("email");
                        }),
                        buildLogInAndRegButton('Register', 'register', () {
                          Navigator.of(context).pushNamed('register');
                        }),
                      ]),
                )),
          ),
        );
      },
    );
  }
}
