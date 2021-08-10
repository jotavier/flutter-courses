import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

const MESSAGES_URI =
    "https://gist.githubusercontent.com/jotavier/2443ad986b30dbbb40f71006482937d9/raw/721f2866414371b7d4f79494dc3797ecbd1ee266/";

class I18NWebClient {
  final String _viewKey;

  I18NWebClient(this._viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get("$MESSAGES_URI$_viewKey.json");
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}
