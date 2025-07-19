import 'package:vania/service_provider.dart';
import 'package:vania_template_project/route/api_route.dart';
import 'package:vania_template_project/route/web.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    ApiRoute().register();
    WebRoute().register();
  }
}
