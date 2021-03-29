import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:find_my_work/presentation/notes/note_overview/notes_overview_page.dart';
import 'package:find_my_work/presentation/sign_in/sign_in_page.dart';
import 'package:find_my_work/presentation/sign_up/sign_up_page.dart';
import 'package:find_my_work/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: NotesOverviewPage),
  ],
)
class $Router {}
