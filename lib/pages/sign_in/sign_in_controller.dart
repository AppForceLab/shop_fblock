// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/common/widgets/flutter_toast.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  SignInController({
    required this.context,
  });

  final BuildContext context;

  Future<void> handlerSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        print('${emailAddress} ${password}');
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'Fill email adress');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'Enter password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "User don't exist");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
          }
          var user = credential.user;
          if (user != null) {
            toastInfo(msg: "User ok");
          } else {
            toastInfo(msg: "No such user");
          }
        } on FirebaseAuthException catch (e) {
          print(e);
          if (e.code == 'user-not-found') {
            toastInfo(msg: "User-not-found");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid-email");
          }
          // else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          //   toastInfo(msg: "INVALID_LOGIN_CREDENTIALS");
          // }
        }
      }
    } catch (err) {
      print('ERROR HERE -> ${err}');
    }
  }
}
