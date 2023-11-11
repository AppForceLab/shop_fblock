import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_fblock/pages/common_widgets.dart';
// import 'package:shop_fblock/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: 'Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Center(child: reusableText('Enter your details below')),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(
                        top: 36.h,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('User name'),
                            buildTextField(
                                'Enter your user name', 'name', 'user',
                                (value) {
                              // context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            reusableText('Email'),
                            buildTextField(
                                'Enter your email adsress', 'email', 'user',
                                (value) {
                              // context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            reusableText('Password'),
                            buildTextField(
                              'Enter your password adsress',
                              'password',
                              'lock',
                              (value) {
                                // context
                                //     .read<SignInBloc>()
                                //     .add(PasswordEvent(value));
                              },
                            ),
                            reusableText('Confirm Password'),
                            buildTextField(
                              'Enter your password confirmation',
                              'password',
                              'lock',
                              (value) {
                                // context
                                //     .read<SignInBloc>()
                                //     .add(PasswordEvent(value));
                              },
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildLogInAndRegButton('Sign Up', 'login', () {
                      Navigator.of(context).pushNamed('register');
                    }),
                  ]),
            )),
      ),
    );
  }
}
