import 'package:auto_route/auto_route.dart';
import 'package:find_my_work/application/auth/auth_bloc.dart';
import 'package:find_my_work/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:find_my_work/presentation/routes/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => "Cancelled",
                  serverError: (_) => "Server Error",
                  emailAlreadyInUse: (_) => "Email already in use",
                  invalidEmailAndPasswordCombination: (_) =>
                      "Invalid email and password",
                ),
              ).show(context),
            },
            (_) => {
              ExtendedNavigator.of(context)!
                  .replace(NotesOverviewPageRoute.name),
              context.read<AuthBloc>().add(const AuthEvent.authCheckRequested())
            },
          ),
        );
      },
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
                      'Welcome to ....',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                            .signInWithEmailAndPasswordPressed());
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'or via Google',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          '#0FA7F6'.toColor(),
                        ),
                      ),
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                            const SignInFormEvent.signInWithGooglePressed());
                      },
                      child: const Text(
                        'Sign In With Google',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 0)),
                          ),
                          onPressed: () {
                            ExtendedNavigator.of(context)!
                                .push(SignInPageRoute.name);
                            ExtendedNavigator.of(context)!
                                .push(SignUpPageRoute.name);
                            // context.read<SignInFormBloc>().add(
                            //     const SignInFormEvent
                            //         .registerWithEmailAndPasswordPressed());
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Color(0xFF1dbf73)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 0)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Color(0xFF1dbf73)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
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
