import 'package:vania/authentication.dart';
import 'package:vania/http/controller.dart';
import 'package:vania/http/request.dart';
import 'package:vania/http/response.dart';
import 'package:vania_template_project/app/models/user.dart';

class UserController extends Controller {
  Future<Response> index() async {
    final user = Auth().user();
    user.remove('password');
    return Response.json(user);
  }

  Future<Response> update(Request request) async {
    await request.validate({
      'first_name': 'required',
      'last_name': 'required'
    }, {
      'first_name.required': 'First name is required.',
      'last_name.required': 'Last name is required.',
    });

    final userId = Auth().id();

    await User().query.whereEqualTo('id', userId).update({
      'first_name': request.input('first_name'),
      'last_name': request.input('last_name'),
    });

    return Response.json({'messages': 'User details updated successfully.'});
  }
}

final UserController userController = UserController();
