import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:find_my_work/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:find_my_work/presentation/routes/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                const SizedBox(height: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Please enter your registration email and password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email), labelText: 'Email'),
                      autocorrect: false,
                      onChanged: (value) => context
                          .read<SignInFormBloc>()
                          .add(SignInFormEvent.emailChanged(value)),
                      validator: (_) => context
                          .read<SignInFormBloc>()
                          .state
                          .emailAddress
                          .value
                          .fold(
                              (f) => f.maybeMap(
                                    invalidEmail: (_) => "Invalid Email",
                                    orElse: () => null,
                                  ),
                              (_) => null),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                      ),
                      autocorrect: false,
                      obscureText: true,
                      onChanged: (value) => context
                          .read<SignInFormBloc>()
                          .add(SignInFormEvent.passwordChanged(value)),
                      validator: (_) => context
                          .watch<SignInFormBloc>()
                          .state
                          .password
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => "Short Password",
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          '#1dbf73'.toColor(),
                        ),
                      ),
                      onPressed: () {
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithEmailAndPasswordPressed());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(value: null),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
