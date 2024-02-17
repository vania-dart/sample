import 'package:vania/vania.dart';


DatabaseConfig databaseConfig = DatabaseConfig(
    driver: MysqlDriver(),
    host: '127.0.0.1',
    database: 'vania',
    username: 'root',
    password: '123456',
    port: 3306
  );