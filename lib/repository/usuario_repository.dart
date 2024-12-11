import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/usuario.dart';

class UsuarioRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
    );
  }

  Future<int> insertUsuario(Usuario usuario) async {
    final db = await _getDatabase();
    return await db.insert('Usuarios', usuario.toMap());
  }

  Future<List<Usuario>> getUsuarios() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Usuarios');

    return List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
  }

  Future<int> updateUsuario(Usuario usuario) async {
    final db = await _getDatabase();
    return await db.update(
      'Usuarios',
      usuario.toMap(),
      where: 'idUsuarios = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> deleteUsuario(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'Usuarios',
      where: 'idUsuarios = ?',
      whereArgs: [id],
    );
  }
}
