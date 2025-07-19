import 'package:vania/orm/model.dart';

class User extends Model {
  @override
  List<String> fillable = ['email', 'password','first_name','last_name'];

  @override
  List<String> hidden = ['password'];
}
