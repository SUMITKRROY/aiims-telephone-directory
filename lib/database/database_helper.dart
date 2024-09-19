
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {


  // database name
  static String? _databaseName = "telePhone.db";

  // database version
  static int _databaseVersion = 1;

// Singleton pattern
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  factory DatabaseHelper() => _databaseHelper;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, _databaseName);

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: _databaseVersion,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {DeviceInfoTable} TABLE statement on the database.
    // await db.execute(LoggerListTable.CREATE);
    // await db.execute(AppTable.CREATE);
    // await db.execute(UserTable.CREATE);
    // await db.execute(LoginTable.CREATE);
    // await db.execute(CycleTable.CREATE);
    // await db.execute(ProfileTable.CREATE);
  }

  // UPGRADE DATABASE TABLES
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      switch (oldVersion) {
        case 1:
          // you can execute drop table and create table
          //db.execute("ALTER TABLE tb_name ADD COLUMN newCol TEXT");
          break;
      }
    }
  }
}
