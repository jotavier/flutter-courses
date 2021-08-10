/*
  * Sempre utilizar o SetState para atualizar o conteúdo de um
  * Widget Stateless.
*/

import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

/*
  * Objetos que não terão seu estado modificado, ficam no Widget.
  * Objetos que terão seu estado modificado, ficam no State.
*/

const _tituloAppbar = "Transferências";

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) =>
              ItemTransferencia(widget._transferencias[indice])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormularioTransferencia()))
              .then((transferencia) => _atualiza(transferencia));
        },
      ),
    );
  }

  void _atualiza(Transferencia transferencia) {
    setState(() {
      if (transferencia == null) return;
      widget._transferencias.add(transferencia);
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta),
      ),
    );
  }
}
