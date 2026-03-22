import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterSqliteController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'sqflite is Flutter\'s SQLite plugin for storing structured, relational data locally. It supports full SQL queries, transactions, and migrations. Ideal for apps that need complex data querying and filtering.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   sqflite: ^2.3.0
#   path: ^1.8.3

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }
}''';
  String createCode = '''// Create tables
Future<void> _onCreate(Database db, int version) async {
  await db.execute("""
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT UNIQUE NOT NULL,
      age INTEGER,
      created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  """);

  await db.execute("""
    CREATE TABLE posts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER NOT NULL,
      title TEXT NOT NULL,
      content TEXT,
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    )
  """);

  // Create index for faster queries
  await db.execute(
    'CREATE INDEX idx_posts_user_id ON posts(user_id)',
  );
}

Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  if (oldVersion < 2) {
    // Migration: add avatar_url column to users
    await db.execute('ALTER TABLE users ADD COLUMN avatar_url TEXT');
  }
}''';
  String insertCode = '''// INSERT operations
Future<int> insertUser(Map<String, dynamic> user) async {
  final db = await database;
  return await db.insert(
    'users',
    user,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// Usage
final userId = await dbHelper.insertUser({
  'name': 'Alice',
  'email': 'alice@example.com',
  'age': 30,
});

// Batch insert
Future<void> insertMultipleUsers(List<Map<String, dynamic>> users) async {
  final db = await database;
  final batch = db.batch();
  for (final user in users) {
    batch.insert('users', user);
  }
  await batch.commit(noResult: true);
}

// Transaction
Future<void> transferData() async {
  final db = await database;
  await db.transaction((txn) async {
    await txn.delete('temp_users');
    final users = await txn.query('users');
    for (final user in users) {
      await txn.insert('archive_users', user);
    }
  });
}''';
  String queryCode = '''// SELECT / QUERY operations
Future<List<Map<String, dynamic>>> getAllUsers() async {
  final db = await database;
  return await db.query(
    'users',
    orderBy: 'name ASC',
    limit: 50,
  );
}

// Query with WHERE clause
Future<Map<String, dynamic>?> getUserById(int id) async {
  final db = await database;
  final results = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
  return results.isNotEmpty ? results.first : null;
}

// Raw SQL query
Future<List<Map<String, dynamic>>> searchUsers(String keyword) async {
  final db = await database;
  return await db.rawQuery(
    'SELECT * FROM users WHERE name LIKE ? OR email LIKE ?',
    ['%\$keyword%', '%\$keyword%'],
  );
}

// JOIN query
Future<List<Map<String, dynamic>>> getUsersWithPosts() async {
  final db = await database;
  return await db.rawQuery("""
    SELECT u.name, u.email, COUNT(p.id) as post_count
    FROM users u
    LEFT JOIN posts p ON p.user_id = u.id
    GROUP BY u.id
    ORDER BY post_count DESC
  """);
}''';
  String deleteCode = '''// UPDATE and DELETE
Future<int> updateUser(int id, Map<String, dynamic> values) async {
  final db = await database;
  return await db.update(
    'users',
    values,
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<int> deleteUser(int id) async {
  final db = await database;
  return await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteAllUsers() async {
  final db = await database;
  await db.delete('users');
  // Reset auto-increment
  await db.rawDelete('DELETE FROM sqlite_sequence WHERE name = ?', ['users']);
}''';
  List<String> tips = [
    'Always use parameterized queries (?) to prevent SQL injection',
    'Use transactions for operations that must succeed or fail together',
    'Create indexes on columns used in WHERE clauses for better performance',
    'Use batch operations when inserting/updating many rows at once',
    'Handle database migrations carefully in onUpgrade — test before release',
    'Consider Drift (formerly moor) for a type-safe SQL library with ORM features',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterSqlite,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterSqlite;
    update();
    super.onInit();
  }

  void scrollToTop() => scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
