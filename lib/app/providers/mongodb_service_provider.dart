import 'package:vania/service_provider.dart';
import 'package:vania_template_project/database/mongodb/mongo_db_connection.dart';

class MongodbServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    await MongoDBConnection().init();
  }
}
