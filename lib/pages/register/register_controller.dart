import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/common/widgets/flutter_toast.dart';
import 'package:shop_fblock/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({
    required this.context,
  });

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    print('$userName, $email, $password, $rePassword');

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email  can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Password confirmation can not be empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "Pls confirm your email adress");
        print(credential.user);
        Navigator.of(context).pop();
      }
    } on Error catch (ee) {
      print('ERRRRRORRR =  $ee');
    } finally {}
  }
}
