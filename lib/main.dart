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
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/init_dependencies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependices();
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
          create:(_)=> serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create:(_)=> serviceLocator<WeatherBloc>(),
        )
      ], child: const MyApp())
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    });
  }
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
        HomePage.routeName:(_)=> const HomePage(),
        SignUp.routeName: (_) => const SignUp(),
        SignIn.routeName: (_) => const SignIn(),
      },
    );
  }
}

