import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/app_pallet.dart';
import 'package:weather_app/features/auth/presntation/bloc/auth_bloc.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String userName ='user';
        if(state is AuthSuccess){
          userName = state.user.name;
        }
        return Column(
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppPallet.buttonColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,)
            ],

        );
      },
    );
  }
}
