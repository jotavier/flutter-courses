import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

const _titutloAppbar = "Criando transferência";
const _dicaNumeroConta = "0000";
const _rotuloNumeroConta = "Número da conta";
const _dicaValorTransferencia = "0.00";
const _rotuloValorTransferencia = "Valor";
const _textoBotaoConfirmar = "Confirmar";

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValorTransferencia =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titutloAppbar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaNumeroConta,
                rotulo: _rotuloNumeroConta),
            Editor(
                controlador: _controladorCampoValorTransferencia,
                dica: _dicaValorTransferencia,
                rotulo: _rotuloValorTransferencia,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final double valorTransacao =
        double.tryParse(_controladorCampoValorTransferencia.text);
    if (numeroConta == null || valorTransacao == null) return;
    Navigator.pop(context, Transferencia(valorTransacao, numeroConta));
  }
}
