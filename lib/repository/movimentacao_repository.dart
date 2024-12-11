import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/movimentacao.dart';

class MovimentacaoRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertMovimentacao(Movimentacao movimentacao) async {
    final db = await _getDatabase();
    return await db.insert('Movimentacao', movimentacao.toMap());
  }

  Future<List<Movimentacao>> getMovimentacoes() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Movimentacao');

    return List.generate(maps.length, (i) {
      return Movimentacao.fromMap(maps[i]);
    });
  }

  Future<int> updateMovimentacao(Movimentacao movimentacao) async {
    final db = await _getDatabase();
    return await db.update(
      'Movimentacao',
      movimentacao.toMap(),
      where: 'idMovimentacao = ?',
      whereArgs: [movimentacao.id],
    );
  }

  Future<int> deleteMovimentacao(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Movimentacao',
      where: 'idMovimentacao = ?',
      whereArgs: [id],
    );
  }
}
