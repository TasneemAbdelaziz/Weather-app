import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';
import 'package:weather_app/core/theme/app_pallet.dart';
import 'package:weather_app/features/auth/presntation/bloc/auth_bloc.dart';
import 'package:weather_app/features/auth/presntation/pages/signin_page.dart';
import 'package:weather_app/features/auth/presntation/widgets/auth_button.dart';
import 'package:weather_app/features/auth/presntation/widgets/auth_field.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';

class SignUp extends StatefulWidget {
  static const routeName = "SignUp";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    SnackBar(
                      content: Text(state.message ?? ""),
                      backgroundColor: Colors.red,
                    );
                  }
                  if (state is AuthLoading) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                      title: 'Signing Up',
                      text: 'Please wait...',
                    );
                  }
                  if (state is AuthSuccess) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: 'Sign-Up Successful',
                      text: 'Welcome!',
                      autoCloseDuration: const Duration(seconds: 2),
                    );

                    // Navigate after delay to allow user to see success alert
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
                    });
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text("CREATE NEW ACCOUNT"),
                        SizedBox(
                          height: 40,
                        ),
                        AuthField(
                          headName: "Full Name",
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthField(
                          headName: "Email",
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthField(
                          headName: "Password",
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthButton(
                          buttomText: "Sign Up",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthSignUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim()));
                              // QuickAlert.show(
                              //   context: context,
                              //   type: QuickAlertType.success,
                              //   title: 'Sign-Up Successful',
                              //   text: 'Welcome, ${nameController.text.trim()}!',
                              //   showCancelBtn: false,
                              //   showConfirmBtn: false,
                              //   autoCloseDuration: Duration(seconds: 2),
                              // );
                              // setState(() {
                              //
                              // });
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignIn.routeName);
                            },
                            child: Text("HAVE AN ACCOUNT ?"))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
