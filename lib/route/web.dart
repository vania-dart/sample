import 'package:vania/http/response.dart' show view;
import 'package:vania/route.dart';

class WebRoute extends Route {
  @override
  void register() {
    super.register();
    Router.get("/", () {
      return view('index');
    });
  }
}
