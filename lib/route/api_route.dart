import 'package:vania/route.dart';
import 'package:vania_template_project/app/http/controllers/user_controller.dart';
import 'package:vania_template_project/app/http/middleware/authenticate.dart';

class ApiRoute extends Route {
  @override
  String prefix = 'api/v1';

  @override
  void register() {
    super.register();
    Router.get("/user", userController.index)
        .middleware([AuthenticateMiddleware(guard: 'user')]);
  }
}
