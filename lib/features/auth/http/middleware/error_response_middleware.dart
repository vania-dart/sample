import 'package:vania/http/middleware.dart';
import 'package:vania/http/request.dart';
import 'package:vania/vania.dart' show abort;

class ErrorResponseMiddleware extends Middleware {
  @override
  handle(Request req) async {
    if (req.header('content-type') != 'application/json') {
      abort(400, 'Your request is not valid');
    }
  }
}
