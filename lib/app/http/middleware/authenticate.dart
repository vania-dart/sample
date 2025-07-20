import 'package:vania/authentication.dart';
import 'package:vania/http/middleware.dart';
import 'package:vania/http/request.dart';
import 'package:vania/vania.dart' show abort;

class AuthenticateMiddleware extends Middleware {
  String? guard;
  AuthenticateMiddleware({this.guard});
  @override
  Future handle(Request req) async {
    String? token = req.header('authorization')?.replaceFirst('Bearer ', '');
    try {
      if (guard == null) {
        await Auth().check(token ?? '', isCustomToken: true);
      } else {
        await Auth().guard(guard!).check(token ?? '', isCustomToken: true);
      }
    } catch (_) {
      abort(401, 'Unauthorized access. Please log in to continue.');
    }
  }
}
