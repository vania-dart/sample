import 'package:vania/vania.dart';
import 'package:vania_sample/app/providers/route_service_povider.dart';

import 'auth.dart';
import 'cros.dart';
import 'database.dart';

Map<String, dynamic> config = {
  'name': 'applicationName',
  'key': 'applicationKey',
  'port': 8000,
  'host': '0.0.0.0',
  'debug': true,
  'url': '',
  'timezone': '',
  'websocket': true,
  'cros': cros,
  'database': databaseConfig,
  'cache': CacheConfig(),
  'auth':authConfig,
  'storage': FileStorageConfig(),
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};
