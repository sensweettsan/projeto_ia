import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/medida.dart';

class MedidaRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertMedida(Medida medida) async {
    final db = await _getDatabase();
    return await db.insert('Medida', medida.toMap());
  }

  Future<List<Medida>> getMedidas() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Medida');

    return List.generate(maps.length, (i) {
      return Medida.fromMap(maps[i]);
    });
  }

  Future<int> updateMedida(Medida medida) async {
    final db = await _getDatabase();
    return await db.update(
      'Medida',
      medida.toMap(),
      where: 'idMedida = ?',
      whereArgs: [medida.id],
    );
  }

  Future<int> deleteMedida(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Medida',
      where: 'idMedida = ?',
      whereArgs: [id],
    );
  }
}
