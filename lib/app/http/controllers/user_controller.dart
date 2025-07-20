import 'package:vania/http/controller.dart';
import 'package:vania/http/request.dart';
import 'package:vania/http/response.dart';
import 'package:vania/vania.dart';
import 'package:vania_template_project/app/models/user.dart';

class UserController extends Controller {
  Future<Response> index() async {
    User user = User.fromJson({
      'first_name': 'Vania',
      'last_name': 'Dart',
      'password': Hash().make('password'),
      'email': 'info@vdart.dev',
    });

    if (!await user.exists()) {
      return Response.json(user);
    }

    user = await user.create();

    return Response.json(user);
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(int id) async {
    return Response.json({});
  }
}

final UserController userController = UserController();
