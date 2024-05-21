import 'package:vania/vania.dart';
import 'package:vania_sample/app/http/controllers/home_controller.dart';
import 'package:vania_sample/app/http/middleware/authenticate.dart';
import 'package:vania_sample/app/http/middleware/error_response.dart';
import 'package:vania_sample/app/http/middleware/home_middleware.dart';
import 'package:vania_sample/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    // Define the base route prefix for API endpoints
    Router.basePrefix('api');

    // Route to fetch home data
    Router.get("/home", homeController.index);

    // Route for a simple "Hello World" response with middleware for Home
    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);

    // Route to handle wrong requests with a JSON response and error middleware
    Router.get('wrong-request', () => Response.json({'message': 'Hi wrong request'})).middleware([ErrorResponseMiddleware()]);

    // Route to fetch authenticated user data with authentication middleware
    Router.get("/user", () {
      return Response.json(Auth().user());
    }).middleware([AuthenticateMiddleware()]);
  }
}
