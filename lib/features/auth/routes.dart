import 'package:vania/route.dart';
import 'package:vania_template_project/features/auth/http/controllers/login_controller.dart';

class AuthRoute extends Route {
  @override
  String prefix = 'api/v1';

  @override
  void register() {
    super.register();
    Router.get("/login", loginController.index);
  }
}
