import 'package:vania/vania.dart' show env;

Map<String, dynamic> database = {
  "default": env<String>('DB_CONNECTION', 'mysql'),
  "additional_connections": <String>[],
  "connections": {
    'mysql': {
      'driver': 'mysql',
      'host': env<String>('DB_HOST', '127.0.0.1'),
      'port': env<int>('DB_PORT', 3306),
      'database': env<String>('DB_NAME', 'forge'),
      'username': env<String>('DB_USERNAME', 'forge'),
      'password': env<String>('DB_PASSWORD', ''),
      'sslmode': env<bool>('DB_SECURE', false),
      'collation': env<String>('DB_COLLATION', 'utf8mb4_general_ci'),
      'pool': env<bool>('DB_POOL', true),
      'poolsize': env<int>('DB_POOL_SIZE', 1),
    },
    'pgsql': {
      'driver': 'pgsql',
      'host': env<String>('DB_HOST', '127.0.0.1'),
      'port': env<int>('DB_PORT', 5432),
      'database': env<String>('DB_NAME', 'forge'),
      'username': env<String>('DB_USERNAME', 'forge'),
      'password': env<String>('DB_PASSWORD', ''),
      'sslmode': env<bool>('DB_SECURE', false),
      'collation': env<String>('DB_COLLATION', 'utf8'),
      'pool': env<bool>('DB_POOL', false),
      'poolsize': env<int>('DB_POOL_SIZE', 3),
    },
    'sqlite': {
      'driver': 'sqlite',
      'database': env<String>('DB_NAME', 'database.sqlite'),
      'file_path': env<String>('DB_FILE_PATH', ''),
      'openInMemorySQLite': env<bool>('SQLIT_OPEN_IN_MEMORY', false),
    }
  }
};
