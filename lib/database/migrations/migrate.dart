import 'dart:io';
import 'package:vania/vania.dart';
import 'create_user_table.dart';

void main() async {
  await MigrationConnection().setup();
  await Migrate().registry();
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreateUserTable().up();
  }

    dropTables() async {
		 await CreateUserTable().down();
	 }
}
