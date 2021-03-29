import 'package:auto_route/auto_route.dart';
import 'package:find_my_work/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:find_my_work/presentation/routes/router.gr.dart';
import 'package:find_my_work/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_my_work/injection.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>
                ExtendedNavigator.of(context)!.pop(SignUpPageRoute.name),
          ),
          title: const Center(
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.black12,
              height: 1.0,
            ),
          )),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignUpForm(),
      ),
    );
  }
}
