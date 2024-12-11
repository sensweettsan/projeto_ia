import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/cargo.dart';

class CargoRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertCargo(Cargo cargo) async {
    final db = await _getDatabase();
    return await db.insert('Cargos', cargo.toMap());
  }

  Future<List<Cargo>> getCargos() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Cargos');

    return List.generate(maps.length, (i) {
      return Cargo.fromMap(maps[i]);
    });
  }

  Future<int> updateCargo(Cargo cargo) async {
    final db = await _getDatabase();
    return await db.update(
      'Cargos',
      cargo.toMap(),
      where: 'idCargos = ?',
      whereArgs: [cargo.id],
    );
  }

  Future<int> deleteCargo(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Cargos',
      where: 'idCargos = ?',
      whereArgs: [id],
    );
  }
}
