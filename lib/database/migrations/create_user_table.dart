import 'package:vania/migration.dart';

class CreateUserTable extends Migration {
  @override
  Future<void> up() async {
    await create('users', (Schema table) {
      table.id();
      table.timeStamps();
    });
  }

  @override
  Future<void> down() async {
    await drop('users');
  }
}
