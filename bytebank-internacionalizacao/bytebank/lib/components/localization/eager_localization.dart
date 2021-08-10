import 'package:bytebank/components/localization/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewI18N {
  String _language;

  ViewI18N(BuildContext context) {
    /*
    * O problema dessa abordagem é o rebuild quando a linguagem for trocada,
    * é necessário verificar o que deve ser reconstruido quando ocorrer a troca
    * do CurrentLocaleCubit.
    * Em geral, é comum reinicializar o sistema ou voltar para a tela inicial,
    * reconstruindo tudo.
    * */
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String localize(Map<String, String> map) {
    assert(map != null);
    assert(map.containsKey(_language));
    return map[_language];
  }
}
