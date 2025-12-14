import 'package:go_router/go_router.dart';
import '../../features/users/presentation/pages/user_page.dart';
import '../../features/prefs/presentation/pages/pref_list_page.dart';
import '../../features/prefs/presentation/pages/pref_form_page.dart';
import '../../features/prefs/presentation/pages/prefs_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/api-list',
  routes: [
    GoRoute(path: '/api-list', builder: (context, state) => const UserPage()),
    GoRoute(
      path: '/prefs',
      builder: (context, state) => const PrefsListPage(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const PrefsFormPage(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return PrefsDetailPage(id: id);
          },
        ),
      ],
    ),
  ],
);
