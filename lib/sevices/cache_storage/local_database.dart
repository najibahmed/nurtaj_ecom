

import 'package:path/path.dart' as Path;
import 'package:nurtaj_ecom_home/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  static const String createTableUser = '''create table $collectionUser(
  $userFieldId integer primary key autoincrement,
  $userFieldEmail text,
  $userFieldImageUrl text)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'user_db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(createTableUser);

    });
  }
  static Future<int> insertUser(UserModel userModel) async {
    final db = await open();
    return db.insert(collectionUser, userModel.toMap());
}
  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(createTableUser,
      where: '$userFieldEmail = ?', whereArgs: [email],);
    if(mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<UserModel> getUserById(int id) async {
    final db = await open();
    final mapList = await db.query(collectionUser,
      where: '$userFieldId = ?', whereArgs: [id],);
    return UserModel.fromMap(mapList.first);
  }
  static Future<List<UserModel>> getAllUser() async {
    final db = await open();
    final mapList = await db.query(collectionUser);
    return List.generate(mapList.length, (index) =>
        UserModel.fromMap(mapList[index]));
  }
}