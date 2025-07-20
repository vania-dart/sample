import 'package:vania/service_provider.dart';
import 'package:vania/vania.dart' show env;
import 'package:vania_template_project/features/auth/providers/auth_route_service_provider.dart';
import 'package:vania_template_project/config/database.dart';

import 'auth.dart';
import 'cors.dart';

Map<String, dynamic> config = {
  'name': env('APP_NAME'),
  'url': env('APP_URL'),
  'cors': cors,
  'auth': authConfig,
  'csrf_except': ['*'],
  'database': database,
  'providers': <ServiceProvider>[
    AuthRouteServiceProvider(),
  ],
};
