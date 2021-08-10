import 'package:bytebank_persistencia/database/daos/contato_dao.dart';
import 'package:bytebank_persistencia/models/contato.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = "Novo contato";
const _rotuloCampoNome = "Nome completo";
const _rotuloCampoNumero = "Número da conta";
const _textoBotaoCriar = "Criar";

class FormularioNovoContato extends StatefulWidget {
  @override
  _FormularioNovoContatoState createState() => _FormularioNovoContatoState();
}

class _FormularioNovoContatoState extends State<FormularioNovoContato> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final ContatoDAO _contatoDAO = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNome,
              rotulo: _rotuloCampoNome,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Editor(
                inputType: TextInputType.number,
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumero,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    final String nome = _controladorCampoNome.text;
                    final String numeroConta =
                        _controladorCampoNumeroConta.text;
                    final Contato contato = Contato(0, nome, numeroConta);
                    _contatoDAO
                        .salva(contato)
                        .then((id) => Navigator.pop(context));
                  },
                  child: Text(_textoBotaoCriar),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final String rotulo;
  final TextEditingController controlador;
  final TextInputType inputType;

  Editor({this.rotulo, this.controlador, this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType != null ? inputType : TextInputType.text,
      controller: controlador,
      decoration: InputDecoration(labelText: rotulo),
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}
