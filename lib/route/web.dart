import 'package:vania/vania.dart';

class WebRoute implements Route {
  @override
  void register() {
    // Define a route for the root path
    Router.get("/", () {
      // Return an HTML response with a welcoming message
      return Response.html(
          '<span>Hello World, welcome to Fullstack development with Vania</span>');
    });
  }
}
