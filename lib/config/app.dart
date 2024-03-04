import 'package:vania/vania.dart';
import 'package:vania_sample/app/providers/route_service_povider.dart';

import 'auth.dart';
import 'cors.dart';
import 'database.dart';

Map<String, dynamic> config = {
  'name': 'applicationName',
  'key': 'applicationKey',
  'port': 8000,
  'host': '127.0.0.1',
  'debug': true,
  'url': '',
  'timezone': '',
  'websocket': false,
  'cors': cors,
  'database': null,//databaseConfig,
  'cache': CacheConfig(),
  'auth':authConfig,
  'storage': FileStorageConfig(),
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};
