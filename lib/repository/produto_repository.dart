import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/produto.dart';

class ProdutoRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertProduto(Produto produto) async {
    final db = await _getDatabase();
    return await db.insert('Produtos', produto.toMap());
  }

  Future<List<Produto>> getProdutos() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Produtos');

    return List.generate(maps.length, (i) {
      return Produto.fromMap(maps[i]);
    });
  }

  Future<int> updateProduto(Produto produto) async {
    final db = await _getDatabase();
    return await db.update(
      'Produtos',
      produto.toMap(),
      where: 'idProdutos = ?',
      whereArgs: [produto.id],
    );
  }

  Future<int> deleteProduto(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Produtos',
      where: 'idProdutos = ?',
      whereArgs: [id],
    );
  }
}
