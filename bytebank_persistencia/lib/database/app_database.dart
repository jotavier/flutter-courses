import 'package:bytebank_persistencia/database/daos/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> pegaBancoDeDados() async {
  final String caminho = join(await getDatabasesPath(), "bytebank.db");

  return openDatabase(caminho, onCreate: (banco, versao) {
    banco.execute(ContatoDAO.criaTabela);
  }, version: 1);
}
