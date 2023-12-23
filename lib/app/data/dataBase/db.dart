import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static const version = 1;
  static const _dataBAseName = 'GastoCerto';

  static const String idPrimaryKey = "id INTEGER PRIMARY KEY,";
  static const String idPrimaryKeyAutoInc =
      "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,";

  DBProvider._();

  static final DBProvider _instance = DBProvider._();
  factory DBProvider() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final String dataBasePath = await getDatabasesPath();
    final String path = join(dataBasePath, "database");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: onDatabaseDowngradeDelete,
      onConfigure: _onConfigure,
      onOpen: _onConfigure,
    );
  }

  createTransactionTable(Database db) async {
    const sql = ''' CREATE TABLE transactions
    (
      $idPrimaryKeyAutoInc
      description TEXT,
      expense REAL,
      income REAL,
      date DATETIME
    )''';
    await db.execute(sql);
  }

  createReceitaTable(Database db) async {
    const sql = ''' CREATE TABLE receita
    (
      $idPrimaryKeyAutoInc
      valor REAL,
      descricao TEXT,
      data DATETIME
    )''';
    await db.execute(sql);
  }

  createTableUsuario(Database db) async {
    const sql = '''CREATE TABLE usuario
    (
      $idPrimaryKeyAutoInc
      usuarioId INTEGER,
      nome TEXT,
      idade INTEGER,
      email TEXT,
      telefone TEXT
    )''';
    await db.execute(sql);
  }

  createTableExtrato(Database db) async {
    const sql = ''' CREATE TABLE extrato
    (
      $idPrimaryKeyAutoInc
      data_operacao DATETIME,
      tipo_operacao TEXT,
      valor REAL,
      quantidade INTEGER
    )''';
    await db.execute(sql);
  }

  _onCreate(Database db, int version) async {
    await createTransactionTable(db);
    // await createReceitaTable(db);
    // await createTableUsuario(db);
    // await createTableExtrato(db);
//
    await _newVersions(db: db);
    log(db.toString());
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await _newVersions(db: db, oldVersion: oldVersion, newVersion: newVersion);
  }

  Future<void> _newVersions({
    Database? db,
    int oldVersion = 0,
    int newVersion = 0,
  }) async {
    List<String> migrations = [];

    /*
      #BlocoDeVersionamento
      Adicionar conforme número da versão a ser atualizada
      Caso o database esteja sendo criado, todos os comandos serão executados respectivamente e ordenadamente
      Lembrando q
      Obs: além de deixar o número correto da versão na condição, também deixar em ordem cronológica
    */

    //Versão 2
    //if (newVersion <= 2)
    //  db.execute('''ALTER TABLE pedido ADD COLUMN coluna INTEGER ''');

    //Execução dos migrations - não é necessário alteração
    migrations.forEach((migration) {
      db!.execute(migration);
    });
  }

  Future<void> _onConfigure(Database db) async {
    await db.rawQuery('PRAGMA journal_mode=WAL');
  }
}
