// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  void handlerSignIn(String type) {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
      }
    } catch (e) {}
  }
}
