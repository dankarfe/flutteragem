import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutteragem/filmes.dart';
import 'package:flutteragem/list.dart';

class BancoHelper {
  static BancoHelper? _bancoHelper;
  static Database? _database;

  BancoHelper._createInstance();

  factory BancoHelper() {
    if (_bancoHelper == null) {
      _bancoHelper = BancoHelper._createInstance();
    }
    return _bancoHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path},dbflutteragem.db';
    var listaDatabase =
    await openDatabase(path, version: 1, onCreate: _createDB);
    return listaDatabase;
  }


  void _createDB(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS ${Filmes.TABLE_FILMES}'
        ' (${Filmes.COL_ID_FILME} integer primary key autoincrement,'
        ' ${Filmes.COL_NOME_FILME} text not null,'
        ' ${Filmes.COL_GENERO_FILME} text not null,'
        ' ${Filmes.COL_DATALANCAMENTO_FILME} integer not null,'
        ' ${Filmes.COL_DIRETOR_FILME} text not null,'
        ' ${Filmes.COL_SINOPSE_FILME} text'
    );
  }
  Future<Lista> insert(Lista lista) async {
    Database? db = await this.database;
    lista.id = await db!.insert(Filmes.TABLE_FILMES, lista.toMap());
    print(lista.nome);
    return lista;
  }

  Future<List<Lista>> getAllLista() async {
    Database? db = await this.database;

    var resultado = await db!.query(Filmes.TABLE_FILMES);
    List<Lista> lista = resultado.isNotEmpty
        ? resultado.map((e) => Lista.fromMap(e)).toList()
        : [];
    return lista;
  }

  Future close() async {
    Database? db = await this.database;
    db!.close();
  }
}
