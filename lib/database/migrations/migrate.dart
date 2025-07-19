import 'dart:io';
import 'package:vania/migration.dart';
import '../../config/database.dart';
import 'create_user_table.dart';
import 'create_personal_access_tokens_table.dart';

void main(List<String> args) async {
  try {
    await MigrationConnection().setup(database);
    await MigrationRunner().migrationRegister([
      CreateUserTable(),
      CreatePersonalAccessTokensTable(),
    ]).run(args);
    await MigrationConnection().connection?.close();
  } catch (e) {
    print('Migration failed: $e');
    exit(0);
  } finally {
    exit(0);
  }
}
