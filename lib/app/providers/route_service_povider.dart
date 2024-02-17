

import 'package:vania/vania.dart';
import 'package:vania_sample/route/api_route.dart';
import 'package:vania_sample/route/web_socket.dart';


class RouteServiceProvider extends ServiceProvider{
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    ApiRoute().register();
    WebSocketRoute().register();
  }

}