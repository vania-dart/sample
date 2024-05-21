import 'package:vania/vania.dart';
import 'package:vania_sample/route/api_route.dart';
import 'package:vania_sample/route/web.dart';
import 'package:vania_sample/route/web_socket.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {
    // You can add bootstrapping logic here if needed in the future.
  }

  @override
  Future<void> register() async {
    _registerRoutes();
  }

  void _registerRoutes() {
    final webRoute = WebRoute();
    final apiRoute = ApiRoute();
    final webSocketRoute = WebSocketRoute();

    webRoute.register();
    apiRoute.register();
    webSocketRoute.register();
  }
}
