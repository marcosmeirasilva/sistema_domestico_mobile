import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/utils/api_response.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = Uri.parse(
          'https://www.osacerdote.com.br/sistemadomesticoweb/api/usuarios_api/login_api');

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"email": login, "senha": senha};

      String body = json.encode(params);
      print(">> $body");

      var response = await http.post(url, body: body, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
