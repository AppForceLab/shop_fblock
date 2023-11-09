import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/app_blocs.dart';
import 'package:shop_fblock/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:shop_fblock/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlockProvisers => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
