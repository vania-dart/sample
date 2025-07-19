import 'package:vania/migration.dart';

class CreateUserTable extends Migration {
  @override
  Future<void> up() async {
    await create('users', (Schema table) {
      table.id();
      table.string('first_name').nullable();
      table.string('last_name').nullable();
      table.string('email').unique().notNull();
      table.string('password').notNull();
      table.timeStamps();
    });
  }

  @override
  Future<void> down() async {
    await drop('users');
  }
}
