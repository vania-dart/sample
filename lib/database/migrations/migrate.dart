import 'dart:io';
import 'package:vania/migration.dart';
import 'package:vania_template_project/database/migrations/create_user_table.dart';
import '../../config/database.dart';

void main(List<String> args) async {
  try {
    await MigrationConnection().setup(database);
    await MigrationRunner().migrationRegister([CreateUserTable()]).run(args);
    await MigrationConnection().connection?.close();
  } catch (e) {
    print('Migration failed: $e');
    exit(0);
  } finally {
    exit(0);
  }
}
