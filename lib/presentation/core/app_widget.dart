import 'package:auto_route/auto_route.dart';
import 'package:find_my_work/application/auth/auth_bloc.dart';
import 'package:find_my_work/presentation/routes/router.gr.dart' as r;
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_my_work/injection.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application

  final _appRouter = r.Router();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'app name',
        debugShowCheckedModeBanner: true,
        home: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFF1dbf73),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1dbf73), width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
