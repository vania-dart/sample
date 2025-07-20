import 'package:mongo_dart/mongo_dart.dart';
import 'package:vania_template_project/database/mongodb/mongo_db_connection.dart';

class User {
  final ObjectId? id;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? email;
  final String? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  String collectionName = 'users';

  DbCollection get collection => MongoDBConnection().collection(collectionName);

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: ObjectId.fromHexString(json['_id']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['password'],
      email: json['email'],
      avatar: json['avatar'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id?.oid;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['avatar'] = avatar;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['deleted_at'] = deletedAt?.toIso8601String();
    return data;
  }

  Future<List<User>> all() async {
    List<Map<String, dynamic>> data =
        await collection.find(where.eq('deleted_at', null)).toList();
    return data.map((e) => User.fromJson(e)).toList();
  }

  Future<bool> exists() async {
    final exists = await collection.findOne(
      where.eq('_id', id).exists('_id'),
    );
    if (exists != null) {
      return true;
    }
    return false;
  }

  Future<User?> findById() async {
    Map<String, dynamic>? data = await collection.findOne(
      where.id(
        id!,
      ),
    );
    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<User> create() async {
    await collection.insert(toMap());
    User? user = await findById();
    return user ?? User();
  }

  Future<User> save() async {
    bool existsUser = await exists();

    if (existsUser) {
      await update('_id', id.toString());
    } else {
      await create();
    }

    return this;
  }

  Future<User> update(
    String coulmn,
    String value, [
    Map<String, dynamic>? mapData,
  ]) async {
    ModifierBuilder builder = ModifierBuilder();
    mapData = mapData ?? toMap();
    mapData['updated_at'] = DateTime.now().toIso8601String();
    mapData.remove("_id");
    mapData.remove("created_at");
    mapData.forEach((key, val) {
      if (val != null) {
        builder.set(key, val);
      }
    });
    await collection.update(
      where.eq(coulmn, ObjectId.fromHexString(value)),
      builder,
    );
    return this;
  }

  Future<bool> delete() async {
    await collection.update(
      where.eq('_id', id),
      modify.set('deleted_at', DateTime.now()),
    );
    return true;
  }
}
