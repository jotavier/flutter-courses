import 'package:bytebank_persistencia/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContatoDAO {
  static const String criaTabela = 'CREATE TABLE $_nomeTabela('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta TEXT)';

  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  Future<int> salva(Contato contato) async {
    final Database bancoDeDados = await pegaBancoDeDados();
    Map<String, dynamic> mapeamentoContato = _paraMapeamento(contato);
    return bancoDeDados.insert(_nomeTabela, mapeamentoContato);
  }

  Map<String, dynamic> _paraMapeamento(Contato contato) {
    final Map<String, dynamic> mapeamentoContato = Map();
    mapeamentoContato[_nome] = contato.nome;
    mapeamentoContato[_numeroConta] = contato.numeroConta;
    return mapeamentoContato;
  }

  Future<List<Contato>> procuraTodos() async {
    final Database bancoDeDados = await pegaBancoDeDados();
    final List<Map<String, dynamic>> resultado =
        await bancoDeDados.query(_nomeTabela);
    List<Contato> contatos = _paraLista(resultado);
    return contatos;
  }

  List<Contato> _paraLista(List<Map<String, dynamic>> resultado) {
      final List<Contato> contatos = List();
    for (Map<String, dynamic> linha in resultado) {
      final Contato contato = Contato(
        linha[_id],
        linha[_nome],
        linha[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
