import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';
import 'package:weather_app/features/auth/presntation/pages/signup_page.dart';
import 'package:weather_app/features/auth/presntation/widgets/auth_button.dart';
import 'package:weather_app/features/auth/presntation/widgets/auth_field.dart';

class SignIn extends StatefulWidget {
  static  const routeName = "SignIn";
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text("SIGN UP",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                    Text("START USING YOUR ACCOUNT"),
                    SizedBox(height: 40,),
                    AuthField(headName: "Email",controller: emailController,),
                    SizedBox(height: 20,),
                    AuthField(headName: "Password",controller: passwordController,obscureText: true,),
                    SizedBox(height: 20,),
                    AuthButton(onPressed: (){},buttomText: "Sign in",),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                    }, child: Text("DON'T HAVE AN ACCOUNT ?"))

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
