import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/turma.dart';

class TurmaRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertTurma(Turma turma) async {
    final db = await _getDatabase();
    return await db.insert('Turma', turma.toMap());
  }

  Future<List<Turma>> getTurmas() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Turma');

    return List.generate(maps.length, (i) {
      return Turma.fromMap(maps[i]);
    });
  }

  Future<int> updateTurma(Turma turma) async {
    final db = await _getDatabase();
    return await db.update(
      'Turma',
      turma.toMap(),
      where: 'idTurma = ?',
      whereArgs: [turma.id],
    );
  }

  Future<int> deleteTurma(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Turma',
      where: 'idTurma = ?',
      whereArgs: [id],
    );
  }
}
