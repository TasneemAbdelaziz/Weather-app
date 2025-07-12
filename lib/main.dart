import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/secrets/app_secrets.dart';
import 'package:weather_app/core/theme/theme.dart';
import 'package:weather_app/features/auth/data/datasoures/supabase_datasource.dart';
import 'package:weather_app/features/auth/data/repositries/auth_repository_impl.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_in.dart';
import 'package:weather_app/features/auth/domain/usecase/user_sign_up.dart';
import 'package:weather_app/features/auth/presntation/bloc/auth_bloc.dart';
import 'package:weather_app/features/auth/presntation/pages/signin_page.dart';
import 'package:weather_app/features/auth/presntation/pages/signup_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   final supabse = await  Supabase.initialize(url: AppSecrets.SupabaseUrl, anonKey: AppSecrets.SupabaseAnnokey);
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_)=>AuthBloc(userSignIn: UserSignIn(AuthRepositoryImpl(SupabaseDatasourceImpl(supabse.client))),userSignUp: UserSignUp(AuthRepositoryImpl(SupabaseDatasourceImpl(supabse.client)))))
      ], child: const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: SignUp(),


      initialRoute: SignUp.routeName,

      routes: {
        SignUp.routeName: (_) => const SignUp(),
        SignIn.routeName: (_) => const SignIn(),

      },
    );
  }
}

