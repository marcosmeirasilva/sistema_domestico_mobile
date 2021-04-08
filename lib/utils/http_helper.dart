import 'package:http/http.dart' as http;
import 'package:sistema_domestico_mobile/login/usuario.dart';

Future<http.Response> get(Uri url) async {
  final headers = await _headers();
  var response = await http.get(url, headers: headers);
  return response;
}

Future<http.Response> post(Uri url, {body}) async {
  final headers = await _headers();
  var response = await http.post(url, body: body, headers: headers);
  return response;
}

Future<http.Response> put(Uri url, {body}) async {
  final headers = await _headers();
  var response = await http.put(url, body: body, headers: headers);
  return response;
}

Future<http.Response> delete(Uri url) async {
  final headers = await _headers();
  var response = await http.delete(url, headers: headers);
  return response;
}

Future<Map<String, String>> _headers() async {
  Usuario user = await Usuario.get();

  // Se o token do usuário for nulo eu envio um token falso para fazer a validação na API.
  String tokenFalso = "12345";

  if (user != null) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization-Token": "Bearer ${user.token}"
    };
    return headers;
  } else {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization-Token": "Bearer $tokenFalso"
    };
    return headers;
  }
}
