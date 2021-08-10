import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/components/localization/i18n_messages_state.dart';
import 'package:bytebank/http/webclients/i18n_webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

class I18NMessageCubit extends Cubit<I18NMessagesState> {
  final LocalStorage storage =
      new LocalStorage("local_unsecure_version_1.json");
  final String _viewKey;

  I18NMessageCubit(this._viewKey) : super(InitI18NMessagesState());

  reload(I18NWebClient client) async {
    emit(LoadingI18NMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    if (items != null) {
      LoadedI18NMessagesState(I18NMessages(items));
      return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    final state = LoadedI18NMessagesState(I18NMessages(messages));
    emit(state);
  }
}
