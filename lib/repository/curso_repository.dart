import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/curso.dart';

class CursoRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertCurso(Curso curso) async {
    final db = await _getDatabase();
    return await db.insert('Cursos', curso.toMap());
  }

  Future<List<Curso>> getCursos() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Cursos');

    return List.generate(maps.length, (i) {
      return Curso.fromMap(maps[i]);
    });
  }

  Future<int> updateCurso(Curso curso) async {
    final db = await _getDatabase();
    return await db.update(
      'Cursos',
      curso.toMap(),
      where: 'idCursos = ?',
      whereArgs: [curso.id],
    );
  }

  Future<int> deleteCurso(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Cursos',
      where: 'idCursos = ?',
      whereArgs: [id],
    );
  }
}
