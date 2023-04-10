part of 'routes.dart';

class NavigationGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final session = SessionServices();
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => DashboardScreen(
            user: session.readUserSession(),
          ),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/visiting':
        return MaterialPageRoute(
          builder: (_) => VisitingScreen(
            user: session.readUserSession(),
          ),
        );
      case '/completed':
        return MaterialPageRoute(
          builder: (_) => const CompletedScreen(),
        );
      case '/process':
        return MaterialPageRoute(
          builder: (_) => const ProcessScreen(),
        );
      case '/onsite':
        return MaterialPageRoute(
          builder: (_) => const OnsiteScreen(),
        );
      case '/reschedule':
        return MaterialPageRoute(
          builder: (_) => const RescheduleScreen(),
        );
      case '/detail_visiting':
        if (arguments is TroubleModel) {
          return MaterialPageRoute(
            builder: (_) => DetailVisitingScreen(
              trouble: arguments,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => DetailVisitingScreen(),
        );
      case '/notification':
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case '/maps':
        if (arguments is TroubleModel) {
          return MaterialPageRoute(
            builder: (_) => MapsScreen(
              trouble: arguments,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => MapsScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(
            user: session.readUserSession(),
          ),
        );
      case '/change-profile':
        return MaterialPageRoute(
          builder: (_) => ChangeProfileScreen(
            user: session.readUserSession(),
          ),
        );
      case '/change-password':
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      case '/change-email':
        return MaterialPageRoute(
          builder: (_) => ChangeEmailScreen(
            user: session.readUserSession(),
          ),
        );
      case '/create-record':
        if (arguments is TroubleModel) {
          return MaterialPageRoute(
            builder: (_) => UpsScreen(
              trouble: arguments,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => UpsScreen(),
        );
      case '/success':
        if (arguments is SuccessModels) {
          return MaterialPageRoute(
            builder: (_) => SuccessScreen(
              success: arguments,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => SuccessScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Opps"),
        ),
        body: const Center(
          child: Text('Halaman tidak ditemukan'),
        ),
      );
    });
  }
}
