import 'package:vania/route.dart';
import 'package:vania_template_project/app/http/controllers/auth_controller.dart';
import 'package:vania_template_project/app/http/controllers/user_controller.dart';
import 'package:vania_template_project/app/http/middleware/authenticate.dart';

class ApiRoute extends Route {
  @override
  String prefix = 'api/v1';

  @override
  void register() {
    super.register();
    Router.group(() {
      Router.post('/auth/login', authController.login);
      Router.post('/auth/register', authController.register);
      Router.get('/', userController.index).middleware([AuthenticateMiddleware()]);
      Router.put('/', userController.update).middleware([AuthenticateMiddleware()]);;
    }, prefix: 'user');
  }
}
