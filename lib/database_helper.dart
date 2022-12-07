import 'package:tugas7/mahasiswa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  // ignore: unused_field
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'mahasiswas';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'mahasiswa_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, npm TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertMahasiswa(Mahasiswa mahasiswa) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      mahasiswa.toMap(),
    );
  }

  Future<List<Mahasiswa>> getMahasiswas() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Mahasiswa.fromMap(res)).toList();
  }

  Future<void> deleteMahasiswa(int id) async {
    final Database db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateMahasiswa(Mahasiswa mahasiswa) async {
    final Database db = await database;
    await db.update(_tableName, mahasiswa.toMap(),
        where: 'id = ?', whereArgs: [mahasiswa.id]);
  }
}
