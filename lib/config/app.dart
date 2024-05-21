import 'package:vania/vania.dart';
import 'package:vania_sample/app/providers/route_service_povider.dart';

import 'auth.dart';
import 'cors.dart';
import 'database.dart';

Map<String, dynamic> config = {
  'name': env('APP_NAME'),
  'url': env('APP_URL'),
  'timezone': '',
  'websocket': false,
  'isolate': false,
  'isolateCount': 4,
  'cors': cors,
  'database': null, //databaseConfig,
  'cache': CacheConfig(),
  'auth': authConfig,
  'storage': FileStorageConfig(),
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};
