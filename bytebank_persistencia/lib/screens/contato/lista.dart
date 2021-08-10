import 'package:bytebank_persistencia/database/daos/contato_dao.dart';
import 'package:bytebank_persistencia/models/contato.dart';
import 'package:bytebank_persistencia/screens/contato/formulario_criacao.dart';
import 'package:flutter/material.dart';

// FutureBuilder -> permite trabalhar com dados dinâmicos
// em Widgets Stateless (ListView, por exemplo);
// Retorna um Future com os dados e é executado de forma assíncrona.

class ListaContatos extends StatefulWidget {
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final ContatoDAO _contatoDAO = ContatoDAO();

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: FutureBuilder<List<Contato>>(
          initialData: List(),
          future: _contatoDAO.procuraTodos(),
          builder: (contexto, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Carregando...")
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contato> contatos = snapshot.data;
                return ListView.builder(
                  itemBuilder: (contexto, indice) {
                    final Contato contato = contatos[indice];
                    return _ItemContato(contato);
                  },
                  itemCount: contatos.length,
                );
                break;
            }
            return Text("Erro desconhecido");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(contexto)
              .push(
                MaterialPageRoute(
                  builder: (contexto) => FormularioNovoContato(),
                ),
              )
              .then((value) => this.setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;

  _ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroConta,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
