import 'package:vania/migration.dart';

class CreatePersonalAccessTokensTable extends Migration {
  @override
  Future<void> up() async {
    await create('personal_access_tokens', (Schema table) {
      table.id();
      table.tinyText('name');
      table.bigInt('tokenable_id');
      table.string('token').unique();
      table.timeStamp('last_used_at').nullable();
      table.timeStamps();
      table.timeStamp('deleted_at').nullable();
    });
  }

  @override
  Future<void> down() async {
    await drop('personal_access_tokens');
  }
}