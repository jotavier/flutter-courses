import 'file:///C:/Users/T-Gamer/Documents/Estudos/Flutter/bytebank-internacionalizacao/bytebank/lib/components/localization/i18n_loading_view.dart';
import 'package:bytebank/components/localization/locale.dart';
import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/dashboard/dashboard_container.dart';
import 'file:///C:/Users/T-Gamer/Documents/Estudos/Flutter/bytebank-internacionalizacao/bytebank/lib/screens/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/container.dart';
import 'screens/dashboard/dashboard_view.dart';

void main() {
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // na prática evitar log do genero, pois pode vazar informações sensíveis para o log
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebankTheme,
      home: LocalizationContainer(
        child: DashboardContainer(),
      ),
    );
  }
}
