import 'package:vania/service_provider.dart';
import 'package:vania_template_project/features/auth/routes.dart';

class AuthRouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    AuthRoute().register();
  }
}
