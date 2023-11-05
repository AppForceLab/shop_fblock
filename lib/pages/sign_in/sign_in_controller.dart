// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            ///
          }
          var user = credential.user;
          if (user != null) {
            //
          } else {
            //
          }
        } catch (e) {
          //
        }
      }
    } catch (e) {
      //
    }
  }
}
