import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  static final DbService _instance = DbService._internal();
  factory DbService() => _instance;

  Database? _database;

  DbService._internal();

  // Inicializa o banco de dados e cria as tabelas
  Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'mydb.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Cargos (
            idCargos INTEGER PRIMARY KEY AUTOINCREMENT,
            Cargo TEXT NOT NULL,
            Matricula TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Produtos (
            idProdutos INTEGER PRIMARY KEY AUTOINCREMENT,
            Nome TEXT NOT NULL,
            Medida INTEGER NOT NULL,
            Local TEXT NOT NULL,
            Entrada INTEGER NOT NULL,
            Saida INTEGER NOT NULL,
            Saldo INTEGER NOT NULL,
            Codigo TEXT NOT NULL,
            DataEntrada TEXT NOT NULL,
            FOREIGN KEY (Medida) REFERENCES Medida(idMedida)
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Medida (
            idMedida INTEGER PRIMARY KEY AUTOINCREMENT,
            Medida TEXT NOT NULL,
            Descricao TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Cursos (
            idCursos INTEGER PRIMARY KEY AUTOINCREMENT,
            Nome TEXT NOT NULL,
            Turma TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Turma (
            idTurma INTEGER PRIMARY KEY AUTOINCREMENT,
            Turma TEXT NOT NULL,
            Instrutor TEXT NOT NULL,
            Curso INTEGER NOT NULL,
            FOREIGN KEY (Curso) REFERENCES Cursos(idCursos)
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Usuarios (
            idUsuarios INTEGER PRIMARY KEY AUTOINCREMENT,
            Nome TEXT NOT NULL,
            Senha TEXT NOT NULL,
            Telefone TEXT NOT NULL,
            Email TEXT NOT NULL,
            Endereco TEXT NOT NULL,
            Cargo INTEGER NOT NULL,
            FOREIGN KEY (Cargo) REFERENCES Cargos(idCargos)
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Movimentacao (
            idMovimentacao INTEGER PRIMARY KEY AUTOINCREMENT,
            idProdutos INTEGER NOT NULL,
            idTurma INTEGER NOT NULL,
            idUsuarios INTEGER NOT NULL,
            DataSaida TEXT NOT NULL,
            FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos),
            FOREIGN KEY (idTurma) REFERENCES Turma(idTurma),
            FOREIGN KEY (idUsuarios) REFERENCES Usuarios(idUsuarios)
          );
        ''');
      },
    );
  }

  // Fechar o banco de dados
  Future<void> close() async {
    final db = await getDatabase();
    db.close();
  }
}
