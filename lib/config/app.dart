import 'package:vania/service_provider.dart';
import 'package:vania/vania.dart' show env;
import 'package:vania_template_project/app/providers/mongodb_service_provider.dart';
import 'package:vania_template_project/app/providers/route_service_provider.dart';

import 'auth.dart';
import 'cors.dart';

Map<String, dynamic> config = {
  'name': env('APP_NAME'),
  'url': env('APP_URL'),
  'cors': cors,
  'auth': authConfig,
  'csrf_except': ['*'],
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
    MongodbServiceProvider(),
  ],
};
